part of 'movie_search_bloc.dart';

abstract class MovieSearchState extends Equatable {}

class Initial extends MovieSearchState {
  @override
  List<Object> get props => [];
}

class Loading extends MovieSearchState {
  @override
  List<Object> get props => [];
}

class Success extends MovieSearchState {
  final List<Movie> movieResult;

  Success(this.movieResult);
  @override
  List<Object> get props => [movieResult];
}

class Empty extends MovieSearchState {
  @override
  List<Object> get props => [];
}

class Error extends MovieSearchState {
  final String message;

  Error(this.message);
  @override
  List<Object> get props => [message];
}
