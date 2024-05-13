part of 'auth_sign_bloc.dart';

@immutable
sealed class AuthSignState {}

final class AuthSignInitial extends AuthSignState {}

final class AuthSignUpSuccessState extends AuthSignState{

  final User user;

  AuthSignUpSuccessState(this.user);

}



final class AuthSignUpErrorState extends AuthSignState{
final String message;

  AuthSignUpErrorState(this.message);


}

final class AuthSignUpLoadingState extends AuthSignState{

}