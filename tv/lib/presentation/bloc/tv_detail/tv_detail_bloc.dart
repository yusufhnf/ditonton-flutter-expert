import 'dart:async';

import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'tv_detail_event.dart';
part 'tv_detail_state.dart';

class TvDetailBloc extends Bloc<TvDetailEvent, TvDetailState> {
  final GetTvDetailUseCase _getTvDetail;

  TvDetailBloc(this._getTvDetail) : super(TvDetailInitial()) {
    on<OnGetDetail>(_onGetDetail);
  }

  FutureOr<void> _onGetDetail(
      OnGetDetail event, Emitter<TvDetailState> emit) async {
    final id = event.tvId;

    emit(TvDetailLoading());
    final result = await _getTvDetail.execute(id);

    result.fold((failure) {
      emit(TvDetailError(failure.message));
    }, (success) {
      emit(TvDetailSuccess(success));
    });
  }
}
