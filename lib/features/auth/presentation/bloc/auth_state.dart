class AuthState {}

class AuthInitial extends AuthState {}

// Login

class LoginLoadingState extends AuthState {}

class LoginSuccessState extends AuthState {}

// Register

class RegisterLoadingState extends AuthState {}

class RegisterSuccessState extends AuthState {}

// error

class AuthErrorState extends AuthState {
  late final String error;
  AuthErrorState(this.error);
}
