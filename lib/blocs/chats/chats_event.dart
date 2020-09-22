part of 'chats_bloc.dart';

abstract class ChatsEvent {}

class FetchChat extends ChatsEvent {
  final String memberToken;

  FetchChat(this.memberToken);
}
