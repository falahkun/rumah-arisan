import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rumah_arisan/models/models.dart';
import 'package:rumah_arisan/services/services.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(AuthState initialState) : super(initialState);

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is GetToken) {
      TokenResult _tokenResult = await AuthServices.getTokenResult(event.token);
      if (_tokenResult != null && _tokenResult.status) {
        yield OnLoadedToken(_tokenResult);
      } else if (_tokenResult != null && !_tokenResult.status) {
        yield OnUnauthorizedToken("You're Logged On");
      } 
    } else if (event is SignOut) {
      AuthServices.removeSession();
    }
  }
}
