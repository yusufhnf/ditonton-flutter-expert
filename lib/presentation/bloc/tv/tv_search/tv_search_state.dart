part of 'tv_search_bloc.dart';

abstract class TvSearchState extends Equatable {}

class TvSearchInitial extends TvSearchState {
  @override
  List<Object> get props => [];
}

class TvSearchLoading extends TvSearchState {
  @override
  List<Object> get props => [];
}

class TvSearchSuccess extends TvSearchState {
  final List<Tv> tvResult;

  TvSearchSuccess(this.tvResult);
  @override
  List<Object> get props => [tvResult];
}

class TvSearchEmpty extends TvSearchState {
  @override
  List<Object> get props => [];
}

class TvSearchError extends TvSearchState {
  final String message;

  TvSearchError(this.message);
  @override
  List<Object> get props => [message];
}
