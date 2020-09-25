part of 'moc_bloc.dart';

/// MOC = My Own Cloter
abstract class MOCState {}

class OnInitialMOC extends MOCState {}

class OnLoadedMOC extends MOCState {
  final CloterResult cloter;

  OnLoadedMOC(this.cloter);
}
