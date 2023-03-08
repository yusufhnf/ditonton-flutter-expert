part of 'tv_top_rated_bloc.dart';

abstract class TvTopRatedState extends Equatable {}

class TvTopRatedInitial extends TvTopRatedState {
  @override
  List<Object> get props => [];
}

class TvTopRatedLoading extends TvTopRatedState {
  @override
  List<Object> get props => [];
}

class TvTopRatedSuccess extends TvTopRatedState {
  final List<Tv> tvResult;

  TvTopRatedSuccess(this.tvResult);
  @override
  List<Object> get props => [tvResult];
}

class TvTopRatedEmpty extends TvTopRatedState {
  @override
  List<Object> get props => [];
}

class TvTopRatedError extends TvTopRatedState {
  final String message;

  TvTopRatedError(this.message);
  @override
  List<Object> get props => [message];
}
