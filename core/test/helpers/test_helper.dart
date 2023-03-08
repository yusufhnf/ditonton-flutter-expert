import 'package:core/data/datasources/db/movie_database_helper.dart';
import 'package:core/data/datasources/db/tv_database_helper.dart';
import 'package:core/data/datasources/movie_local_data_source.dart';
import 'package:core/data/datasources/movie_remote_data_source.dart';
import 'package:core/data/datasources/tv_local_data_source.dart';
import 'package:core/data/datasources/tv_remote_data_source.dart';
import 'package:core/domain/repositories/movie_repository.dart';
import 'package:core/domain/repositories/tv_repository.dart';
import 'package:core/domain/usecases/movie/get_movie_detail.dart';
import 'package:core/domain/usecases/movie/get_movie_recommendations.dart';
import 'package:core/domain/usecases/movie/get_now_playing_movies.dart';
import 'package:core/domain/usecases/movie/get_popular_movies.dart';
import 'package:core/domain/usecases/movie/get_top_rated_movies.dart';
import 'package:core/domain/usecases/movie/get_watchlist_movies.dart';
import 'package:core/domain/usecases/movie/get_watchlist_status.dart';
import 'package:core/domain/usecases/movie/remove_watchlist.dart';
import 'package:core/domain/usecases/movie/save_watchlist.dart';
import 'package:core/domain/usecases/movie/search_movies.dart';
import 'package:core/domain/usecases/tv/get_now_playing_tv.dart';
import 'package:core/domain/usecases/tv/get_popular_tv.dart';
import 'package:core/domain/usecases/tv/get_top_rated_tv.dart';
import 'package:core/domain/usecases/tv/get_tv_detail.dart';
import 'package:core/domain/usecases/tv/get_tv_recommendations.dart';
import 'package:core/domain/usecases/tv/get_watchlist_tv.dart';
import 'package:core/domain/usecases/tv/get_watchlist_tv_status.dart';
import 'package:core/domain/usecases/tv/remove_watchlist_tv.dart';
import 'package:core/domain/usecases/tv/save_watchlist_tv.dart';
import 'package:core/domain/usecases/tv/search_tv.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;

@GenerateMocks([
  MovieRepository,
  MovieRemoteDataSource,
  MovieLocalDataSource,
  MovieDatabaseHelper,
  TvRepository,
  TvRemoteDataSource,
  TvLocalDataSource,
  TvDatabaseHelper,
  GetMovieDetailUseCase,
  GetMovieRecommendationsUseCase,
  GetNowPlayingMoviesUseCase,
  GetPopularMoviesUseCase,
  GetTopRatedMoviesUseCase,
  GetWatchlistMoviesUseCase,
  GetWatchListStatusUseCase,
  RemoveWatchlistUseCase,
  SaveWatchlistUseCase,
  SearchMoviesUseCase,
  GetNowPlayingTvUseCase,
  GetPopularTvUseCase,
  GetTopRatedTvUseCase,
  GetTvDetailUseCase,
  GetTvRecommendationsUseCase,
  GetWatchlistTvUseCase,
  GetWatchListTvStatusUseCase,
  RemoveWatchlistTvUseCase,
  SaveWatchlistTvUseCase,
  SearchTvUseCase
], customMocks: [
  MockSpec<http.Client>(as: #MockHttpClient)
])
void main() {}
