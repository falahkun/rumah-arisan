import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rumah_arisan/models/models.dart';
import 'package:rumah_arisan/services/services.dart';

part 'cmember_event.dart';
part 'cmember_state.dart';

class CmemberBloc extends Bloc<CmemberEvent, CMemberState> {
  CmemberBloc(CMemberState initialState) : super(initialState);

  @override
  Stream<CMemberState> mapEventToState(CmemberEvent event) async* {
    if(event is LoadCMember) {
      CMemberResult memberResult = await CloterServices.getMemberOfCloter(event.slug);
      yield OnLoadedCMember(memberResult);
    }
  }
}