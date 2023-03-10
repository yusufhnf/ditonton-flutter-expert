import 'package:core/core.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;

@GenerateMocks([
  MovieRepository,
  MovieRemoteDataSource,
  MovieLocalDataSource,
  MovieDatabaseHelper,
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
], customMocks: [
  MockSpec<http.Client>(as: #MockHttpClient)
])
void main() {}
