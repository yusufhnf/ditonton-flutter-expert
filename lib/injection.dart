import 'package:core/core.dart';
import 'package:http/http.dart' as http;
import 'package:get_it/get_it.dart';
import 'package:movie/movie.dart';
import 'package:search/search.dart';
import 'package:tv/tv.dart';

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
