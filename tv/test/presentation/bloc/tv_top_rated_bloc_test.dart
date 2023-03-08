import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tv/tv.dart';

import '../../dummy_data/tv_dummy_objects.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late MockGetTopRatedTvUseCase mockGetTopRatedTvUseCase;
  late TvTopRatedBloc tvTopRatedBloc;

  setUp(() {
    mockGetTopRatedTvUseCase = MockGetTopRatedTvUseCase();
    tvTopRatedBloc = TvTopRatedBloc(mockGetTopRatedTvUseCase);
  });

  test('the initial state should be empty', () {
    expect(tvTopRatedBloc.state, TvTopRatedInitial());
  });

  blocTest<TvTopRatedBloc, TvTopRatedState>(
    'should emit Loading state and then Success state when data successfully fetched',
    build: () {
      when(mockGetTopRatedTvUseCase.execute())
          .thenAnswer((_) async => Right(testTvList));
      return tvTopRatedBloc;
    },
    act: (bloc) => bloc.add(OnGetTopRated()),
    expect: () => [
      TvTopRatedLoading(),
      TvTopRatedSuccess(testTvList),
    ],
    verify: (bloc) {
      verify(mockGetTopRatedTvUseCase.execute());
      return OnGetTopRated().props;
    },
  );

  blocTest<TvTopRatedBloc, TvTopRatedState>(
    'should emit Loading state and then Error state when data failed to fetch',
    build: () {
      when(mockGetTopRatedTvUseCase.execute())
          .thenAnswer((_) async => const Left(ServerFailure('Server Failure')));
      return tvTopRatedBloc;
    },
    act: (bloc) => bloc.add(OnGetTopRated()),
    expect: () => [
      TvTopRatedLoading(),
      TvTopRatedError('Server Failure'),
    ],
    verify: (bloc) => TvTopRatedLoading(),
  );

  blocTest<TvTopRatedBloc, TvTopRatedState>(
    'should emit Loading state and then Empty state when the retrieved data is empty',
    build: () {
      when(mockGetTopRatedTvUseCase.execute())
          .thenAnswer((_) async => const Right([]));
      return tvTopRatedBloc;
    },
    act: (bloc) => bloc.add(OnGetTopRated()),
    expect: () => [
      TvTopRatedLoading(),
      TvTopRatedEmpty(),
    ],
  );
}
