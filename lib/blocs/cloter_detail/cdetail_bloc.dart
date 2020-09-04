
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rumah_arisan/models/models.dart';
import 'package:rumah_arisan/services/services.dart';

part 'cdetail_event.dart';
part 'cdetail_state.dart';

class CdetailBloc extends Bloc<CdetailEvent, CdetailState> {
  CdetailBloc(CdetailState initialState) : super(initialState);

  @override
  Stream<CdetailState> mapEventToState(CdetailEvent event) async* {
    if(event is LoadCDetail) {
      CloterDetailResult cloterResult = await CloterServices.getCloter(event.memberToken, slug: event.slug);
      print(cloterResult.message);
      print(cloterResult.status);
      print(cloterResult.toJson());
      if(cloterResult.status) {
        yield OnLoadedCdetail(cloterResult);
      }else {
        yield OnCDetailError(cloterResult);
      }
    }
  }
}
