part of 'mcommunities_bloc.dart';

abstract class MCommunitiesState {}

class OnLoadedMCommunities extends MCommunitiesState {
  final CommunityResults results;
  OnLoadedMCommunities(this.results);
}

class OnInitialMC extends MCommunitiesState {}
