import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ditonton/domain/entities/tv.dart';
import 'package:ditonton/domain/usecases/tv/get_top_rated_tv.dart';
import 'package:equatable/equatable.dart';

part 'tv_top_rated_event.dart';
part 'tv_top_rated_state.dart';

class TvTopRatedBloc extends Bloc<TvTopRatedEvent, TvTopRatedState> {
  final GetTopRatedTvUseCase _getTvTopRated;

  TvTopRatedBloc(this._getTvTopRated) : super(Initial()) {
    on<OnGetTopRated>(_onGetTopRated);
  }

  FutureOr<void> _onGetTopRated(
      OnGetTopRated event, Emitter<TvTopRatedState> emit) async {
    emit(Loading());
    final result = await _getTvTopRated.execute();

    result.fold((failure) {
      emit(Error(failure.message));
    }, (success) {
      emit(Success(success));
    });
  }
}
