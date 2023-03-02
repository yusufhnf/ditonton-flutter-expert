part of 'tv_recommendation_bloc.dart';

abstract class TvRecommendationState extends Equatable {}

class Initial extends TvRecommendationState {
  @override
  List<Object> get props => [];
}

class Loading extends TvRecommendationState {
  @override
  List<Object> get props => [];
}

class Success extends TvRecommendationState {
  final List<Tv> tvResult;

  Success(this.tvResult);
  @override
  List<Object> get props => [tvResult];
}

class Empty extends TvRecommendationState {
  @override
  List<Object> get props => [];
}

class Error extends TvRecommendationState {
  final String message;

  Error(this.message);
  @override
  List<Object> get props => [message];
}
