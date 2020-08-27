import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rumah_arisan/models/models.dart';
import 'package:rumah_arisan/services/services.dart';

part 'cloter_event.dart';
part 'cloter_state.dart';

class CloterBloc extends Bloc<CloterEvent, CloterState> {
  CloterBloc(CloterState initialState) : super(initialState);

  @override
  Stream<CloterState> mapEventToState(CloterEvent event) async* {
    if(event is LoadCloter) {
      CloterResult _cloter = await CloterServices.getCloters(event.memberToken);
      yield OnLoadedCloter(_cloter);
    }
  }
}