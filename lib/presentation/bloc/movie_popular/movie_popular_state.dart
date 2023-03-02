part of 'movie_popular_bloc.dart';

abstract class MoviePopularState extends Equatable {}

class Initial extends MoviePopularState {
  @override
  List<Object> get props => [];
}

class Loading extends MoviePopularState {
  @override
  List<Object> get props => [];
}

class Success extends MoviePopularState {
  final List<Movie> movieResult;

  Success(this.movieResult);
  @override
  List<Object> get props => [movieResult];
}

class Empty extends MoviePopularState {
  @override
  List<Object> get props => [];
}

class Error extends MoviePopularState {
  final String message;

  Error(this.message);
  @override
  List<Object> get props => [message];
}
