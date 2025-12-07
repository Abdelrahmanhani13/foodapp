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

final class ProfileLoading extends AuthenticationState {}
final class ProfileSuccess extends AuthenticationState {
  final UserModel user;
  ProfileSuccess(this.user);
}
final class ProfileFailure extends AuthenticationState {
  final String errorMessage;
  ProfileFailure(this.errorMessage);
}

final class LogoutLoading extends AuthenticationState {}

final class LogoutSuccess extends AuthenticationState {}
final class LogoutFailure extends AuthenticationState {
  final String errorMessage;
  LogoutFailure(this.errorMessage);
} 