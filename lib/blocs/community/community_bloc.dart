import 'package:rumah_arisan/models/models.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rumah_arisan/services/services.dart';

part 'community_event.dart';
part 'community_state.dart';

class CommunityBloc extends Bloc<CommunityEvent, CommunityState> {
  CommunityBloc(CommunityState initialState) : super(initialState);

  @override
  Stream<CommunityState> mapEventToState(CommunityEvent event) async* {
    if (event is LoadCommunitiy) {
      CommunityResult _community =
          await CommunityServices.getCommunity(event.slug, event.memberToken);
      yield OnLoadedCommunity(_community);
    }
  }
}
