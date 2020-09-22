part of 'comdiscuss_bloc.dart';

abstract class ComDiscussState {}

class OnInitialComDiscuss extends ComDiscussState {}

class OnLoadedComDiscuss extends ComDiscussState {
  final CommunityDiscuss discuss;

  OnLoadedComDiscuss(this.discuss);
}
