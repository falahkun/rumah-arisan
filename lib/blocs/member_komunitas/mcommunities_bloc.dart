import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rumah_arisan/models/models.dart';
import 'package:rumah_arisan/services/services.dart';

part 'mcommunities_state.dart';
part 'mcommunities_event.dart';

class MCBloc extends Bloc<MCommunitiesEvent, MCommunitiesState> {
  MCBloc(MCommunitiesState initialState) : super(initialState);

  @override
  Stream<MCommunitiesState> mapEventToState(MCommunitiesEvent event) async* {
    if (event is FetchMCommunities) {
      CommunityResults _result =
          await CommunityServices.fetchMemberCommunities(event.memberToken);
      yield OnLoadedMCommunities(_result);
    } else {
      yield OnInitialMC();
    }
  }
}
