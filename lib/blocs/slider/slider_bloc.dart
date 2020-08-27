import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rumah_arisan/models/models.dart';
import 'package:rumah_arisan/services/services.dart';

part 'slider_event.dart';
part 'slider_state.dart';


class SliderBloc extends Bloc<SliderEvent, SliderState> {
  SliderBloc(SliderState initialState) : super(initialState);

  @override
  Stream<SliderState> mapEventToState(SliderEvent event) async* {
    if(event is LoadSlider) {
      SliderResult _slider = await SliderServices.getSlider(event.memberToken);
      yield OnLoadedSlider(_slider);
    }
  }
}