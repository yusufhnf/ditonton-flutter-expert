import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tv/tv.dart';

import '../../dummy_data/tv_dummy_objects.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late MockGetPopularTvUseCase mockGetPopularTvUseCase;
  late TvPopularBloc tvPopularBloc;

  setUp(() {
    mockGetPopularTvUseCase = MockGetPopularTvUseCase();
    tvPopularBloc = TvPopularBloc(mockGetPopularTvUseCase);
  });

  test('the initial state should be initial', () {
    expect(tvPopularBloc.state, TvPopularInitial());
  });

  blocTest<TvPopularBloc, TvPopularState>(
    'should emit Loading state and then Success state when data successfully fetched',
    build: () {
      when(mockGetPopularTvUseCase.execute())
          .thenAnswer((_) async => Right(testTvList));
      return tvPopularBloc;
    },
    act: (bloc) => bloc.add(OnGetPopular()),
    expect: () => [
      TvPopularLoading(),
      TvPopularSuccess(testTvList),
    ],
    verify: (bloc) {
      verify(mockGetPopularTvUseCase.execute());
      return OnGetPopular().props;
    },
  );

  blocTest<TvPopularBloc, TvPopularState>(
    'should emit Loading state and then Error state when data failed to fetch',
    build: () {
      when(mockGetPopularTvUseCase.execute())
          .thenAnswer((_) async => const Left(ServerFailure('Server Failure')));
      return tvPopularBloc;
    },
    act: (bloc) => bloc.add(OnGetPopular()),
    expect: () => [
      TvPopularLoading(),
      TvPopularError('Server Failure'),
    ],
    verify: (bloc) => TvPopularLoading(),
  );

  blocTest<TvPopularBloc, TvPopularState>(
    'should emit Loading state and then Empty state when the retrieved data is empty',
    build: () {
      when(mockGetPopularTvUseCase.execute())
          .thenAnswer((_) async => const Right([]));
      return tvPopularBloc;
    },
    act: (bloc) => bloc.add(OnGetPopular()),
    expect: () => [
      TvPopularLoading(),
      TvPopularEmpty(),
    ],
  );
}
