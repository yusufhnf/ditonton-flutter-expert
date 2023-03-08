part of 'tv_popular_bloc.dart';

abstract class TvPopularState extends Equatable {}

class TvPopularInitial extends TvPopularState {
  @override
  List<Object> get props => [];
}

class TvPopularLoading extends TvPopularState {
  @override
  List<Object> get props => [];
}

class TvPopularSuccess extends TvPopularState {
  final List<Tv> tvResult;

  TvPopularSuccess(this.tvResult);
  @override
  List<Object> get props => [tvResult];
}

class TvPopularEmpty extends TvPopularState {
  @override
  List<Object> get props => [];
}

class TvPopularError extends TvPopularState {
  final String message;

  TvPopularError(this.message);
  @override
  List<Object> get props => [message];
}
