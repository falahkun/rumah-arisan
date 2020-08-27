part of 'cloter_bloc.dart';

abstract class CloterEvent extends Equatable {}

class LoadCloter extends CloterEvent {
  final String memberToken;

  LoadCloter(this.memberToken);
  @override
  List<Object> get props => [memberToken];
}
