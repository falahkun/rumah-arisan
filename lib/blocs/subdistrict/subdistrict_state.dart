part of 'subdistrict_bloc.dart';

abstract class SubdistrictState extends Equatable {}

class OnInitialSubdistrict extends SubdistrictState {
  @override
  List<Object> get props => [];
}

class OnLoadedSubdistrict extends SubdistrictState {
  final List<SubdistrictData> subdistricts;
  final String message;

  OnLoadedSubdistrict(this.subdistricts, {this.message});
  @override
  List<Object> get props => [subdistricts, message];
}