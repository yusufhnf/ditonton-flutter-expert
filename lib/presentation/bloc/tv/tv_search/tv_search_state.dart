part of 'tv_search_bloc.dart';

abstract class TvSearchState extends Equatable {}

class Initial extends TvSearchState {
  @override
  List<Object> get props => [];
}

class Loading extends TvSearchState {
  @override
  List<Object> get props => [];
}

class Success extends TvSearchState {
  final List<Tv> tvResult;

  Success(this.tvResult);
  @override
  List<Object> get props => [tvResult];
}

class Empty extends TvSearchState {
  @override
  List<Object> get props => [];
}

class Error extends TvSearchState {
  final String message;

  Error(this.message);
  @override
  List<Object> get props => [message];
}
