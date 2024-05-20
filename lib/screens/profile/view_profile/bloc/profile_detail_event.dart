part of 'profile_detail_bloc.dart';

@immutable
sealed class ProfileDetailEvent {}

class EditProfileButtonClickedEvent extends ProfileDetailEvent{

}

class LogOutProfileButtonClickedEvent extends ProfileDetailEvent{

}

class DeleteAccountButtonClickedEvent extends ProfileDetailEvent{

}
class AddImageButtonClickedEvent extends ProfileDetailEvent{

}

class FetchUserEvent extends ProfileDetailEvent{

}
