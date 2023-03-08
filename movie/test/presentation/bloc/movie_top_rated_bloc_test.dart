import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movie/movie.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late MockGetTopRatedMoviesUseCase mockGetTopRatedMoviesUseCase;
  late MovieTopRatedBloc movieTopRatedBloc;

  setUp(() {
    mockGetTopRatedMoviesUseCase = MockGetTopRatedMoviesUseCase();
    movieTopRatedBloc = MovieTopRatedBloc(mockGetTopRatedMoviesUseCase);
  });

  test('the initial state should be empty', () {
    expect(movieTopRatedBloc.state, MovieTopRatedInitial());
  });

  blocTest<MovieTopRatedBloc, MovieTopRatedState>(
    'should emit Loading state and then Success state when data successfully fetched',
    build: () {
      when(mockGetTopRatedMoviesUseCase.execute())
          .thenAnswer((_) async => Right(testMovieList));
      return movieTopRatedBloc;
    },
    act: (bloc) => bloc.add(OnGetTopRated()),
    expect: () => [
      MovieTopRatedLoading(),
      MovieTopRatedSuccess(testMovieList),
    ],
    verify: (bloc) {
      verify(mockGetTopRatedMoviesUseCase.execute());
      return OnGetTopRated().props;
    },
  );

  blocTest<MovieTopRatedBloc, MovieTopRatedState>(
    'should emit Loading state and then Error state when data failed to fetch',
    build: () {
      when(mockGetTopRatedMoviesUseCase.execute())
          .thenAnswer((_) async => const Left(ServerFailure('Server Failure')));
      return movieTopRatedBloc;
    },
    act: (bloc) => bloc.add(OnGetTopRated()),
    expect: () => [
      MovieTopRatedLoading(),
      MovieTopRatedError('Server Failure'),
    ],
    verify: (bloc) => MovieTopRatedLoading(),
  );

  blocTest<MovieTopRatedBloc, MovieTopRatedState>(
    'should emit Loading state and then Empty state when the retrieved data is empty',
    build: () {
      when(mockGetTopRatedMoviesUseCase.execute())
          .thenAnswer((_) async => const Right([]));
      return movieTopRatedBloc;
    },
    act: (bloc) => bloc.add(OnGetTopRated()),
    expect: () => [
      MovieTopRatedLoading(),
      MovieTopRatedEmpty(),
    ],
  );
}
