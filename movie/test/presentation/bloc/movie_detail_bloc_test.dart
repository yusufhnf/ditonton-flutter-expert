import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movie/movie.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late MockGetMovieDetailUseCase mockGetMovieDetailUseCase;
  late MovieDetailBloc movieDetailBloc;

  const testId = 1;

  setUp(() {
    mockGetMovieDetailUseCase = MockGetMovieDetailUseCase();
    movieDetailBloc = MovieDetailBloc(mockGetMovieDetailUseCase);
  });

  test('the initial state should be initial', () {
    expect(movieDetailBloc.state, MovieDetailInitial());
  });
  blocTest<MovieDetailBloc, MovieDetailState>(
    'should emit Loading state and then Success state when data successfully fetched',
    build: () {
      when(mockGetMovieDetailUseCase.execute(testId))
          .thenAnswer((_) async => const Right(testMovieDetail));
      return movieDetailBloc;
    },
    act: (bloc) => bloc.add(OnGetDetail(testId)),
    expect: () => [
      MovieDetailLoading(),
      MovieDetailSuccess(testMovieDetail),
    ],
    verify: (bloc) {
      verify(mockGetMovieDetailUseCase.execute(testId));
      return OnGetDetail(testId).props;
    },
  );

  blocTest<MovieDetailBloc, MovieDetailState>(
    'should emit Loading state and then Error state when data failed to fetch',
    build: () {
      when(mockGetMovieDetailUseCase.execute(testId))
          .thenAnswer((_) async => const Left(ServerFailure('Server Failure')));
      return movieDetailBloc;
    },
    act: (bloc) => bloc.add(OnGetDetail(testId)),
    expect: () => [
      MovieDetailLoading(),
      MovieDetailError('Server Failure'),
    ],
    verify: (bloc) => MovieDetailLoading(),
  );
}
