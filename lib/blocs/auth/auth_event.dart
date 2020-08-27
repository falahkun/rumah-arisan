part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {}

class GetToken extends AuthEvent{
  final String token;

  ///input client user token
  GetToken(this.token);
  @override
  List<Object> get props => [token];
}

class SignOut extends AuthEvent {
  @override
  List<Object> get props => [];

}