import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rumah_arisan/models/models.dart';
import 'package:rumah_arisan/services/services.dart';

part 'cf_bloc_event.dart';
part 'cf_bloc_state.dart';

class CfBloc extends Bloc<CfBlocEvent, CfBlocState> {
  CfBloc() : super(CfBlocInitial());

  @override
  Stream<CfBlocState> mapEventToState(
    CfBlocEvent event,
  ) async* {
    if (event is CfFetch) {
      CfModel _cf = await CommunityServices.fetchFeedCom(event.slug,
          memberToken: event.memberToken);
      yield CfBlocLoaded(_cf);
    } else {
      yield CfBlocInitial();
    }
  }
}
