import 'package:bloc_test/bloc_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movie/movie.dart';

class MockMovieDetailBloc extends MockBloc<MovieDetailEvent, MovieDetailState>
    implements MovieDetailBloc {}

class MockMovieRecommendationBloc
    extends MockBloc<MovieRecommendationEvent, MovieRecommendationState>
    implements MovieRecommendationBloc {}

class MockMoviePopularBloc
    extends MockBloc<MoviePopularEvent, MoviePopularState>
    implements MoviePopularBloc {}

class MockMovieTopRatedBloc
    extends MockBloc<MovieTopRatedEvent, MovieTopRatedState>
    implements MovieTopRatedBloc {}

class MockMovieWatchlistBloc
    extends MockBloc<MovieWatchlistEvent, MovieWatchlistState>
    implements MovieWatchlistBloc {}

class MovieDetailEventFake extends Fake implements MovieDetailEvent {}

class MovieDetailStateFake extends Fake implements MovieDetailState {}

class MovieNowPlayingEventFake extends Fake implements MovieNowPlayingEvent {}

class MovieNowPlayingStateFake extends Fake implements MovieNowPlayingState {}

class MoviePopularEventFake extends Fake implements MoviePopularEvent {}

class MoviePopularStateFake extends Fake implements MoviePopularState {}

class MovieRecommendationEventFake extends Fake
    implements MovieRecommendationEvent {}

class MovieRecommendationStateFake extends Fake
    implements MovieRecommendationState {}

class MovieTopRatedEventFake extends Fake implements MovieTopRatedEvent {}

class MovieTopRatedStateFake extends Fake implements MovieTopRatedState {}

class MovieWatchlistEventFake extends Fake implements MovieWatchlistEvent {}

class MovieWatchlistStateFake extends Fake implements MovieWatchlistState {}
