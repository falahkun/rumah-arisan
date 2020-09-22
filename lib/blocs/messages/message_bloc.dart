import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rumah_arisan/models/models.dart';
import 'package:rumah_arisan/services/services.dart';

part 'message_event.dart';
part 'message_state.dart';

class MessageBloc extends Bloc<MessageEvent, MessageState> {
  MessageBloc(MessageState initialState) : super(initialState);

  @override
  Stream<MessageState> mapEventToState(MessageEvent event) async* {
    if (event is FetchMessage) {
      ChatResult _result = await ChatServices.fetchChat(event.memberToken,
          id: event.id, token: event.token);

      print(_result.toJson());
      yield OnLoadedMessage(_result);
    } else {
      yield OnInitialMessage();
    }
  }
}
