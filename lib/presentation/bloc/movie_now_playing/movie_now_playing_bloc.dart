import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ditonton/domain/entities/movie.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/usecases/movie/get_now_playing_movies.dart';

part 'movie_now_playing_event.dart';
part 'movie_now_playing_state.dart';

class MovieNowPlayingBloc
    extends Bloc<MovieNowPlayingEvent, MovieNowPlayingState> {
  final GetNowPlayingMoviesUseCase _getMovieNowPlaying;

  MovieNowPlayingBloc(this._getMovieNowPlaying) : super(Initial()) {
    on<OnGetNowPlaying>(_onGetNowPlaying);
  }

  FutureOr<void> _onGetNowPlaying(
      OnGetNowPlaying event, Emitter<MovieNowPlayingState> emit) async {
    emit(Loading());
    final result = await _getMovieNowPlaying.execute();

    result.fold((failure) {
      emit(Error(failure.message));
    }, (success) {
      emit(Success(success));
    });
  }
}
