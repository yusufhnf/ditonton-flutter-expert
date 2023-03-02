part of 'tv_now_playing_bloc.dart';

abstract class TvNowPlayingState extends Equatable {}

class Initial extends TvNowPlayingState {
  @override
  List<Object> get props => [];
}

class Loading extends TvNowPlayingState {
  @override
  List<Object> get props => [];
}

class Success extends TvNowPlayingState {
  final List<Tv> tvResult;

  Success(this.tvResult);
  @override
  List<Object> get props => [tvResult];
}

class Empty extends TvNowPlayingState {
  @override
  List<Object> get props => [];
}

class Error extends TvNowPlayingState {
  final String message;

  Error(this.message);
  @override
  List<Object> get props => [message];
}
