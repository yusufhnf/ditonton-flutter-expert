part of 'movie_detail_bloc.dart';

abstract class MovieDetailState extends Equatable {}

class Initial extends MovieDetailState {
  @override
  List<Object> get props => [];
}

class Loading extends MovieDetailState {
  @override
  List<Object> get props => [];
}

class Success extends MovieDetailState {
  final MovieDetail detailResult;

  Success(this.detailResult);
  @override
  List<Object> get props => [detailResult];
}

class Empty extends MovieDetailState {
  @override
  List<Object> get props => [];
}

class Error extends MovieDetailState {
  final String message;

  Error(this.message);
  @override
  List<Object> get props => [message];
}
