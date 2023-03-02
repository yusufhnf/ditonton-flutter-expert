import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ditonton/domain/usecases/movie/get_watchlist_status.dart';
import 'package:ditonton/domain/usecases/movie/remove_watchlist.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/movie.dart';
import '../../../domain/entities/movie_detail.dart';
import '../../../domain/usecases/movie/get_watchlist_movies.dart';
import '../../../domain/usecases/movie/save_watchlist.dart';

part 'movie_watchlist_event.dart';
part 'movie_watchlist_state.dart';

class MovieWatchlistBloc
    extends Bloc<MovieWatchlistEvent, MovieWatchlistState> {
  final GetWatchlistMoviesUseCase _getWatchlistMovies;
  final GetWatchListStatusUseCase _getWatchlistStatus;
  final RemoveWatchlistUseCase _removeWatchlist;
  final SaveWatchlistUseCase _saveWatchlist;

  MovieWatchlistBloc(this._getWatchlistMovies, this._getWatchlistStatus,
      this._removeWatchlist, this._saveWatchlist)
      : super(MovieWatchlistInitial()) {
    on<OnGetWatchlist>(_onGetMovieWatchlist);
    on<WatchlistStatus>(_onWatchlistStatus);
    on<AddWatchlist>(_onAddWatchlist);
    on<RemoveWatchlist>(_onRemoveWatchlist);
  }

  FutureOr<void> _onGetMovieWatchlist(
      OnGetWatchlist event, Emitter<MovieWatchlistState> emit) async {
    emit(MovieWatchlistLoading());
    final result = await _getWatchlistMovies.execute();

    result.fold((failure) {
      emit(MovieWatchlistError(failure.message));
    }, (success) {
      success.isEmpty
          ? emit(MovieWatchlistEmpty())
          : emit(MovieWatchlistSuccess(success));
    });
  }

  FutureOr<void> _onWatchlistStatus(
      WatchlistStatus event, Emitter<MovieWatchlistState> emit) async {
    final id = event.movieId;
    final result = await _getWatchlistStatus.execute(id);
    emit(MovieWatchlistIsWatchlist(result));
  }

  FutureOr<void> _onAddWatchlist(
      AddWatchlist event, Emitter<MovieWatchlistState> emit) async {
    final movie = event.movieDetail;

    final result = await _saveWatchlist.execute(movie);
    result.fold((failure) {
      emit(MovieWatchlistError(failure.message));
    }, (success) {
      emit(MovieWatchlistSuccessMessage(success));
    });
  }

  FutureOr<void> _onRemoveWatchlist(
      RemoveWatchlist event, Emitter<MovieWatchlistState> emit) async {
    final movie = event.movieDetail;
    final result = await _removeWatchlist.execute(movie);
    result.fold((failure) {
      emit(MovieWatchlistError(failure.message));
    }, (success) {
      emit(MovieWatchlistSuccessMessage(success));
    });
  }
}
