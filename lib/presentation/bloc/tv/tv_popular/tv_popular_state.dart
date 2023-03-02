part of 'tv_popular_bloc.dart';

abstract class TvPopularState extends Equatable {}

class Initial extends TvPopularState {
  @override
  List<Object> get props => [];
}

class Loading extends TvPopularState {
  @override
  List<Object> get props => [];
}

class Success extends TvPopularState {
  final List<Tv> tvResult;

  Success(this.tvResult);
  @override
  List<Object> get props => [tvResult];
}

class Empty extends TvPopularState {
  @override
  List<Object> get props => [];
}

class Error extends TvPopularState {
  final String message;

  Error(this.message);
  @override
  List<Object> get props => [message];
}
