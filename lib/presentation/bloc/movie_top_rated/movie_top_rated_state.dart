part of 'movie_top_rated_bloc.dart';

abstract class MovieTopRatedState extends Equatable {}

class Initial extends MovieTopRatedState {
  @override
  List<Object> get props => [];
}

class Loading extends MovieTopRatedState {
  @override
  List<Object> get props => [];
}

class Success extends MovieTopRatedState {
  final List<Movie> movieResult;

  Success(this.movieResult);
  @override
  List<Object> get props => [movieResult];
}

class Empty extends MovieTopRatedState {
  @override
  List<Object> get props => [];
}

class Error extends MovieTopRatedState {
  final String message;

  Error(this.message);
  @override
  List<Object> get props => [message];
}
