part of 'tv_watchlist_bloc.dart';

abstract class TvWatchlistEvent extends Equatable {}

class OnGetWatchlist extends TvWatchlistEvent {
  @override
  List<Object?> get props => [];
}

class WatchlistStatus extends TvWatchlistEvent {
  final int tvId;

  WatchlistStatus(this.tvId);

  @override
  List<Object?> get props => [tvId];
}

class AddWatchlist extends TvWatchlistEvent {
  final TvDetail tvDetail;

  AddWatchlist(this.tvDetail);

  @override
  List<Object?> get props => [tvDetail];
}

class RemoveWatchlist extends TvWatchlistEvent {
  final TvDetail tvDetail;

  RemoveWatchlist(this.tvDetail);

  @override
  List<Object?> get props => [tvDetail];
}
