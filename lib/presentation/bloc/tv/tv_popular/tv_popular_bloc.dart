import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ditonton/domain/entities/tv.dart';
import 'package:ditonton/domain/usecases/tv/get_popular_tvs.dart';
import 'package:equatable/equatable.dart';

part 'tv_popular_event.dart';
part 'tv_popular_state.dart';

class TvPopularBloc extends Bloc<TvPopularEvent, TvPopularState> {
  final GetPopularTvUseCase _getTvPopular;

  TvPopularBloc(this._getTvPopular) : super(Initial()) {
    on<OnGetPopular>(_onGetPopular);
  }

  FutureOr<void> _onGetPopular(
      OnGetPopular event, Emitter<TvPopularState> emit) async {
    emit(Loading());
    final result = await _getTvPopular.execute();

    result.fold((failure) {
      emit(Error(failure.message));
    }, (success) {
      emit(Success(success));
    });
  }
}
