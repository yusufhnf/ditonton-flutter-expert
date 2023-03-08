part of 'tv_recommendation_bloc.dart';

abstract class TvRecommendationEvent extends Equatable {}

class OnGetRecommendation extends TvRecommendationEvent {
  final int tvId;

  OnGetRecommendation(this.tvId);
  @override
  List<Object> get props => [tvId];
}
