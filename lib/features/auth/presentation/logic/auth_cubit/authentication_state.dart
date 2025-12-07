part of 'authentication_cubit.dart';

@immutable
sealed class AuthenticationState {}

final class AuthenticationInitial extends AuthenticationState {}

final class LoginLoading extends AuthenticationState {}

final class LoginSuccess extends AuthenticationState {
  final UserModel user;
  LoginSuccess(this.user);
}

final class LoginFailure extends AuthenticationState {
  final String errorMessage;
  LoginFailure(this.errorMessage);
}

final class RegisterLoading extends AuthenticationState {}
final class RegisterSuccess extends AuthenticationState {
  final UserModel user;
  RegisterSuccess(this.user);
}
final class RegisterFailure extends AuthenticationState {
  final String errorMessage;
  RegisterFailure(this.errorMessage);
}