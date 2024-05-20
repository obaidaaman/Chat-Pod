import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:space_pod/screens/auth/login/repo/auth_logrepo.dart';

part 'auth_log_event.dart';

part 'auth_log_state.dart';

class AuthLogBloc extends Bloc<AuthLogEvent, AuthLogState> {
  AuthLogBloc() : super(AuthLogInitial()) {
    on<SignInButtonClickedEvent>(authLogSuccessEvent);
    on<SignOutButtonClickedEvent>(authLogOutEvent);
  }

  FutureOr<void> authLogSuccessEvent(
      SignInButtonClickedEvent event, Emitter<AuthLogState> emit) {
    emit(AuthLogLoadingState());
    if (event.email != '' && event.password != '') {
      var response = AuthLogRepo.logInUser(event.email, event.password);
      if(response != null){
        emit(AuthLogSuccessState());
      }
      else{

      }

    } else {
      emit(AuthLogErrorState(error: "Please Enter Valid Email and Password"));
    }
  }

  FutureOr<void> authLogOutEvent(SignOutButtonClickedEvent event, Emitter<AuthLogState> emit) async {
    emit(AuthLogLoadingState());
      try{
       await FirebaseAuth.instance.signOut();

        emit(AuthLogOutSuccessState());
      }  on FirebaseAuthException catch(e){

      }


  }
}
