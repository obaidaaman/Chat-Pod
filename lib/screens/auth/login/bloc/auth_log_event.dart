part of 'auth_log_bloc.dart';

@immutable
sealed class AuthLogEvent {}

class SignInButtonClickedEvent extends AuthLogEvent{

  final String email;
  final String password;

  SignInButtonClickedEvent({required this.email, required this.password});
}

class SignOutButtonClickedEvent extends AuthLogEvent{

}