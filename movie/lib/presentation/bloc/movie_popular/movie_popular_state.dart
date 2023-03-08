part of 'movie_popular_bloc.dart';

abstract class MoviePopularState extends Equatable {}

class MoviePopularInitial extends MoviePopularState {
  @override
  List<Object> get props => [];
}

class MoviePopularLoading extends MoviePopularState {
  @override
  List<Object> get props => [];
}

class MoviePopularSuccess extends MoviePopularState {
  final List<Movie> movieResult;

  MoviePopularSuccess(this.movieResult);
  @override
  List<Object> get props => [movieResult];
}

class MoviePopularEmpty extends MoviePopularState {
  @override
  List<Object> get props => [];
}

class MoviePopularError extends MoviePopularState {
  final String message;

  MoviePopularError(this.message);
  @override
  List<Object> get props => [message];
}
