part of 'community_bloc.dart';

abstract class CommunityEvent {}

class LoadCommunitiy extends CommunityEvent {
  final String slug;
  final String memberToken;

  LoadCommunitiy(this.slug, this.memberToken);
}
