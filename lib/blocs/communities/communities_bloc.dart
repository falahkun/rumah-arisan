import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rumah_arisan/models/models.dart';
import 'package:rumah_arisan/services/services.dart';

part 'communities_state.dart';
part 'communities_event.dart';

class CommunitiesBloc extends Bloc<CommunitiesEvent, CommunitiesState> {
  CommunitiesBloc(CommunitiesState initialState) : super(initialState);

  @override
  Stream<CommunitiesState> mapEventToState(CommunitiesEvent event) async* {
    if(event is LoadCommunities) {
      CommunityResults _communities = await CommunityServices.getCommunities(event.memberToken);
      print(_communities.message);
      yield OnLoadedCommunities(_communities);
    }
  }
}