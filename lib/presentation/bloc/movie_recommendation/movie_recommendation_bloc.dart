import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ditonton/domain/entities/movie.dart';
import 'package:ditonton/domain/usecases/movie/get_movie_recommendations.dart';
import 'package:equatable/equatable.dart';

part 'movie_recommendation_event.dart';
part 'movie_recommendation_state.dart';

class MovieRecommendationBloc
    extends Bloc<MovieRecommendationEvent, MovieRecommendationState> {
  final GetMovieRecommendationsUseCase _getMovieRecommendation;

  MovieRecommendationBloc(this._getMovieRecommendation) : super(Empty()) {
    on<OnGetRecommendation>(_onMovieRecommendation);
  }

  FutureOr<void> _onMovieRecommendation(
      OnGetRecommendation event, Emitter<MovieRecommendationState> emit) async {
    final id = event.movieId;
    emit(Loading());

    final result = await _getMovieRecommendation.execute(id);
    result.fold((failure) {
      emit(Error(failure.message));
    }, (success) {
      success.isEmpty ? emit(Empty()) : emit(Success(success));
    });
  }
}