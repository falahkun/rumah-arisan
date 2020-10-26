part of 'memberd_bloc.dart';

abstract class MemberdEvent extends Equatable {
  const MemberdEvent();

  @override
  List<Object> get props => [];
}

class FetchMemberd extends MemberdEvent {
  final String slug;
  final String memberToken;

  FetchMemberd(this.slug, this.memberToken);
}
