import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rumah_arisan/models/models.dart';
import 'package:rumah_arisan/services/services.dart';

part 'comdiscuss_state.dart';
part 'comdiscuss_event.dart';

class ComDiscussBloc extends Bloc<ComDiscussEvent, ComDiscussState> {
  ComDiscussBloc(ComDiscussState initialState) : super(initialState);

  @override
  Stream<ComDiscussState> mapEventToState(ComDiscussEvent event) async* {
    if (event is FetchComDiscuss) {
      CommunityDiscuss _discuss = await CommunityServices.fetchDiscussions(
          event.slug, event.memberToken);
      yield OnLoadedComDiscuss(_discuss);
    } else {
      yield OnInitialComDiscuss();
    }
  }
}
