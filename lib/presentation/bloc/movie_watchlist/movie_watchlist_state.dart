part of 'movie_watchlist_bloc.dart';

abstract class MovieWatchlistState extends Equatable {}

class Initial extends MovieWatchlistState {
  @override
  List<Object?> get props => [];
}

class Loading extends MovieWatchlistState {
  @override
  List<Object?> get props => [];
}

class Success extends MovieWatchlistState {
  final List<Movie> movieResult;

  Success(this.movieResult);

  @override
  List<Object?> get props => [movieResult];
}

class Empty extends MovieWatchlistState {
  @override
  List<Object?> get props => [];
}

class Error extends MovieWatchlistState {
  final String message;

  Error(this.message);

  @override
  List<Object?> get props => [message];
}

class SuccessMessage extends MovieWatchlistState {
  final String message;

  SuccessMessage(this.message);

  @override
  List<Object?> get props => [message];
}

class IsWatchlist extends MovieWatchlistState {
  final bool isListed;

  IsWatchlist(this.isListed);

  @override
  List<Object?> get props => [isListed];
}
