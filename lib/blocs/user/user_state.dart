part of 'user_bloc.dart';

abstract class UserState extends Equatable {}

class OnInitialUser extends UserState {
  @override
  List<Object> get props => [];
}

class OnLoadedUser extends UserState {
  final UserData user;

  OnLoadedUser(this.user);
  @override
  List<Object> get props => [user];
}

class OnErrorUser extends UserState {
  final String message;

  OnErrorUser(this.message);
  @override
  List<Object> get props => [message];
}
