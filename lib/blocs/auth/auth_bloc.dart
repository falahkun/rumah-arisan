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
      print("token result out");
      if (_tokenResult != null && _tokenResult.status) {
        TokenResult newTokenResult = _tokenResult;
        newTokenResult.data.token = event.token;
        await FCMServices.subscribeTopic(event.token);
        print("token result int");
        yield OnLoadedToken(newTokenResult);
      } else if (_tokenResult != null && !_tokenResult.status) {
        print("token result is false");
        yield OnUnauthorizedToken("You're session removed");
      }
    } else if (event is SignOut) {
      AuthServices.removeSession();
      yield OnInitialAuth();
    } else {
      yield OnInitialAuth();
    }
  }
}
