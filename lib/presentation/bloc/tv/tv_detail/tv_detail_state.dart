part of 'tv_detail_bloc.dart';

abstract class TvDetailState extends Equatable {}

class Initial extends TvDetailState {
  @override
  List<Object> get props => [];
}

class Loading extends TvDetailState {
  @override
  List<Object> get props => [];
}

class Success extends TvDetailState {
  final TvDetail detailResult;

  Success(this.detailResult);
  @override
  List<Object> get props => [detailResult];
}

class Empty extends TvDetailState {
  @override
  List<Object> get props => [];
}

class Error extends TvDetailState {
  final String message;

  Error(this.message);
  @override
  List<Object> get props => [message];
}
