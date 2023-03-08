import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movie/movie.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late MockGetMovieRecommendationsUseCase mockGetMovieRecommendationsUseCase;
  late MovieRecommendationBloc movieRecommendationBloc;

  const testId = 1;

  setUp(() {
    mockGetMovieRecommendationsUseCase = MockGetMovieRecommendationsUseCase();
    movieRecommendationBloc =
        MovieRecommendationBloc(mockGetMovieRecommendationsUseCase);
  });

  test('the initial state should be empty', () {
    expect(movieRecommendationBloc.state, MovieRecommendationInitial());
  });

  blocTest<MovieRecommendationBloc, MovieRecommendationState>(
    'should emit Loading state and then Success state when data successfully fetched',
    build: () {
      when(mockGetMovieRecommendationsUseCase.execute(testId))
          .thenAnswer((_) async => Right(testMovieList));
      return movieRecommendationBloc;
    },
    act: (bloc) => bloc.add(OnGetRecommendation(testId)),
    expect: () => [
      MovieRecommendationLoading(),
      MovieRecommendationSuccess(testMovieList),
    ],
    verify: (bloc) {
      verify(mockGetMovieRecommendationsUseCase.execute(testId));
      return OnGetRecommendation(testId).props;
    },
  );

  blocTest<MovieRecommendationBloc, MovieRecommendationState>(
    'should emit Loading state and then Error state when data failed to fetch',
    build: () {
      when(mockGetMovieRecommendationsUseCase.execute(testId))
          .thenAnswer((_) async => const Left(ServerFailure('Server Failure')));
      return movieRecommendationBloc;
    },
    act: (bloc) => bloc.add(OnGetRecommendation(testId)),
    expect: () => [
      MovieRecommendationLoading(),
      MovieRecommendationError('Server Failure'),
    ],
    verify: (bloc) => MovieRecommendationLoading(),
  );

  blocTest<MovieRecommendationBloc, MovieRecommendationState>(
    'should emit Loading state and then Empty state when the retrieved data is empty',
    build: () {
      when(mockGetMovieRecommendationsUseCase.execute(testId))
          .thenAnswer((_) async => const Right([]));
      return movieRecommendationBloc;
    },
    act: (bloc) => bloc.add(OnGetRecommendation(testId)),
    expect: () => [
      MovieRecommendationLoading(),
      MovieRecommendationEmpty(),
    ],
  );
}
