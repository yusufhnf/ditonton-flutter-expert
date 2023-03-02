import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ditonton/domain/entities/tv.dart';
import 'package:ditonton/domain/usecases/tv/search_tv.dart';
import 'package:equatable/equatable.dart';

part 'tv_search_event.dart';
part 'tv_search_state.dart';

class TvSearchBloc extends Bloc<TvSearchEvent, TvSearchState> {
  final SearchTvUseCase _getTvSearch;

  TvSearchBloc(this._getTvSearch) : super(Empty()) {
    on<OnGetSearch>(_onTvSearch);
  }

  FutureOr<void> _onTvSearch(
      OnGetSearch event, Emitter<TvSearchState> emit) async {
    final query = event.tvQuery;
    emit(Loading());

    final result = await _getTvSearch.execute(query);
    result.fold((failure) {
      emit(Error(failure.message));
    }, (success) {
      success.isEmpty ? emit(Empty()) : emit(Success(success));
    });
  }
}
