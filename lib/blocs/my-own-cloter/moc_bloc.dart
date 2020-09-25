import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rumah_arisan/models/models.dart';
import 'package:rumah_arisan/services/services.dart';

part 'moc_state.dart';
part 'moc_event.dart';

class MOCBloc extends Bloc<MOCEvent, MOCState> {
  MOCBloc(MOCState initialState) : super(initialState);

  @override
  Stream<MOCState> mapEventToState(MOCEvent event) async* {
    if (event is FetchMOC) {
      CloterResult _cloters =
          await CloterServices.fetchMyCloter(event.memberToken);

      if (_cloters.data == null) {
        _cloters.data = [];
      }
      // print(_cloters.state);

      yield OnLoadedMOC(_cloters);
    } else {
      yield OnInitialMOC();
    }
  }
}
