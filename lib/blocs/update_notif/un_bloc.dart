import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rumah_arisan/models/models.dart';
import 'package:rumah_arisan/services/services.dart';

part 'un_state.dart';
part 'un_event.dart';

class UNBloc extends Bloc<UNEvent, UNState> {
  UNBloc(UNState initialState) : super(initialState);

  @override
  Stream<UNState> mapEventToState(UNEvent event) async* {
    if (event is FetchUN) {
      UpdateNotifModel _notif =
          await NotificationServices.fetchUpdateNotif(event.memberToken);
      yield OnLoadedUN(_notif);
    }
  }
}
