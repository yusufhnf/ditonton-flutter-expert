part of 'movie_top_rated_bloc.dart';

abstract class MovieTopRatedState extends Equatable {}

class MovieTopRatedInitial extends MovieTopRatedState {
  @override
  List<Object> get props => [];
}

class MovieTopRatedLoading extends MovieTopRatedState {
  @override
  List<Object> get props => [];
}

class MovieTopRatedSuccess extends MovieTopRatedState {
  final List<Movie> movieResult;

  MovieTopRatedSuccess(this.movieResult);
  @override
  List<Object> get props => [movieResult];
}

class MovieTopRatedEmpty extends MovieTopRatedState {
  @override
  List<Object> get props => [];
}

class MovieTopRatedError extends MovieTopRatedState {
  final String message;

  MovieTopRatedError(this.message);
  @override
  List<Object> get props => [message];
}
