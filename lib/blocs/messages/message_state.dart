part of 'message_bloc.dart';

abstract class MessageState {}

class OnInitialMessage extends MessageState {}

class OnLoadedMessage extends MessageState {
  final ChatResult chatResult;

  OnLoadedMessage(this.chatResult);
}
