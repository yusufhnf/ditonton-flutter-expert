import 'dart:async';

import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'tv_recommendation_event.dart';
part 'tv_recommendation_state.dart';

class TvRecommendationBloc
    extends Bloc<TvRecommendationEvent, TvRecommendationState> {
  final GetTvRecommendationsUseCase _getTvRecommendation;

  TvRecommendationBloc(this._getTvRecommendation)
      : super(TvRecommendationInitial()) {
    on<OnGetRecommendation>(_onTvRecommendation);
  }

  FutureOr<void> _onTvRecommendation(
      OnGetRecommendation event, Emitter<TvRecommendationState> emit) async {
    final id = event.tvId;
    emit(TvRecommendationLoading());

    final result = await _getTvRecommendation.execute(id);
    result.fold((failure) {
      emit(TvRecommendationError(failure.message));
    }, (success) {
      success.isEmpty
          ? emit(TvRecommendationEmpty())
          : emit(TvRecommendationSuccess(success));
    });
  }
}
