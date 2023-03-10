import 'package:bloc_test/bloc_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tv/tv.dart';

class MockTvDetailBloc extends MockBloc<TvDetailEvent, TvDetailState>
    implements TvDetailBloc {}

class MockTvRecommendationBloc
    extends MockBloc<TvRecommendationEvent, TvRecommendationState>
    implements TvRecommendationBloc {}

class MockTvPopularBloc extends MockBloc<TvPopularEvent, TvPopularState>
    implements TvPopularBloc {}

class MockTvTopRatedBloc extends MockBloc<TvTopRatedEvent, TvTopRatedState>
    implements TvTopRatedBloc {}

class MockTvWatchlistBloc extends MockBloc<TvWatchlistEvent, TvWatchlistState>
    implements TvWatchlistBloc {}

class TvDetailEventFake extends Fake implements TvDetailEvent {}

class TvDetailStateFake extends Fake implements TvDetailState {}

class TvNowPlayingEventFake extends Fake implements TvNowPlayingEvent {}

class TvNowPlayingStateFake extends Fake implements TvNowPlayingState {}

class TvPopularEventFake extends Fake implements TvPopularEvent {}

class TvPopularStateFake extends Fake implements TvPopularState {}

class TvRecommendationEventFake extends Fake implements TvRecommendationEvent {}

class TvRecommendationStateFake extends Fake implements TvRecommendationState {}

class TvTopRatedEventFake extends Fake implements TvTopRatedEvent {}

class TvTopRatedStateFake extends Fake implements TvTopRatedState {}

class TvWatchlistEventFake extends Fake implements TvWatchlistEvent {}

class TvWatchlistStateFake extends Fake implements TvWatchlistState {}
