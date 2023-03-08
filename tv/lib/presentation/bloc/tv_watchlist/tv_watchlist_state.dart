part of 'tv_watchlist_bloc.dart';

abstract class TvWatchlistState extends Equatable {}

class TvWatchlistInitial extends TvWatchlistState {
  @override
  List<Object?> get props => [];
}

class TvWatchlistLoading extends TvWatchlistState {
  @override
  List<Object?> get props => [];
}

class TvWatchlistSuccess extends TvWatchlistState {
  final List<Tv> tvResult;

  TvWatchlistSuccess(this.tvResult);

  @override
  List<Object?> get props => [tvResult];
}

class TvWatchlistEmpty extends TvWatchlistState {
  @override
  List<Object?> get props => [];
}

class TvWatchlistError extends TvWatchlistState {
  final String message;

  TvWatchlistError(this.message);

  @override
  List<Object?> get props => [message];
}

class TvWatchlistSuccessMessage extends TvWatchlistState {
  final String message;

  TvWatchlistSuccessMessage(this.message);

  @override
  List<Object?> get props => [message];
}

class TvWatchlistIsWatchlist extends TvWatchlistState {
  final bool isListed;

  TvWatchlistIsWatchlist(this.isListed);

  @override
  List<Object?> get props => [isListed];
}
