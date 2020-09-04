part of 'cdetail_bloc.dart';

abstract class CdetailState extends Equatable {}

class OnInitialCDetail extends CdetailState {
  @override
  List<Object> get props => [];
}

class OnCDetailError extends CdetailState {
  final CloterDetailResult cloterResult;

  OnCDetailError(this.cloterResult);
  @override
  List<Object> get props => [];
}

class OnLoadedCdetail extends CdetailState {
  final CloterDetailResult cloterResult;

  OnLoadedCdetail(this.cloterResult);
  @override
  List<Object> get props => [cloterResult];
}