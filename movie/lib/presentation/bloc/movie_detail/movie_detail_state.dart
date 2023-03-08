part of 'movie_detail_bloc.dart';

abstract class MovieDetailState extends Equatable {}

class MovieDetailInitial extends MovieDetailState {
  @override
  List<Object> get props => [];
}

class MovieDetailLoading extends MovieDetailState {
  @override
  List<Object> get props => [];
}

class MovieDetailSuccess extends MovieDetailState {
  final MovieDetail detailResult;

  MovieDetailSuccess(this.detailResult);
  @override
  List<Object> get props => [detailResult];
}

class MovieDetailEmpty extends MovieDetailState {
  @override
  List<Object> get props => [];
}

class MovieDetailError extends MovieDetailState {
  final String message;

  MovieDetailError(this.message);
  @override
  List<Object> get props => [message];
}
