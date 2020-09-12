part of 'community_bloc.dart';

abstract class CommunityState {}

class OnInitialCommunity extends CommunityState {}
class OnLoadedCommunity extends CommunityState {
  final CommunityResult communityResult;

  OnLoadedCommunity(this.communityResult);
}

