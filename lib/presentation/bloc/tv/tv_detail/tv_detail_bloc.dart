import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ditonton/domain/entities/tv_detail.dart';
import 'package:ditonton/domain/usecases/tv/get_tv_detail.dart';
import 'package:equatable/equatable.dart';

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
