part of 'chat_bloc.dart';

@immutable
sealed class ChatEvent {}

class ChatGenerateNewTexMessageEvent extends ChatEvent{
final String inputMessage;

  ChatGenerateNewTexMessageEvent({required this.inputMessage});
}