import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:space_pod/screens/profile/repo/user_details_repo.dart';

part 'edit_profile_event.dart';

part 'edit_profile_state.dart';

class EditProfileBloc extends Bloc<EditProfileEvent, EditProfileState> {
  final userId = FirebaseAuth.instance.currentUser!.uid;

  EditProfileBloc() : super(EditProfileInitial()) {
    on<ProfileFetchEvent>(profileFetchEvent);
    on<SaveButtonClickedEvent>(saveButtonClickedEvent);
  }

  FutureOr<void> profileFetchEvent(
      ProfileFetchEvent event, Emitter<EditProfileState> emit) async {


    final details = await UserDetailsRepo.fetchCurrentUserDetails(userId);


    emit(EditProfileLoadedState(
        details['full_name'], details['email'], details['password']
    )
    );
  }

  FutureOr<void> saveButtonClickedEvent(SaveButtonClickedEvent event, Emitter<EditProfileState> emit ) async {

    emit(EditProfileSavedLoadingState());
    var response = await UserDetailsRepo.UpdateCurrentUserDetails(userId, event.name, event.email, event.password);


      emit(EditProfileSavedState());




  }
}
