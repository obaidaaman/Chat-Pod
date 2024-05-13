part of 'auth_sign_bloc.dart';

@immutable
sealed class AuthSignEvent {}


final class SignUpButtonClickedEvent extends AuthSignEvent{

  final String name;
  final String email;
  final String password;

  SignUpButtonClickedEvent({required this.name, required this.email, required this.password});

}