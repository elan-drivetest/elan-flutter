import 'package:bloc/bloc.dart';
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
          status: StripeOnboardingStatus.error, errorResponse: l)),
      (r) => emit(state.copyWith(
          status: StripeOnboardingStatus.success, onboardResponse: r)),
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
