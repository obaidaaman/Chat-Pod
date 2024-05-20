import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:space_pod/screens/auth/login/repo/auth_logrepo.dart';

part 'auth_sign_event.dart';

part 'auth_sign_state.dart';

class AuthSignBloc extends Bloc<AuthSignEvent, AuthSignState> {
  AuthSignBloc() : super(AuthSignInitial()) {
    on<SignUpButtonClickedEvent>(signUpButtonClickedEvent);
  }

  FutureOr<void> signUpButtonClickedEvent(SignUpButtonClickedEvent event,
      Emitter<AuthSignState> emit) async {
    emit(AuthSignUpLoadingState());

    if (event.email != '' && event.password != '') {
      try {
        final userCredential =
        await AuthLogRepo.SignUpUser(event.email, event.password);

        if (userCredential != null) {
        final user =  AuthLogRepo.CreateDatabase(event.name, event.email, event.password, FirebaseAuth.instance.currentUser!.uid);
        if(user != null)
          emit(AuthSignUpSuccessState(userCredential.user));
        } else {
          emit(AuthSignUpErrorState('An error occured during signUp'));
        }
      } on FirebaseAuthException catch (e) {
        emit(AuthSignUpErrorState(e.message!));
      }
    } else {
      emit(AuthSignUpErrorState('Please enter email and password'));
    }
  }
}
