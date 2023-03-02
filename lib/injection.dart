import 'package:ditonton/data/datasources/db/movie_database_helper.dart';
import 'package:ditonton/data/datasources/movie_local_data_source.dart';
import 'package:ditonton/data/datasources/movie_remote_data_source.dart';
import 'package:ditonton/data/repositories/movie_repository_impl.dart';
import 'package:ditonton/domain/repositories/movie_repository.dart';
import 'package:ditonton/domain/usecases/movie/get_movie_detail.dart';
import 'package:ditonton/domain/usecases/movie/get_movie_recommendations.dart';
import 'package:ditonton/domain/usecases/movie/get_now_playing_movies.dart';
import 'package:ditonton/domain/usecases/movie/get_popular_movies.dart';
import 'package:ditonton/domain/usecases/movie/get_top_rated_movies.dart';
import 'package:ditonton/domain/usecases/movie/get_watchlist_movies.dart';
import 'package:ditonton/domain/usecases/movie/get_watchlist_status.dart';
import 'package:ditonton/domain/usecases/movie/remove_watchlist.dart';
import 'package:ditonton/domain/usecases/movie/save_watchlist.dart';
import 'package:ditonton/domain/usecases/movie/search_movies.dart';
import 'package:ditonton/presentation/bloc/movie_detail/movie_detail_bloc.dart';
import 'package:ditonton/presentation/bloc/movie_now_playing/movie_now_playing_bloc.dart';
import 'package:ditonton/presentation/bloc/movie_popular/movie_popular_bloc.dart';
import 'package:ditonton/presentation/bloc/movie_recommendation/movie_recommendation_bloc.dart';
import 'package:ditonton/presentation/bloc/movie_search/movie_search_bloc.dart';
import 'package:ditonton/presentation/bloc/movie_top_rated/movie_top_rated_bloc.dart';
import 'package:ditonton/presentation/bloc/movie_watchlist/movie_watchlist_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:get_it/get_it.dart';

import 'data/datasources/db/tv_database_helper.dart';
import 'data/datasources/tv_local_data_source.dart';
import 'data/datasources/tv_remote_data_source.dart';
import 'data/repositories/tv_repository_impl.dart';
import 'domain/repositories/tv_repository.dart';
import 'domain/usecases/tv/get_now_playing_tv.dart';
import 'domain/usecases/tv/get_popular_tv.dart';
import 'domain/usecases/tv/get_top_rated_tv.dart';
import 'domain/usecases/tv/get_tv_detail.dart';
import 'domain/usecases/tv/get_tv_recommendations.dart';
import 'domain/usecases/tv/get_watchlist_tv.dart';
import 'domain/usecases/tv/get_watchlist_tv_status.dart';
import 'domain/usecases/tv/remove_watchlist_tv.dart';
import 'domain/usecases/tv/save_watchlist_tv.dart';
import 'domain/usecases/tv/search_tv.dart';
import 'presentation/bloc/tv/tv_detail/tv_detail_bloc.dart';
import 'presentation/bloc/tv/tv_now_playing/tv_now_playing_bloc.dart';
import 'presentation/bloc/tv/tv_popular/tv_popular_bloc.dart';
import 'presentation/bloc/tv/tv_recommendation/tv_recommendation_bloc.dart';
import 'presentation/bloc/tv/tv_search/tv_search_bloc.dart';
import 'presentation/bloc/tv/tv_top_rated/tv_top_rated_bloc.dart';
import 'presentation/bloc/tv/tv_watchlist/tv_watchlist_bloc.dart';

final locator = GetIt.instance;

void init() {
  // bloc
  locator.registerFactory(
    () => MovieNowPlayingBloc(locator()),
  );
  locator.registerFactory(
    () => MovieDetailBloc(locator()),
  );
  locator.registerFactory(
    () => MovieSearchBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => MoviePopularBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => MovieRecommendationBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => MovieTopRatedBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => MovieWatchlistBloc(locator(), locator(), locator(), locator()),
  );

  locator.registerFactory(
    () => TvNowPlayingBloc(locator()),
  );
  locator.registerFactory(
    () => TvDetailBloc(locator()),
  );
  locator.registerFactory(
    () => TvSearchBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => TvPopularBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => TvRecommendationBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => TvTopRatedBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => TvWatchlistBloc(locator(), locator(), locator(), locator()),
  );

  // use case
  locator.registerLazySingleton(() => GetNowPlayingMoviesUseCase(locator()));
  locator.registerLazySingleton(() => GetPopularMoviesUseCase(locator()));
  locator.registerLazySingleton(() => GetTopRatedMoviesUseCase(locator()));
  locator.registerLazySingleton(() => GetMovieDetailUseCase(locator()));
  locator
      .registerLazySingleton(() => GetMovieRecommendationsUseCase(locator()));
  locator.registerLazySingleton(() => SearchMoviesUseCase(locator()));
  locator.registerLazySingleton(() => GetWatchListStatusUseCase(locator()));
  locator.registerLazySingleton(() => SaveWatchlistUseCase(locator()));
  locator.registerLazySingleton(() => RemoveWatchlistUseCase(locator()));
  locator.registerLazySingleton(() => GetWatchlistMoviesUseCase(locator()));

  locator.registerLazySingleton(() => GetNowPlayingTvUseCase(locator()));
  locator.registerLazySingleton(() => GetPopularTvUseCase(locator()));
  locator.registerLazySingleton(() => GetTopRatedTvUseCase(locator()));
  locator.registerLazySingleton(() => GetTvDetailUseCase(locator()));
  locator.registerLazySingleton(() => GetTvRecommendationsUseCase(locator()));
  locator.registerLazySingleton(() => SearchTvUseCase(locator()));
  locator.registerLazySingleton(() => GetWatchListTvStatusUseCase(locator()));
  locator.registerLazySingleton(() => SaveWatchlistTvUseCase(locator()));
  locator.registerLazySingleton(() => RemoveWatchlistTvUseCase(locator()));
  locator.registerLazySingleton(() => GetWatchlistTvUseCase(locator()));

  // repository
  locator.registerLazySingleton<MovieRepository>(
    () => MovieRepositoryImpl(
      remoteDataSource: locator(),
      localDataSource: locator(),
    ),
  );
  locator.registerLazySingleton<TvRepository>(
    () => TvRepositoryImpl(
      remoteDataSource: locator(),
      localDataSource: locator(),
    ),
  );

  // data sources
  locator.registerLazySingleton<MovieRemoteDataSource>(
      () => MovieRemoteDataSourceImpl(client: locator()));
  locator.registerLazySingleton<MovieLocalDataSource>(
      () => MovieLocalDataSourceImpl(movieDatabaseHelper: locator()));
  locator.registerLazySingleton<TvRemoteDataSource>(
      () => TvRemoteDataSourceImpl(client: locator()));
  locator.registerLazySingleton<TvLocalDataSource>(
      () => TvLocalDataSourceImpl(tvDatabaseHelper: locator()));

  // helper
  locator
      .registerLazySingleton<MovieDatabaseHelper>(() => MovieDatabaseHelper());
  locator.registerLazySingleton<TvDatabaseHelper>(() => TvDatabaseHelper());

  // external
  locator.registerLazySingleton(() => http.Client());
}
