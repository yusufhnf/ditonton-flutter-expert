part of 'movie_recommendation_bloc.dart';

abstract class MovieRecommendationState extends Equatable {}

class MovieRecommendationInitial extends MovieRecommendationState {
  @override
  List<Object> get props => [];
}

class MovieRecommendationLoading extends MovieRecommendationState {
  @override
  List<Object> get props => [];
}

class MovieRecommendationSuccess extends MovieRecommendationState {
  final List<Movie> movieResult;

  MovieRecommendationSuccess(this.movieResult);
  @override
  List<Object> get props => [movieResult];
}

class MovieRecommendationEmpty extends MovieRecommendationState {
  @override
  List<Object> get props => [];
}

class MovieRecommendationError extends MovieRecommendationState {
  final String message;

  MovieRecommendationError(this.message);
  @override
  List<Object> get props => [message];
}
