import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/presentation/bloc/movie_now_playing/movie_now_playing_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late MockGetNowPlayingMoviesUseCase mockGetNowPlayingMoviesUseCase;
  late MovieNowPlayingBloc movieNowPlayingBloc;

  setUp(() {
    mockGetNowPlayingMoviesUseCase = MockGetNowPlayingMoviesUseCase();
    movieNowPlayingBloc = MovieNowPlayingBloc(mockGetNowPlayingMoviesUseCase);
  });

  test('the initial state should be initial', () {
    expect(movieNowPlayingBloc.state, MovieNowPlayingInitial());
  });

  blocTest<MovieNowPlayingBloc, MovieNowPlayingState>(
    'should emit Loading state and then Success state when data successfully fetched',
    build: () {
      when(mockGetNowPlayingMoviesUseCase.execute())
          .thenAnswer((_) async => Right(testMovieList));
      return movieNowPlayingBloc;
    },
    act: (bloc) => bloc.add(OnGetNowPlaying()),
    expect: () => [
      MovieNowPlayingLoading(),
      MovieNowPlayingSuccess(testMovieList),
    ],
    verify: (bloc) {
      verify(mockGetNowPlayingMoviesUseCase.execute());
      return OnGetNowPlaying().props;
    },
  );

  blocTest<MovieNowPlayingBloc, MovieNowPlayingState>(
    'should emit Loading state and then Error state when data failed to fetch',
    build: () {
      when(mockGetNowPlayingMoviesUseCase.execute())
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      return movieNowPlayingBloc;
    },
    act: (bloc) => bloc.add(OnGetNowPlaying()),
    expect: () => [
      MovieNowPlayingLoading(),
      MovieNowPlayingError('Server Failure'),
    ],
    verify: (bloc) => MovieNowPlayingLoading(),
  );

  blocTest<MovieNowPlayingBloc, MovieNowPlayingState>(
    'should emit Loading state and then Empty state when the retrieved data is empty',
    build: () {
      when(mockGetNowPlayingMoviesUseCase.execute())
          .thenAnswer((_) async => const Right([]));
      return movieNowPlayingBloc;
    },
    act: (bloc) => bloc.add(OnGetNowPlaying()),
    expect: () => [
      MovieNowPlayingLoading(),
      MovieNowPlayingEmpty(),
    ],
  );
}
