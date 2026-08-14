import 'package:bloc/bloc.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:elan/data/repository/auth_repository.dart';
import 'package:elan/data/service/cookie_refresh_service.dart';
import 'package:elan/domain/login_error_response/login_error_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';
part 'auth_bloc.g.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository repository;
  final PersistCookieJar cookieJar;
  final CookieRefreshService cookieRefreshService;

  AuthBloc(this.repository, this.cookieJar, this.cookieRefreshService) : super(const AuthState()) {
    on<_Login>(_onLogin);
    on<_Refresh>(_onRefresh);
    on<_Logout>(_onLogout);
  }

  Future<void> _onLogin(_Login event, Emitter<AuthState> emit) async {
    emit(state.copyWith(status: AuthStatus.loading));

    final result = await repository.login(
      email: event.email,
      password: event.password,
    );

    result.fold(
      (l) => emit(state.copyWith(
          status: AuthStatus.error,
          errorResponse: l,
          statusCode: l.statusCode)),
      (r) {
        if (r.statusCode == 200) {
          // Start periodic cookie refresh after successful login
          cookieRefreshService.startPeriodicRefresh();
          
          emit(state.copyWith(
              status: AuthStatus.success, statusCode: r.statusCode));
        } else {
          emit(state.copyWith(
            status: AuthStatus.error,
          ));
        }
      },
    );
  }

  Future<void> _onRefresh(_Refresh event, Emitter<AuthState> emit) async {
    emit(const AuthState());
    emit(state.copyWith(status: AuthStatus.loading));

    final result = await repository.refresh();

    result.fold(
      (l) => emit(
          state.copyWith(status: AuthStatus.error, statusCode: l.statusCode)),
      (r) {
        if (r.statusCode == 200) {
          emit(state.copyWith(
              status: AuthStatus.success, statusCode: r.statusCode));
        } else {
          emit(state.copyWith(
            status: AuthStatus.refreshFailed,
          ));
        }
      },
    );
  }

  Future<void> _onLogout(_Logout event, Emitter<AuthState> emit) async {
    emit(const AuthState());
    
    // Stop periodic cookie refresh before logout
    cookieRefreshService.stopPeriodicRefresh();
    
    final result = await repository.logOut();
    try {
      await cookieJar.deleteAll();
    } catch (_) {}
    result.fold(
          (l) => emit(
          state.copyWith(status: AuthStatus.error, statusCode: l.statusCode)),
          (r) {
        if (r.statusCode == 200 || r.statusCode == 204) {
          emit(state.copyWith(
              status: AuthStatus.logout, statusCode: r.statusCode));
        } else {
          emit(state.copyWith(
            status: AuthStatus.error,
          ));
        }
      },
    );
  }
}
