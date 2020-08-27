part of 'slider_bloc.dart';

abstract class SliderEvent extends Equatable {}

class LoadSlider extends SliderEvent {
  final String memberToken;

  LoadSlider(this.memberToken);
  @override
  List<Object> get props => [memberToken];
}