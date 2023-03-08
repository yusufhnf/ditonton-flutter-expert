import 'dart:async';

import 'package:core/domain/entities/movie_detail.dart';
import 'package:core/domain/usecases/movie/get_movie_detail.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'movie_detail_event.dart';
part 'movie_detail_state.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  final GetMovieDetailUseCase _getMovieDetail;

  MovieDetailBloc(this._getMovieDetail) : super(MovieDetailInitial()) {
    on<OnGetDetail>(_onGetDetail);
  }

  FutureOr<void> _onGetDetail(
      OnGetDetail event, Emitter<MovieDetailState> emit) async {
    final id = event.movieId;

    emit(MovieDetailLoading());
    final result = await _getMovieDetail.execute(id);

    result.fold((failure) {
      emit(MovieDetailError(failure.message));
    }, (success) {
      emit(MovieDetailSuccess(success));
    });
  }
}
