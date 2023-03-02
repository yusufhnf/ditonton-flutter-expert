part of 'tv_recommendation_bloc.dart';

abstract class TvRecommendationState extends Equatable {}

class TvRecommendationInitial extends TvRecommendationState {
  @override
  List<Object> get props => [];
}

class TvRecommendationLoading extends TvRecommendationState {
  @override
  List<Object> get props => [];
}

class TvRecommendationSuccess extends TvRecommendationState {
  final List<Tv> tvResult;

  TvRecommendationSuccess(this.tvResult);
  @override
  List<Object> get props => [tvResult];
}

class TvRecommendationEmpty extends TvRecommendationState {
  @override
  List<Object> get props => [];
}

class TvRecommendationError extends TvRecommendationState {
  final String message;

  TvRecommendationError(this.message);
  @override
  List<Object> get props => [message];
}
