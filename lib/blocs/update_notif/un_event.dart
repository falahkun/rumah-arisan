part of 'un_bloc.dart';

abstract class UNEvent {}

class FetchUN extends UNEvent {
  final String memberToken;

  FetchUN(this.memberToken);
}
