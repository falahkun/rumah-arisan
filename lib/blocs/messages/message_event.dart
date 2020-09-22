part of 'message_bloc.dart';

abstract class MessageEvent {}

class FetchMessage extends MessageEvent {
  final String memberToken;
  final String id;
  final String token;

  FetchMessage({this.memberToken, this.id, this.token});
}

class RemoveAction extends MessageEvent {}
