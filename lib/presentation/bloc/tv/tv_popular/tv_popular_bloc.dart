import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ditonton/domain/entities/tv.dart';
import 'package:equatable/equatable.dart';

import '../../../../domain/usecases/tv/get_popular_tv.dart';

part 'tv_popular_event.dart';
part 'tv_popular_state.dart';

class TvPopularBloc extends Bloc<TvPopularEvent, TvPopularState> {
  final GetPopularTvUseCase _getTvPopular;

  TvPopularBloc(this._getTvPopular) : super(TvPopularInitial()) {
    on<OnGetPopular>(_onGetPopular);
  }

  FutureOr<void> _onGetPopular(
      OnGetPopular event, Emitter<TvPopularState> emit) async {
    emit(TvPopularLoading());
    final result = await _getTvPopular.execute();

    result.fold((failure) {
      emit(TvPopularError(failure.message));
    }, (success) {
      success.isEmpty
          ? emit(TvPopularEmpty())
          : emit(TvPopularSuccess(success));
    });
  }
}
