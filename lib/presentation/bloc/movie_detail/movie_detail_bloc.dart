import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ditonton/domain/entities/movie_detail.dart';
import 'package:ditonton/domain/usecases/movie/get_movie_detail.dart';
import 'package:equatable/equatable.dart';

part 'movie_detail_event.dart';
part 'movie_detail_state.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  final GetMovieDetailUseCase _getMovieDetail;

  MovieDetailBloc(this._getMovieDetail) : super(Initial()) {
    on<OnGetDetail>(_onGetDetail);
  }

  FutureOr<void> _onGetDetail(
      OnGetDetail event, Emitter<MovieDetailState> emit) async {
    final id = event.movieId;

    emit(Loading());
    final result = await _getMovieDetail.execute(id);

    result.fold((failure) {
      emit(Error(failure.message));
    }, (success) {
      emit(Success(success));
    });
  }
}
