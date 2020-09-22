part of 'comdiscuss_bloc.dart';

abstract class ComDiscussEvent {}

class FetchComDiscuss extends ComDiscussEvent {
  final String slug;
  final String memberToken;

  FetchComDiscuss(this.slug, this.memberToken);
}
