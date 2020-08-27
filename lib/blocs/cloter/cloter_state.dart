part of 'cloter_bloc.dart';

abstract class CloterState extends Equatable {}

class OnInitialCloter extends CloterState {
  @override
  List<Object> get props => [];
}

class OnLoadedCloter extends CloterState {
  final CloterResult cloterResult;

  OnLoadedCloter(this.cloterResult);
  @override
  List<Object> get props => [cloterResult];
}
