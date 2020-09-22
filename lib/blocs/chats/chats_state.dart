part of 'chats_bloc.dart';

abstract class ChatsState {}

class OnInitialChats extends ChatsState {}

class OnLoadedChats extends ChatsState {
  final MessagesResult messagesResult;

  OnLoadedChats(this.messagesResult);
}
