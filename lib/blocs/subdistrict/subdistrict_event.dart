part of 'subdistrict_bloc.dart';

abstract class SubdistrictEvent extends Equatable {}

class LoadSubdistricts extends SubdistrictEvent {
  final String query;

  LoadSubdistricts({this.query});
  @override
  List<Object> get props => [query];
}