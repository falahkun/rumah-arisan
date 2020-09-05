part of 'cmember_bloc.dart';

abstract class CMemberState extends Equatable {}

class OnInitialCMember extends CMemberState {
  @override
  List<Object> get props => [];
}

class OnLoadedCMember extends CMemberState {
  final CMemberResult memberResult;

  OnLoadedCMember(this.memberResult);
  @override
  List<Object> get props => [memberResult];
}