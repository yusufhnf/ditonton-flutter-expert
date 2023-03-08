part of 'tv_search_bloc.dart';

abstract class TvSearchEvent extends Equatable {}

class OnGetSearchTv extends TvSearchEvent {
  final String tvQuery;

  OnGetSearchTv(this.tvQuery);
  @override
  List<Object> get props => [tvQuery];
}
