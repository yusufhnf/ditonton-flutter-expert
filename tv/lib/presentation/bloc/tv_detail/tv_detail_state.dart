part of 'tv_detail_bloc.dart';

abstract class TvDetailState extends Equatable {}

class TvDetailInitial extends TvDetailState {
  @override
  List<Object> get props => [];
}

class TvDetailLoading extends TvDetailState {
  @override
  List<Object> get props => [];
}

class TvDetailSuccess extends TvDetailState {
  final TvDetail detailResult;

  TvDetailSuccess(this.detailResult);
  @override
  List<Object> get props => [detailResult];
}

class TvDetailEmpty extends TvDetailState {
  @override
  List<Object> get props => [];
}

class TvDetailError extends TvDetailState {
  final String message;

  TvDetailError(this.message);
  @override
  List<Object> get props => [message];
}
