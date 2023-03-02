part of 'movie_now_playing_bloc.dart';

abstract class MovieNowPlayingState extends Equatable {}

class Initial extends MovieNowPlayingState {
  @override
  List<Object> get props => [];
}

class Loading extends MovieNowPlayingState {
  @override
  List<Object> get props => [];
}

class Success extends MovieNowPlayingState {
  final List<Movie> movieResult;

  Success(this.movieResult);
  @override
  List<Object> get props => [movieResult];
}

class Empty extends MovieNowPlayingState {
  @override
  List<Object> get props => [];
}

class Error extends MovieNowPlayingState {
  final String message;

  Error(this.message);
  @override
  List<Object> get props => [message];
}
