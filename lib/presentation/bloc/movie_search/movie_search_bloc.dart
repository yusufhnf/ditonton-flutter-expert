import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ditonton/domain/entities/movie.dart';
import 'package:ditonton/domain/usecases/movie/search_movies.dart';
import 'package:equatable/equatable.dart';

part 'movie_search_event.dart';
part 'movie_search_state.dart';

class MovieSearchBloc extends Bloc<MovieSearchEvent, MovieSearchState> {
  final SearchMoviesUseCase _getMovieSearch;

  MovieSearchBloc(this._getMovieSearch) : super(Empty()) {
    on<OnGetSearch>(_onMovieSearch);
  }

  FutureOr<void> _onMovieSearch(
      OnGetSearch event, Emitter<MovieSearchState> emit) async {
    final query = event.movieQuery;
    emit(Loading());

    final result = await _getMovieSearch.execute(query);
    result.fold((failure) {
      emit(Error(failure.message));
    }, (success) {
      success.isEmpty ? emit(Empty()) : emit(Success(success));
    });
  }
}
