part of 'un_bloc.dart';

abstract class UNState {}

class OnInitialUN extends UNState {}

class OnLoadedUN extends UNState {
  final UpdateNotifModel notif;

  OnLoadedUN(this.notif);
}
