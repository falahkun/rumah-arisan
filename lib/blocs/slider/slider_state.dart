part of 'slider_bloc.dart';

abstract class SliderState extends Equatable {}

class OnInitialSlider extends SliderState {
  @override
  List<Object> get props => [];
}

class OnLoadedSlider extends SliderState {
  final SliderResult sliderResult;

  OnLoadedSlider(this.sliderResult);
  @override
  List<Object> get props => [sliderResult];
}