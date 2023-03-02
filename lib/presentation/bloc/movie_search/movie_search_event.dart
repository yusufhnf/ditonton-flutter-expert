part of 'movie_search_bloc.dart';

abstract class MovieSearchEvent extends Equatable {}

class OnGetSearch extends MovieSearchEvent {
  final String movieQuery;

  OnGetSearch(this.movieQuery);
  @override
  List<Object> get props => [movieQuery];
}
