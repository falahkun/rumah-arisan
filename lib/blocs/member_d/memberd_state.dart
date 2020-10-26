part of 'memberd_bloc.dart';

abstract class MemberdState extends Equatable {
  const MemberdState();

  @override
  List<Object> get props => [];
}

class OnMemberdInitial extends MemberdState {}

class OnMemberdLoaded extends MemberdState {
  final MemberModel member;

  OnMemberdLoaded(this.member);
}
