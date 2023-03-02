import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ditonton/domain/entities/tv.dart';
import 'package:ditonton/domain/usecases/tv/search_tv.dart';
import 'package:equatable/equatable.dart';

part 'tv_search_event.dart';
part 'tv_search_state.dart';

class TvSearchBloc extends Bloc<TvSearchEvent, TvSearchState> {
  final SearchTvUseCase _getTvSearch;

  TvSearchBloc(this._getTvSearch) : super(TvSearchInitial()) {
    on<OnGetSearch>(_onTvSearch);
  }

  FutureOr<void> _onTvSearch(
      OnGetSearch event, Emitter<TvSearchState> emit) async {
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
