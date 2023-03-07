import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/presentation/bloc/tv/tv_recommendation/tv_recommendation_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../dummy_data/tv_dummy_objects.dart';
import '../../../helpers/test_helper.mocks.dart';

void main() {
  late MockGetTvRecommendationsUseCase mockGetTvRecommendationsUseCase;
  late TvRecommendationBloc tvRecommendationBloc;

  const testId = 1;

  setUp(() {
    mockGetTvRecommendationsUseCase = MockGetTvRecommendationsUseCase();
    tvRecommendationBloc =
        TvRecommendationBloc(mockGetTvRecommendationsUseCase);
  });

  test('the initial state should be empty', () {
    expect(tvRecommendationBloc.state, TvRecommendationInitial());
  });

  blocTest<TvRecommendationBloc, TvRecommendationState>(
    'should emit Loading state and then Success state when data successfully fetched',
    build: () {
      when(mockGetTvRecommendationsUseCase.execute(testId))
          .thenAnswer((_) async => Right(testTvList));
      return tvRecommendationBloc;
    },
    act: (bloc) => bloc.add(OnGetRecommendation(testId)),
    expect: () => [
      TvRecommendationLoading(),
      TvRecommendationSuccess(testTvList),
    ],
    verify: (bloc) {
      verify(mockGetTvRecommendationsUseCase.execute(testId));
      return OnGetRecommendation(testId).props;
    },
  );

  blocTest<TvRecommendationBloc, TvRecommendationState>(
    'should emit Loading state and then Error state when data failed to fetch',
    build: () {
      when(mockGetTvRecommendationsUseCase.execute(testId))
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      return tvRecommendationBloc;
    },
    act: (bloc) => bloc.add(OnGetRecommendation(testId)),
    expect: () => [
      TvRecommendationLoading(),
      TvRecommendationError('Server Failure'),
    ],
    verify: (bloc) => TvRecommendationLoading(),
  );

  blocTest<TvRecommendationBloc, TvRecommendationState>(
    'should emit Loading state and then Empty state when the retrieved data is empty',
    build: () {
      when(mockGetTvRecommendationsUseCase.execute(testId))
          .thenAnswer((_) async => const Right([]));
      return tvRecommendationBloc;
    },
    act: (bloc) => bloc.add(OnGetRecommendation(testId)),
    expect: () => [
      TvRecommendationLoading(),
      TvRecommendationEmpty(),
    ],
  );
}
