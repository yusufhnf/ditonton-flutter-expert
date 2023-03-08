part of 'movie_search_bloc.dart';

abstract class MovieSearchState extends Equatable {}

class MovieSearchInitial extends MovieSearchState {
  @override
  List<Object> get props => [];
}

class MovieSearchLoading extends MovieSearchState {
  @override
  List<Object> get props => [];
}

class MovieSearchSuccess extends MovieSearchState {
  final List<Movie> movieResult;

  MovieSearchSuccess(this.movieResult);
  @override
  List<Object> get props => [movieResult];
}

class MovieSearchEmpty extends MovieSearchState {
  @override
  List<Object> get props => [];
}

class MovieSearchError extends MovieSearchState {
  final String message;

  MovieSearchError(this.message);
  @override
  List<Object> get props => [message];
}
