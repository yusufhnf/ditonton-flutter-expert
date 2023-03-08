import 'dart:async';

import 'package:core/domain/entities/movie.dart';
import 'package:core/domain/usecases/movie/get_now_playing_movies.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'movie_now_playing_event.dart';
part 'movie_now_playing_state.dart';

class MovieNowPlayingBloc
    extends Bloc<MovieNowPlayingEvent, MovieNowPlayingState> {
  final GetNowPlayingMoviesUseCase _getMovieNowPlaying;

  MovieNowPlayingBloc(this._getMovieNowPlaying)
      : super(MovieNowPlayingInitial()) {
    on<OnGetNowPlaying>(_onGetNowPlaying);
  }

  FutureOr<void> _onGetNowPlaying(
      OnGetNowPlaying event, Emitter<MovieNowPlayingState> emit) async {
    emit(MovieNowPlayingLoading());
    final result = await _getMovieNowPlaying.execute();

    result.fold((failure) {
      emit(MovieNowPlayingError(failure.message));
    }, (success) {
      success.isEmpty
          ? emit(MovieNowPlayingEmpty())
          : emit(MovieNowPlayingSuccess(success));
    });
  }
}
