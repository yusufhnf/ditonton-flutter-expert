part of 'movie_watchlist_bloc.dart';

abstract class MovieWatchlistEvent extends Equatable {}

class OnGetWatchlist extends MovieWatchlistEvent {
  OnGetWatchlist();

  @override
  List<Object?> get props => [];
}

class WatchlistStatus extends MovieWatchlistEvent {
  final int movieId;

  WatchlistStatus(this.movieId);

  @override
  List<Object?> get props => [movieId];
}

class AddWatchlist extends MovieWatchlistEvent {
  final MovieDetail movieDetail;

  AddWatchlist(this.movieDetail);

  @override
  List<Object?> get props => [movieDetail];
}

class RemoveWatchlist extends MovieWatchlistEvent {
  final MovieDetail movieDetail;

  RemoveWatchlist(this.movieDetail);

  @override
  List<Object?> get props => [movieDetail];
}
