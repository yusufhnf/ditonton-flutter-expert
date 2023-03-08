import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tv/tv.dart';

import '../../dummy_data/tv_dummy_objects.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late MockGetNowPlayingTvUseCase mockGetNowPlayingTvUseCase;
  late TvNowPlayingBloc tvNowPlayingBloc;

  setUp(() {
    mockGetNowPlayingTvUseCase = MockGetNowPlayingTvUseCase();
    tvNowPlayingBloc = TvNowPlayingBloc(mockGetNowPlayingTvUseCase);
  });

  test('the initial state should be initial', () {
    expect(tvNowPlayingBloc.state, TvNowPlayingInitial());
  });

  blocTest<TvNowPlayingBloc, TvNowPlayingState>(
    'should emit Loading state and then Success state when data successfully fetched',
    build: () {
      when(mockGetNowPlayingTvUseCase.execute())
          .thenAnswer((_) async => Right(testTvList));
      return tvNowPlayingBloc;
    },
    act: (bloc) => bloc.add(OnGetNowPlaying()),
    expect: () => [
      TvNowPlayingLoading(),
      TvNowPlayingSuccess(testTvList),
    ],
    verify: (bloc) {
      verify(mockGetNowPlayingTvUseCase.execute());
      return OnGetNowPlaying().props;
    },
  );

  blocTest<TvNowPlayingBloc, TvNowPlayingState>(
    'should emit Loading state and then Error state when data failed to fetch',
    build: () {
      when(mockGetNowPlayingTvUseCase.execute())
          .thenAnswer((_) async => const Left(ServerFailure('Server Failure')));
      return tvNowPlayingBloc;
    },
    act: (bloc) => bloc.add(OnGetNowPlaying()),
    expect: () => [
      TvNowPlayingLoading(),
      TvNowPlayingError('Server Failure'),
    ],
    verify: (bloc) => TvNowPlayingLoading(),
  );

  blocTest<TvNowPlayingBloc, TvNowPlayingState>(
    'should emit Loading state and then Empty state when the retrieved data is empty',
    build: () {
      when(mockGetNowPlayingTvUseCase.execute())
          .thenAnswer((_) async => const Right([]));
      return tvNowPlayingBloc;
    },
    act: (bloc) => bloc.add(OnGetNowPlaying()),
    expect: () => [
      TvNowPlayingLoading(),
      TvNowPlayingEmpty(),
    ],
  );
}
