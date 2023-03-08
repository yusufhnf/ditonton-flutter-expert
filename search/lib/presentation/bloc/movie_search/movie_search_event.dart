part of 'movie_search_bloc.dart';

abstract class MovieSearchEvent extends Equatable {}

class OnGetSearchMovie extends MovieSearchEvent {
  final String movieQuery;

  OnGetSearchMovie(this.movieQuery);
  @override
  List<Object> get props => [movieQuery];
}
