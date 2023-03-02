part of 'tv_top_rated_bloc.dart';

abstract class TvTopRatedState extends Equatable {}

class Initial extends TvTopRatedState {
  @override
  List<Object> get props => [];
}

class Loading extends TvTopRatedState {
  @override
  List<Object> get props => [];
}

class Success extends TvTopRatedState {
  final List<Tv> tvResult;

  Success(this.tvResult);
  @override
  List<Object> get props => [tvResult];
}

class Empty extends TvTopRatedState {
  @override
  List<Object> get props => [];
}

class Error extends TvTopRatedState {
  final String message;

  Error(this.message);
  @override
  List<Object> get props => [message];
}
