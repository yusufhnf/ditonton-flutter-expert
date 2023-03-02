part of 'movie_recommendation_bloc.dart';

abstract class MovieRecommendationState extends Equatable {}

class Initial extends MovieRecommendationState {
  @override
  List<Object> get props => [];
}

class Loading extends MovieRecommendationState {
  @override
  List<Object> get props => [];
}

class Success extends MovieRecommendationState {
  final List<Movie> movieResult;

  Success(this.movieResult);
  @override
  List<Object> get props => [movieResult];
}

class Empty extends MovieRecommendationState {
  @override
  List<Object> get props => [];
}

class Error extends MovieRecommendationState {
  final String message;

  Error(this.message);
  @override
  List<Object> get props => [message];
}
