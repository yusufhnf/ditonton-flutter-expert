import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ditonton/domain/usecases/tv/get_watchlist_tv_status.dart';
import 'package:ditonton/domain/usecases/tv/remove_watchlist_tv.dart';
import 'package:ditonton/domain/usecases/tv/save_watchlist_tv.dart';
import 'package:equatable/equatable.dart';

import '../../../../domain/entities/tv.dart';
import '../../../../domain/entities/tv_detail.dart';
import '../../../../domain/usecases/tv/get_watchlist_tv.dart';

part 'tv_watchlist_event.dart';
part 'tv_watchlist_state.dart';

class TvWatchlistBloc extends Bloc<TvWatchlistEvent, TvWatchlistState> {
  final GetWatchlistTvUseCase _getWatchlistTv;
  final GetWatchListTvStatusUseCase _getWatchlistStatus;
  final RemoveWatchlistTvUseCase _removeWatchlist;
  final SaveWatchlistTvUseCase _saveWatchlist;

  TvWatchlistBloc(this._getWatchlistTv, this._getWatchlistStatus,
      this._removeWatchlist, this._saveWatchlist)
      : super(TvWatchlistInitial()) {
    on<OnGetWatchlist>(_onGetTvWatchlist);
    on<WatchlistStatus>(_onWatchlistStatus);
    on<AddWatchlist>(_onAddWatchlist);
    on<RemoveWatchlist>(_onRemoveWatchlist);
  }

  FutureOr<void> _onGetTvWatchlist(
      OnGetWatchlist event, Emitter<TvWatchlistState> emit) async {
    emit(TvWatchlistLoading());
    final result = await _getWatchlistTv.execute();

    result.fold((failure) {
      emit(TvWatchlistError(failure.message));
    }, (success) {
      success.isEmpty
          ? emit(TvWatchlistEmpty())
          : emit(TvWatchlistSuccess(success));
    });
  }

  FutureOr<void> _onWatchlistStatus(
      WatchlistStatus event, Emitter<TvWatchlistState> emit) async {
    final id = event.tvId;
    final result = await _getWatchlistStatus.execute(id);
    emit(TvWatchlistIsWatchlist(result));
  }

  FutureOr<void> _onAddWatchlist(
      AddWatchlist event, Emitter<TvWatchlistState> emit) async {
    final tv = event.tvDetail;

    final result = await _saveWatchlist.execute(tv);
    result.fold((failure) {
      emit(TvWatchlistError(failure.message));
    }, (success) {
      emit(TvWatchlistSuccessMessage(success));
    });
  }

  FutureOr<void> _onRemoveWatchlist(
      RemoveWatchlist event, Emitter<TvWatchlistState> emit) async {
    final tv = event.tvDetail;
    final result = await _removeWatchlist.execute(tv);
    result.fold((failure) {
      emit(TvWatchlistError(failure.message));
    }, (success) {
      emit(TvWatchlistSuccessMessage(success));
    });
  }
}
