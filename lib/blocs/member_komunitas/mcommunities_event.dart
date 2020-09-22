part of 'mcommunities_bloc.dart';

abstract class MCommunitiesEvent {}

class FetchMCommunities extends MCommunitiesEvent {
  final String memberToken;

  FetchMCommunities(this.memberToken);
}

class RemoveEventMC extends MCommunitiesEvent {}
