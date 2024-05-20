part of 'profile_detail_bloc.dart';

@immutable
sealed class ProfileDetailState {}

final class ProfileDetailInitial extends ProfileDetailState {}

final class EditProfileClickedState extends ProfileDetailState{

}
final class LogOutClickedState extends ProfileDetailState{

}

final class AddImageAddedSuccessState extends ProfileDetailState{

}
final class DetailsLoadedState extends ProfileDetailState{

  final String email ;
  final String fullName;

  DetailsLoadedState(this.email, this.fullName);
}
