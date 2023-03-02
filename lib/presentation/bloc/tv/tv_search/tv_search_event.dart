part of 'tv_search_bloc.dart';

abstract class TvSearchEvent extends Equatable {}

class OnGetSearch extends TvSearchEvent {
  final String tvQuery;

  OnGetSearch(this.tvQuery);
  @override
  List<Object> get props => [tvQuery];
}
