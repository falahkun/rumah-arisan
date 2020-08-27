part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {}

class OnInitialAuth extends AuthState {
  @override
  List<Object> get props => [];
}

class OnLoadedToken extends AuthState {
  final TokenResult tokenResult;

  ///this result for your token
  OnLoadedToken(this.tokenResult);
  @override
  List<Object> get props => [tokenResult];
}

class OnError extends AuthState {
  final String message;

  OnError(this.message);
  @override
  List<Object> get props => [message];
}

class OnUnauthorizedToken extends AuthState {
  final String message;

  OnUnauthorizedToken(this.message);
  @override
  List<Object> get props => [message];
}