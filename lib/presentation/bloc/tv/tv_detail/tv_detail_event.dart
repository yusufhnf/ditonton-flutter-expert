part of 'tv_detail_bloc.dart';

abstract class TvDetailEvent extends Equatable {}

class OnGetDetail extends TvDetailEvent {
  final int tvId;

  OnGetDetail(this.tvId);
  @override
  List<Object> get props => [tvId];
}
