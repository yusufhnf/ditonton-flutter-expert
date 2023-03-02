import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ditonton/domain/entities/movie.dart';
import 'package:ditonton/domain/usecases/movie/get_top_rated_movies.dart';
import 'package:equatable/equatable.dart';

part 'movie_top_rated_event.dart';
part 'movie_top_rated_state.dart';

class MovieTopRatedBloc extends Bloc<MovieTopRatedEvent, MovieTopRatedState> {
  final GetTopRatedMoviesUseCase _getMovieTopRated;

  MovieTopRatedBloc(this._getMovieTopRated) : super(MovieTopRatedInitial()) {
    on<OnGetTopRated>(_onGetTopRated);
  }

  FutureOr<void> _onGetTopRated(
      OnGetTopRated event, Emitter<MovieTopRatedState> emit) async {
    emit(MovieTopRatedLoading());
    final result = await _getMovieTopRated.execute();

    result.fold((failure) {
      emit(MovieTopRatedError(failure.message));
    }, (success) {
      emit(MovieTopRatedSuccess(success));
    });
  }
}
