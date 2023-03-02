part of 'tv_watchlist_bloc.dart';

abstract class TvWatchlistState extends Equatable {}

class Initial extends TvWatchlistState {
  @override
  List<Object?> get props => [];
}

class Loading extends TvWatchlistState {
  @override
  List<Object?> get props => [];
}

class Success extends TvWatchlistState {
  final List<Tv> tvResult;

  Success(this.tvResult);

  @override
  List<Object?> get props => [tvResult];
}

class Empty extends TvWatchlistState {
  @override
  List<Object?> get props => [];
}

class Error extends TvWatchlistState {
  final String message;

  Error(this.message);

  @override
  List<Object?> get props => [message];
}

class SuccessMessage extends TvWatchlistState {
  final String message;

  SuccessMessage(this.message);

  @override
  List<Object?> get props => [message];
}

class IsWatchlist extends TvWatchlistState {
  final bool isListed;

  IsWatchlist(this.isListed);

  @override
  List<Object?> get props => [isListed];
}
