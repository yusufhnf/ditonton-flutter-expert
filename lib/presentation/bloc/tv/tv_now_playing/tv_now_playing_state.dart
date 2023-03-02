part of 'tv_now_playing_bloc.dart';

abstract class TvNowPlayingState extends Equatable {}

class TvNowPlayingInitial extends TvNowPlayingState {
  @override
  List<Object> get props => [];
}

class TvNowPlayingLoading extends TvNowPlayingState {
  @override
  List<Object> get props => [];
}

class TvNowPlayingSuccess extends TvNowPlayingState {
  final List<Tv> tvResult;

  TvNowPlayingSuccess(this.tvResult);
  @override
  List<Object> get props => [tvResult];
}

class TvNowPlayingEmpty extends TvNowPlayingState {
  @override
  List<Object> get props => [];
}

class TvNowPlayingError extends TvNowPlayingState {
  final String message;

  TvNowPlayingError(this.message);
  @override
  List<Object> get props => [message];
}
