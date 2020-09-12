part of 'communities_bloc.dart';

abstract class CommunitiesEvent {}

class LoadCommunities extends CommunitiesEvent {
  final String memberToken;

  LoadCommunities(this.memberToken);
}