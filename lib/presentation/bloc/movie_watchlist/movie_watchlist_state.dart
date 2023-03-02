part of 'movie_watchlist_bloc.dart';

abstract class MovieWatchlistState extends Equatable {}

class MovieWatchlistInitial extends MovieWatchlistState {
  @override
  List<Object?> get props => [];
}

class MovieWatchlistLoading extends MovieWatchlistState {
  @override
  List<Object?> get props => [];
}

class MovieWatchlistSuccess extends MovieWatchlistState {
  final List<Movie> movieResult;

  MovieWatchlistSuccess(this.movieResult);

  @override
  List<Object?> get props => [movieResult];
}

class MovieWatchlistEmpty extends MovieWatchlistState {
  @override
  List<Object?> get props => [];
}

class MovieWatchlistError extends MovieWatchlistState {
  final String message;

  MovieWatchlistError(this.message);

  @override
  List<Object?> get props => [message];
}

class MovieWatchlistSuccessMessage extends MovieWatchlistState {
  final String message;

  MovieWatchlistSuccessMessage(this.message);

  @override
  List<Object?> get props => [message];
}

class MovieWatchlistIsWatchlist extends MovieWatchlistState {
  final bool isListed;

  MovieWatchlistIsWatchlist(this.isListed);

  @override
  List<Object?> get props => [isListed];
}
