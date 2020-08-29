import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rumah_arisan/models/models.dart';
import 'package:rumah_arisan/services/services.dart';

part 'subdistrict_event.dart';
part 'subdistrict_state.dart';


class SubdistrictBloc extends Bloc<SubdistrictEvent, SubdistrictState> {
  SubdistrictBloc(SubdistrictState initialState) : super(initialState);

  @override
  Stream<SubdistrictState> mapEventToState(SubdistrictEvent event) async* {
    if (event is LoadSubdistricts) {
      SubdistrictModel _subdistricts = await SubdistrictServices.getSubdistrict(event.query == "" ? "jember" : event.query);
      if(_subdistricts.status) {
        yield OnLoadedSubdistrict(_subdistricts.data, message: "Loaded All subdistrict from ${event.query}");
      }
    }
  }
}