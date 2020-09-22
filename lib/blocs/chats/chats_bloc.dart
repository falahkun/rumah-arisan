import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rumah_arisan/models/models.dart';
import 'package:rumah_arisan/services/services.dart';

part 'chats_state.dart';
part 'chats_event.dart';

class ChatsBloc extends Bloc<ChatsEvent, ChatsState> {
  ChatsBloc(ChatsState initialState) : super(initialState);

  @override
  Stream<ChatsState> mapEventToState(ChatsEvent event) async* {
    if (event is FetchChat) {
      MessagesResult _messageResult =
          await ChatServices.fetchMessages(event.memberToken);
      yield OnLoadedChats(_messageResult);
    } else {
      yield OnInitialChats();
    }
  }
}
