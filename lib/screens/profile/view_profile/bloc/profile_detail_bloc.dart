import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:space_pod/screens/profile/repo/user_details_repo.dart';

part 'profile_detail_event.dart';
part 'profile_detail_state.dart';

class ProfileDetailBloc extends Bloc<ProfileDetailEvent, ProfileDetailState> {
  ProfileDetailBloc() : super(ProfileDetailInitial()) {

    on<EditProfileButtonClickedEvent>(editProfileButtonClicked);



    on<FetchUserEvent>((event, emit)  async {
      var user = FirebaseAuth.instance.currentUser!.uid.toString();

      Map<String ,dynamic> details =  await UserDetailsRepo.fetchCurrentUserDetails(user) ;

      emit(DetailsLoadedState(details['email'].toString(), details['full_name'].toString()));

    });
    add(FetchUserEvent());
  }

  FutureOr<void> editProfileButtonClicked(EditProfileButtonClickedEvent event, Emitter<ProfileDetailState> emit) {

    emit(EditProfileClickedState());

  }
}
