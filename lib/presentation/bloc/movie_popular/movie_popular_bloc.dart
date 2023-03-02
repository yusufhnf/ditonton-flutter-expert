import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ditonton/domain/entities/movie.dart';
import 'package:ditonton/domain/usecases/movie/get_popular_movies.dart';
import 'package:equatable/equatable.dart';

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
      emit(MoviePopularSuccess(success));
    });
  }
}
