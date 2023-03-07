import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/presentation/bloc/tv/tv_detail/tv_detail_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mockito/mockito.dart';

import '../../../dummy_data/tv_dummy_objects.dart';
import '../../../helpers/test_helper.mocks.dart';

void main() {
  late MockGetTvDetailUseCase mockGetTvDetailUseCase;
  late TvDetailBloc tvDetailBloc;

  const testId = 1;

  setUp(() {
    mockGetTvDetailUseCase = MockGetTvDetailUseCase();
    tvDetailBloc = TvDetailBloc(mockGetTvDetailUseCase);
  });

  test('the initial state should be initial', () {
    expect(tvDetailBloc.state, TvDetailInitial());
  });
  blocTest<TvDetailBloc, TvDetailState>(
    'should emit Loading state and then Success state when data successfully fetched',
    build: () {
      when(mockGetTvDetailUseCase.execute(testId))
          .thenAnswer((_) async => Right(testTvDetail));
      return tvDetailBloc;
    },
    act: (bloc) => bloc.add(OnGetDetail(testId)),
    expect: () => [
      TvDetailLoading(),
      TvDetailSuccess(testTvDetail),
    ],
    verify: (bloc) {
      verify(mockGetTvDetailUseCase.execute(testId));
      return OnGetDetail(testId).props;
    },
  );

  blocTest<TvDetailBloc, TvDetailState>(
    'should emit Loading state and then Error state when data failed to fetch',
    build: () {
      when(mockGetTvDetailUseCase.execute(testId))
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      return tvDetailBloc;
    },
    act: (bloc) => bloc.add(OnGetDetail(testId)),
    expect: () => [
      TvDetailLoading(),
      TvDetailError('Server Failure'),
    ],
    verify: (bloc) => TvDetailLoading(),
  );
}
