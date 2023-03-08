part of 'movie_now_playing_bloc.dart';

abstract class MovieNowPlayingState extends Equatable {}

class MovieNowPlayingInitial extends MovieNowPlayingState {
  @override
  List<Object> get props => [];
}

class MovieNowPlayingLoading extends MovieNowPlayingState {
  @override
  List<Object> get props => [];
}

class MovieNowPlayingSuccess extends MovieNowPlayingState {
  final List<Movie> movieResult;

  MovieNowPlayingSuccess(this.movieResult);
  @override
  List<Object> get props => [movieResult];
}

class MovieNowPlayingEmpty extends MovieNowPlayingState {
  @override
  List<Object> get props => [];
}

class MovieNowPlayingError extends MovieNowPlayingState {
  final String message;

  MovieNowPlayingError(this.message);
  @override
  List<Object> get props => [message];
}
