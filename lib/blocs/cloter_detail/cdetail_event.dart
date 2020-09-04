part of 'cdetail_bloc.dart';

abstract class CdetailEvent extends Equatable {}

class LoadCDetail extends CdetailEvent {
  final String slug;
  final String memberToken;

  LoadCDetail(this.slug, this.memberToken);
  @override
  List<Object> get props => [slug, memberToken];
}
