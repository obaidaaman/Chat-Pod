part of 'auth_log_bloc.dart';

@immutable
sealed class AuthLogState {}

final class AuthLogInitial extends AuthLogState {}

final class AuthLogSuccessState extends AuthLogState{


}
final class AuthLogErrorState extends AuthLogState{

  final String error;

  AuthLogErrorState({required this.error});
}
final class AuthLogLoadingState extends AuthLogState{

}
final class AuthLogOutSuccessState extends AuthLogState{

}