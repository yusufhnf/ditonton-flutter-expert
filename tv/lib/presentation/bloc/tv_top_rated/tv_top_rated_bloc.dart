import 'dart:async';

import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'tv_top_rated_event.dart';
part 'tv_top_rated_state.dart';

class TvTopRatedBloc extends Bloc<TvTopRatedEvent, TvTopRatedState> {
  final GetTopRatedTvUseCase _getTvTopRated;

  TvTopRatedBloc(this._getTvTopRated) : super(TvTopRatedInitial()) {
    on<OnGetTopRated>(_onGetTopRated);
  }

  FutureOr<void> _onGetTopRated(
      OnGetTopRated event, Emitter<TvTopRatedState> emit) async {
    emit(TvTopRatedLoading());
    final result = await _getTvTopRated.execute();

    result.fold((failure) {
      emit(TvTopRatedError(failure.message));
    }, (success) {
      success.isEmpty
          ? emit(TvTopRatedEmpty())
          : emit(TvTopRatedSuccess(success));
    });
  }
}
