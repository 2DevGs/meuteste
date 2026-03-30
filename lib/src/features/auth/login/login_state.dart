
enum LoginStateStatus {
  initial,
  success,
  error,
}

class LoginState {
  final LoginStateStatus status;

  LoginState.initial() : this(status: LoginStateStatus.initial);

  LoginState({required this.status});

  LoginState copyWith({
    LoginStateStatus? status,
  }) {
    return LoginState(
      status: status ?? this.status,
    );
  }
}
