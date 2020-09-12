part of 'communities_bloc.dart';

abstract class CommunitiesState {}

class OnInitialCommunities extends CommunitiesState {}

class OnLoadedCommunities extends CommunitiesState {
  final CommunityResults communitiesResult;

  OnLoadedCommunities(this.communitiesResult);
}