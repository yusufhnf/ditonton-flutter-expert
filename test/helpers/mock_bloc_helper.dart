import 'package:bloc_test/bloc_test.dart';
import 'package:ditonton/presentation/bloc/movie_detail/movie_detail_bloc.dart';
import 'package:ditonton/presentation/bloc/movie_now_playing/movie_now_playing_bloc.dart';
import 'package:ditonton/presentation/bloc/movie_popular/movie_popular_bloc.dart';
import 'package:ditonton/presentation/bloc/movie_recommendation/movie_recommendation_bloc.dart';
import 'package:ditonton/presentation/bloc/movie_top_rated/movie_top_rated_bloc.dart';
import 'package:ditonton/presentation/bloc/movie_watchlist/movie_watchlist_bloc.dart';
import 'package:mockito/mockito.dart';

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
