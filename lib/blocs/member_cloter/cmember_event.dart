part of 'cmember_bloc.dart';

abstract class CmemberEvent extends Equatable {}

class LoadCMember extends CmemberEvent {
  final String slug;

  LoadCMember(this.slug);
  @override
  List<Object> get props => [slug];
}