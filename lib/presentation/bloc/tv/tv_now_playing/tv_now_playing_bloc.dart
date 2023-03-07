import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ditonton/domain/entities/tv.dart';
import 'package:ditonton/domain/usecases/tv/get_now_playing_tv.dart';
import 'package:equatable/equatable.dart';

part 'tv_now_playing_event.dart';
part 'tv_now_playing_state.dart';

class TvNowPlayingBloc extends Bloc<TvNowPlayingEvent, TvNowPlayingState> {
  final GetNowPlayingTvUseCase _getTvNowPlaying;

  TvNowPlayingBloc(this._getTvNowPlaying) : super(TvNowPlayingInitial()) {
    on<OnGetNowPlaying>(_onGetNowPlaying);
  }

  FutureOr<void> _onGetNowPlaying(
      OnGetNowPlaying event, Emitter<TvNowPlayingState> emit) async {
    emit(TvNowPlayingLoading());
    final result = await _getTvNowPlaying.execute();

    result.fold((failure) {
      emit(TvNowPlayingError(failure.message));
    }, (success) {
      success.isEmpty
          ? emit(TvNowPlayingEmpty())
          : emit(TvNowPlayingSuccess(success));
    });
  }
}
