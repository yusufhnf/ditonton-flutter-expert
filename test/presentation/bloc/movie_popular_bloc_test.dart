import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/presentation/bloc/movie_popular/movie_popular_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late MockGetPopularMoviesUseCase mockGetPopularMoviesUseCase;
  late MoviePopularBloc moviePopularBloc;

  setUp(() {
    mockGetPopularMoviesUseCase = MockGetPopularMoviesUseCase();
    moviePopularBloc = MoviePopularBloc(mockGetPopularMoviesUseCase);
  });

  test('the initial state should be initial', () {
    expect(moviePopularBloc.state, MoviePopularInitial());
  });

  blocTest<MoviePopularBloc, MoviePopularState>(
    'should emit Loading state and then Success state when data successfully fetched',
    build: () {
      when(mockGetPopularMoviesUseCase.execute())
          .thenAnswer((_) async => Right(testMovieList));
      return moviePopularBloc;
    },
    act: (bloc) => bloc.add(OnGetPopular()),
    expect: () => [
      MoviePopularLoading(),
      MoviePopularSuccess(testMovieList),
    ],
    verify: (bloc) {
      verify(mockGetPopularMoviesUseCase.execute());
      return OnGetPopular().props;
    },
  );

  blocTest<MoviePopularBloc, MoviePopularState>(
    'should emit Loading state and then Error state when data failed to fetch',
    build: () {
      when(mockGetPopularMoviesUseCase.execute())
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      return moviePopularBloc;
    },
    act: (bloc) => bloc.add(OnGetPopular()),
    expect: () => [
      MoviePopularLoading(),
      MoviePopularError('Server Failure'),
    ],
    verify: (bloc) => MoviePopularLoading(),
  );

  blocTest<MoviePopularBloc, MoviePopularState>(
    'should emit Loading state and then Empty state when the retrieved data is empty',
    build: () {
      when(mockGetPopularMoviesUseCase.execute())
          .thenAnswer((_) async => const Right([]));
      return moviePopularBloc;
    },
    act: (bloc) => bloc.add(OnGetPopular()),
    expect: () => [
      MoviePopularLoading(),
      MoviePopularEmpty(),
    ],
  );
}
