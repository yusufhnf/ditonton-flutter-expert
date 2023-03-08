import 'dart:async';

import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'movie_search_event.dart';
part 'movie_search_state.dart';

class MovieSearchBloc extends Bloc<MovieSearchEvent, MovieSearchState> {
  final SearchMoviesUseCase _getMovieSearch;

  MovieSearchBloc(this._getMovieSearch) : super(MovieSearchInitial()) {
    on<OnGetSearchMovie>(_onMovieSearch);
  }

  FutureOr<void> _onMovieSearch(
      OnGetSearchMovie event, Emitter<MovieSearchState> emit) async {
    final query = event.movieQuery;
    emit(MovieSearchLoading());

    final result = await _getMovieSearch.execute(query);
    result.fold((failure) {
      emit(MovieSearchError(failure.message));
    }, (success) {
      success.isEmpty
          ? emit(MovieSearchEmpty())
          : emit(MovieSearchSuccess(success));
    });
  }
}
