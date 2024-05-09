import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:space_pod/models/chat_message_model.dart';
import 'package:space_pod/repos/chat_repo.dart';

part 'chat_event.dart';

part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc() : super(ChatSuccessState([])) {
    on<ChatGenerateNewTexMessageEvent>(chatGenerateNewTexMessageEvent);
  }

  List<ChatMessageModel> messages = [];

  FutureOr<void> chatGenerateNewTexMessageEvent(
      ChatGenerateNewTexMessageEvent event, Emitter<ChatState> emit) async {
    messages.add(ChatMessageModel(
        role: 'user', parts: [ChatPartModel(text: event.inputMessage)]));

    emit(ChatSuccessState(messages));

    String generatedText = await SpaceRepo.genenerateChatTextMessage(messages);
    if (generatedText.length > 0) {
      messages.add(ChatMessageModel(
          role: 'model', parts: [ChatPartModel(text: generatedText)]));
      emit(ChatSuccessState(messages));
    }
  }
}
