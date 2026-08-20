import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:elan/core/log/app_log.dart';
import 'package:elan/core/payout_readiness.dart';
import 'package:elan/data/repository/user_repository.dart';
import 'package:elan/domain/error_response/error_response.dart';
import 'package:elan/domain/instructor_response/instructor_response.dart';
import 'package:elan/domain/stripe_onboard_response/stripe_onboard_response.dart';
import 'package:elan/domain/stripe_onboard_url_response/stripe_onboard_url_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'stripe_onboarding_event.dart';
part 'stripe_onboarding_state.dart';
part 'stripe_onboarding_bloc.freezed.dart';
part 'stripe_onboarding_bloc.g.dart';

@injectable
class StripeOnboardingBloc
    extends Bloc<StripeOnboardingEvent, StripeOnboardingState> {
  final UserRepository repository;

  StripeOnboardingBloc(this.repository) : super(const StripeOnboardingState()) {
    on<_GetInfo>(_onGetInfo);
    on<_OnboardStripe>(_onOnboardStripe);
  }

  Future<void> _onGetInfo(
      _GetInfo event, Emitter<StripeOnboardingState> emit) async {
    emit(state.copyWith(status: StripeOnboardingStatus.initialLoading));

    final result = await repository.getStripeOnboardInfo();

    result.fold(
      (l) => emit(state.copyWith(
          status: StripeOnboardingStatus.infoError,
          errorResponse: l,
          payoutReadiness: PayoutReadinessResolver.fromError(l))),
      (r) => emit(state.copyWith(
          status: StripeOnboardingStatus.success,
          onboardResponse: r,
          payoutReadiness: PayoutReadinessResolver.fromResponse(r))),
    );
  }

  Future<void> _onOnboardStripe(
      _OnboardStripe event, Emitter<StripeOnboardingState> emit) async {
    emit(state.copyWith(status: StripeOnboardingStatus.loading));

    final result = await repository.requestStripeOnboardUrl();

    result.fold(
      (l) => emit(state.copyWith(
          status: StripeOnboardingStatus.error, errorResponse: l)),
      (r) => emit(state.copyWith(
          status: StripeOnboardingStatus.update, onboardUrlResponse: r)),
    );
  }
}

extension StripeOnboardingRefresh on StripeOnboardingBloc {
  /// Runs the status check and waits for it to land.
  ///
  /// `GET /v1/instructors/stripe-onboarding-status` is not a read — server-side
  /// it re-queries Stripe and writes `stripe_account_status`,
  /// `stripe_payouts_enabled` and `profile_completion_percentage` back to the
  /// instructor row (`instructors.service.ts:341-373`). So it is the app's only
  /// way to force the profile Stripe reports and the profile the dashboard
  /// serves back into agreement.
  ///
  /// Callers that then refetch the profile **must await this first**. Firing
  /// both at once looks equivalent and is not: the profile fetch is a local DB
  /// read while this one round-trips to Stripe's API, so the profile always
  /// wins the race and returns the very row this call was about to correct.
  /// That was the bug behind a fully-onboarded instructor still seeing
  /// *"Add A Bank To Get Paid"* and a stale completion percentage.
  ///
  /// Never throws. On timeout the caller proceeds with whatever the server has
  /// — one stale render beats a screen that hangs on Stripe being slow.
  Future<void> refreshStatus({
    Duration timeout = const Duration(seconds: 15),
  }) async {
    add(const StripeOnboardingEvent.getInfo());
    try {
      await stream
          .firstWhere((s) =>
              s.status == StripeOnboardingStatus.success ||
              s.status == StripeOnboardingStatus.infoError)
          .timeout(timeout);
    } on TimeoutException {
      AppLog.d('stripe status refresh timed out; continuing with cached row');
    } on StateError {
      // The bloc closed while we were waiting — the screen is gone, nothing to do.
    }
  }
}
