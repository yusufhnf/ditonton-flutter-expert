part of 'movie_detail_bloc.dart';

abstract class MovieDetailEvent extends Equatable {}

class OnGetDetail extends MovieDetailEvent {
  final int movieId;

  OnGetDetail(this.movieId);
  @override
  List<Object> get props => [movieId];
}
