part of 'cf_bloc.dart';

abstract class CfBlocState extends Equatable {
  const CfBlocState();

  @override
  List<Object> get props => [];
}

class CfBlocInitial extends CfBlocState {}

class CfBlocLoaded extends CfBlocState {
  final CfModel cf;

  CfBlocLoaded(this.cf);
}
