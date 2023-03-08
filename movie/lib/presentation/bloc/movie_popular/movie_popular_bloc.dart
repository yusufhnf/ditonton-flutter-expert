import 'dart:async';

import 'package:core/domain/entities/movie.dart';
import 'package:core/domain/usecases/movie/get_popular_movies.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'movie_popular_event.dart';
part 'movie_popular_state.dart';

class MoviePopularBloc extends Bloc<MoviePopularEvent, MoviePopularState> {
  final GetPopularMoviesUseCase _getMoviePopular;

  MoviePopularBloc(this._getMoviePopular) : super(MoviePopularInitial()) {
    on<OnGetPopular>(_onGetPopular);
  }

  FutureOr<void> _onGetPopular(
      OnGetPopular event, Emitter<MoviePopularState> emit) async {
    emit(MoviePopularLoading());
    final result = await _getMoviePopular.execute();

    result.fold((failure) {
      emit(MoviePopularError(failure.message));
    }, (success) {
      success.isEmpty
          ? emit(MoviePopularEmpty())
          : emit(MoviePopularSuccess(success));
    });
  }
}
