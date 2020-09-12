part of 'community_bloc.dart';

abstract class CommunityEvent {}

class LoadCommuntiy extends CommunityEvent {
  final String slug;
  final String memberToken;

  LoadCommuntiy(this.slug, this.memberToken);
}