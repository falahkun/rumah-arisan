import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rumah_arisan/models/models.dart';
import 'package:rumah_arisan/services/services.dart';

part 'memberd_event.dart';
part 'memberd_state.dart';

class MemberdBloc extends Bloc<MemberdEvent, MemberdState> {
  MemberdBloc() : super(OnMemberdInitial());

  @override
  Stream<MemberdState> mapEventToState(
    MemberdEvent event,
  ) async* {
    if (event is FetchMemberd) {
      MemberModel _member = await ChatServices.fetchMember(event.slug,
          memberToken: event.memberToken);
      yield OnMemberdLoaded(_member);
    } else {
      yield OnMemberdInitial();
    }
  }
}
