part of 'edit_profile_bloc.dart';

@immutable
sealed class EditProfileState {}

final class EditProfileInitial extends EditProfileState {}

final class ProfileSavedState extends EditProfileState{

}

class EditProfileLoadingState extends EditProfileState{

}

class EditProfileLoadedState extends EditProfileState{
  final String name;
  final String email;
  final String password;


  EditProfileLoadedState(this.name, this.email, this.password);

}

class EditProfileError extends EditProfileState {
  final String message;

  EditProfileError(this.message);
}

class EditProfileSavedState extends EditProfileState{

}

class EditProfileSavedLoadingState extends EditProfileState{

}