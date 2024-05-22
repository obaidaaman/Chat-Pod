part of 'edit_profile_bloc.dart';

@immutable
sealed class EditProfileEvent {}


class SaveButtonClickedEvent extends EditProfileEvent{
  final String name;
  final String email;
  final String password;
  final String phoneNo;

  SaveButtonClickedEvent(this.name, this.email, this.password, this.phoneNo);

}

class  ProfileFetchEvent extends EditProfileEvent{


}