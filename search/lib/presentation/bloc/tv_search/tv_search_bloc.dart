import 'dart:async';

import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'tv_search_event.dart';
part 'tv_search_state.dart';

class TvSearchBloc extends Bloc<TvSearchEvent, TvSearchState> {
  final SearchTvUseCase _getTvSearch;

  TvSearchBloc(this._getTvSearch) : super(TvSearchInitial()) {
    on<OnGetSearchTv>(_onTvSearch);
  }

  FutureOr<void> _onTvSearch(
      OnGetSearchTv event, Emitter<TvSearchState> emit) async {
    final query = event.tvQuery;
    emit(TvSearchLoading());

    final result = await _getTvSearch.execute(query);
    result.fold((failure) {
      emit(TvSearchError(failure.message));
    }, (success) {
      success.isEmpty ? emit(TvSearchEmpty()) : emit(TvSearchSuccess(success));
    });
  }
}
