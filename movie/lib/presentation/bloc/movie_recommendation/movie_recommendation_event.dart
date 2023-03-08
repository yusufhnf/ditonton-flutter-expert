part of 'movie_recommendation_bloc.dart';

abstract class MovieRecommendationEvent extends Equatable {}

class OnGetRecommendation extends MovieRecommendationEvent {
  final int movieId;

  OnGetRecommendation(this.movieId);
  @override
  List<Object> get props => [movieId];
}
