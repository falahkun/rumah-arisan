part of 'moc_bloc.dart';

/// MOC = My Own Cloter
abstract class MOCEvent {}

class FetchMOC extends MOCEvent {
  final String memberToken;

  FetchMOC(this.memberToken);
}

class RemoveMOC extends MOCEvent {}
