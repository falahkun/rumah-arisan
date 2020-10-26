part of 'cf_bloc.dart';

abstract class CfBlocEvent extends Equatable {
  const CfBlocEvent();

  @override
  List<Object> get props => [];
}

class CfFetch extends CfBlocEvent {
  final String memberToken;
  final String slug;

  CfFetch(this.memberToken, this.slug);
}
