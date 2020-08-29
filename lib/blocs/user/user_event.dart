part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {}

class LoadUser extends UserEvent {
  final String token;
  final String code;

  LoadUser(this.token, this.code);
  @override
  List<Object> get props => [token, code];
}
