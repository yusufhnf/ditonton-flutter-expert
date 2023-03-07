import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/presentation/bloc/tv/tv_watchlist/tv_watchlist_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../dummy_data/tv_dummy_objects.dart';
import '../../../helpers/test_helper.mocks.dart';

void main() {
  late MockGetWatchlistTvUseCase mockGetWatchlistTvUseCase;
  late MockGetWatchListTvStatusUseCase mockGetWatchlistStatusUseCase;
  late MockRemoveWatchlistTvUseCase mockRemoveWatchlistUseCase;
  late MockSaveWatchlistTvUseCase mockSaveWatchlistUseCase;
  late TvWatchlistBloc tvWatchlistBloc;

  setUp(() {
    mockSaveWatchlistUseCase = MockSaveWatchlistTvUseCase();
    mockRemoveWatchlistUseCase = MockRemoveWatchlistTvUseCase();
    mockGetWatchlistTvUseCase = MockGetWatchlistTvUseCase();
    mockGetWatchlistStatusUseCase = MockGetWatchListTvStatusUseCase();
    tvWatchlistBloc = TvWatchlistBloc(
      mockGetWatchlistTvUseCase,
      mockGetWatchlistStatusUseCase,
      mockRemoveWatchlistUseCase,
      mockSaveWatchlistUseCase,
    );
  });

  test('the initial state should be Initial state', () {
    expect(tvWatchlistBloc.state, TvWatchlistInitial());
  });

  group(
    'get watchlist tv test cases',
    () {
      blocTest<TvWatchlistBloc, TvWatchlistState>(
        'should emit Loading state and then Success state when watchlist data successfully retrieved',
        build: () {
          when(mockGetWatchlistTvUseCase.execute())
              .thenAnswer((_) async => Right([testWatchlistTv]));
          return tvWatchlistBloc;
        },
        act: (bloc) => bloc.add(OnGetWatchlist()),
        expect: () => [
          TvWatchlistLoading(),
          TvWatchlistSuccess([testWatchlistTv]),
        ],
        verify: (bloc) {
          verify(mockGetWatchlistTvUseCase.execute());
          return OnGetWatchlist().props;
        },
      );

      blocTest<TvWatchlistBloc, TvWatchlistState>(
        'should emit Loading state and then Error state when watchlist data failed to retrieved',
        build: () {
          when(mockGetWatchlistTvUseCase.execute())
              .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
          return tvWatchlistBloc;
        },
        act: (bloc) => bloc.add(OnGetWatchlist()),
        expect: () => [
          TvWatchlistLoading(),
          TvWatchlistError('Server Failure'),
        ],
        verify: (bloc) => TvWatchlistLoading(),
      );

      blocTest<TvWatchlistBloc, TvWatchlistState>(
        'should emit Loading state and then Empty state when the retrieved watchlist data is empty',
        build: () {
          when(mockGetWatchlistTvUseCase.execute())
              .thenAnswer((_) async => const Right([]));
          return tvWatchlistBloc;
        },
        act: (bloc) => bloc.add(OnGetWatchlist()),
        expect: () => [
          TvWatchlistLoading(),
          TvWatchlistEmpty(),
        ],
      );
    },
  );

  group(
    'get watchlist status test cases',
    () {
      blocTest<TvWatchlistBloc, TvWatchlistState>(
        'should be true when the watchlist status is also true',
        build: () {
          when(mockGetWatchlistStatusUseCase.execute(testTvDetail.id))
              .thenAnswer((_) async => true);
          return tvWatchlistBloc;
        },
        act: (bloc) => bloc.add(WatchlistStatus(testTvDetail.id)),
        expect: () => [
          TvWatchlistIsWatchlist(true),
        ],
        verify: (bloc) {
          verify(mockGetWatchlistStatusUseCase.execute(testTvDetail.id));
          return WatchlistStatus(testTvDetail.id).props;
        },
      );

      blocTest<TvWatchlistBloc, TvWatchlistState>(
        'should be false when the watchlist status is also false',
        build: () {
          when(mockGetWatchlistStatusUseCase.execute(testTvDetail.id))
              .thenAnswer((_) async => false);
          return tvWatchlistBloc;
        },
        act: (bloc) => bloc.add(WatchlistStatus(testTvDetail.id)),
        expect: () => [
          TvWatchlistIsWatchlist(false),
        ],
        verify: (bloc) {
          verify(mockGetWatchlistStatusUseCase.execute(testTvDetail.id));
          return WatchlistStatus(testTvDetail.id).props;
        },
      );
    },
  );

  group(
    'add and remove watchlist test cases',
    () {
      blocTest<TvWatchlistBloc, TvWatchlistState>(
        'should update watchlist status when adding watchlist succeeded',
        build: () {
          when(mockSaveWatchlistUseCase.execute(testTvDetail))
              .thenAnswer((_) async => const Right("addMessage"));
          return tvWatchlistBloc;
        },
        act: (bloc) => bloc.add(AddWatchlist(testTvDetail)),
        expect: () => [
          TvWatchlistSuccessMessage("addMessage"),
        ],
        verify: (bloc) {
          verify(mockSaveWatchlistUseCase.execute(testTvDetail));
          return AddWatchlist(testTvDetail).props;
        },
      );

      blocTest<TvWatchlistBloc, TvWatchlistState>(
        'should throw failure message status when adding watchlist failed',
        build: () {
          when(mockSaveWatchlistUseCase.execute(testTvDetail)).thenAnswer(
              (_) async =>
                  Left(DatabaseFailure('can\'t add data to watchlist')));
          return tvWatchlistBloc;
        },
        act: (bloc) => bloc.add(AddWatchlist(testTvDetail)),
        expect: () => [
          TvWatchlistError('can\'t add data to watchlist'),
        ],
        verify: (bloc) {
          verify(mockSaveWatchlistUseCase.execute(testTvDetail));
          return AddWatchlist(testTvDetail).props;
        },
      );

      blocTest<TvWatchlistBloc, TvWatchlistState>(
        'should update watchlist status when removing watchlist succeeded',
        build: () {
          when(mockRemoveWatchlistUseCase.execute(testTvDetail))
              .thenAnswer((_) async => const Right("removeMessage"));
          return tvWatchlistBloc;
        },
        act: (bloc) => bloc.add(RemoveWatchlist(testTvDetail)),
        expect: () => [
          TvWatchlistSuccessMessage("removeMessage"),
        ],
        verify: (bloc) {
          verify(mockRemoveWatchlistUseCase.execute(testTvDetail));
          return RemoveWatchlist(testTvDetail).props;
        },
      );

      blocTest<TvWatchlistBloc, TvWatchlistState>(
        'should throw failure message status when removing watchlist failed',
        build: () {
          when(mockRemoveWatchlistUseCase.execute(testTvDetail)).thenAnswer(
              (_) async =>
                  Left(DatabaseFailure('can\'t add data to watchlist')));
          return tvWatchlistBloc;
        },
        act: (bloc) => bloc.add(RemoveWatchlist(testTvDetail)),
        expect: () => [
          TvWatchlistError('can\'t add data to watchlist'),
        ],
        verify: (bloc) {
          verify(mockRemoveWatchlistUseCase.execute(testTvDetail));
          return RemoveWatchlist(testTvDetail).props;
        },
      );
    },
  );
}
