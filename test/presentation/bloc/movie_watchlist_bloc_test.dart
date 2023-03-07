import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/presentation/bloc/movie_watchlist/movie_watchlist_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late MockGetWatchlistMoviesUseCase mockGetWatchlistMoviesUseCase;
  late MockGetWatchListStatusUseCase mockGetWatchlistStatusUseCase;
  late MockRemoveWatchlistUseCase mockRemoveWatchlistUseCase;
  late MockSaveWatchlistUseCase mockSaveWatchlistUseCase;
  late MovieWatchlistBloc movieWatchlistBloc;

  setUp(() {
    mockSaveWatchlistUseCase = MockSaveWatchlistUseCase();
    mockRemoveWatchlistUseCase = MockRemoveWatchlistUseCase();
    mockGetWatchlistMoviesUseCase = MockGetWatchlistMoviesUseCase();
    mockGetWatchlistStatusUseCase = MockGetWatchListStatusUseCase();
    movieWatchlistBloc = MovieWatchlistBloc(
      mockGetWatchlistMoviesUseCase,
      mockGetWatchlistStatusUseCase,
      mockRemoveWatchlistUseCase,
      mockSaveWatchlistUseCase,
    );
  });

  test('the initial state should be Initial state', () {
    expect(movieWatchlistBloc.state, MovieWatchlistInitial());
  });

  group(
    'get watchlist movies test cases',
    () {
      blocTest<MovieWatchlistBloc, MovieWatchlistState>(
        'should emit Loading state and then Success state when watchlist data successfully retrieved',
        build: () {
          when(mockGetWatchlistMoviesUseCase.execute())
              .thenAnswer((_) async => Right([testWatchlistMovie]));
          return movieWatchlistBloc;
        },
        act: (bloc) => bloc.add(OnGetWatchlist()),
        expect: () => [
          MovieWatchlistLoading(),
          MovieWatchlistSuccess([testWatchlistMovie]),
        ],
        verify: (bloc) {
          verify(mockGetWatchlistMoviesUseCase.execute());
          return OnGetWatchlist().props;
        },
      );

      blocTest<MovieWatchlistBloc, MovieWatchlistState>(
        'should emit Loading state and then Error state when watchlist data failed to retrieved',
        build: () {
          when(mockGetWatchlistMoviesUseCase.execute())
              .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
          return movieWatchlistBloc;
        },
        act: (bloc) => bloc.add(OnGetWatchlist()),
        expect: () => [
          MovieWatchlistLoading(),
          MovieWatchlistError('Server Failure'),
        ],
        verify: (bloc) => MovieWatchlistLoading(),
      );

      blocTest<MovieWatchlistBloc, MovieWatchlistState>(
        'should emit Loading state and then Empty state when the retrieved watchlist data is empty',
        build: () {
          when(mockGetWatchlistMoviesUseCase.execute())
              .thenAnswer((_) async => const Right([]));
          return movieWatchlistBloc;
        },
        act: (bloc) => bloc.add(OnGetWatchlist()),
        expect: () => [
          MovieWatchlistLoading(),
          MovieWatchlistEmpty(),
        ],
      );
    },
  );

  group(
    'get watchlist status test cases',
    () {
      blocTest<MovieWatchlistBloc, MovieWatchlistState>(
        'should be true when the watchlist status is also true',
        build: () {
          when(mockGetWatchlistStatusUseCase.execute(testMovieDetail.id))
              .thenAnswer((_) async => true);
          return movieWatchlistBloc;
        },
        act: (bloc) => bloc.add(WatchlistStatus(testMovieDetail.id)),
        expect: () => [
          MovieWatchlistIsWatchlist(true),
        ],
        verify: (bloc) {
          verify(mockGetWatchlistStatusUseCase.execute(testMovieDetail.id));
          return WatchlistStatus(testMovieDetail.id).props;
        },
      );

      blocTest<MovieWatchlistBloc, MovieWatchlistState>(
        'should be false when the watchlist status is also false',
        build: () {
          when(mockGetWatchlistStatusUseCase.execute(testMovieDetail.id))
              .thenAnswer((_) async => false);
          return movieWatchlistBloc;
        },
        act: (bloc) => bloc.add(WatchlistStatus(testMovieDetail.id)),
        expect: () => [
          MovieWatchlistIsWatchlist(false),
        ],
        verify: (bloc) {
          verify(mockGetWatchlistStatusUseCase.execute(testMovieDetail.id));
          return WatchlistStatus(testMovieDetail.id).props;
        },
      );
    },
  );

  group(
    'add and remove watchlist test cases',
    () {
      blocTest<MovieWatchlistBloc, MovieWatchlistState>(
        'should update watchlist status when adding watchlist succeeded',
        build: () {
          when(mockSaveWatchlistUseCase.execute(testMovieDetail))
              .thenAnswer((_) async => const Right("addMessage"));
          return movieWatchlistBloc;
        },
        act: (bloc) => bloc.add(AddWatchlist(testMovieDetail)),
        expect: () => [
          MovieWatchlistSuccessMessage("addMessage"),
        ],
        verify: (bloc) {
          verify(mockSaveWatchlistUseCase.execute(testMovieDetail));
          return AddWatchlist(testMovieDetail).props;
        },
      );

      blocTest<MovieWatchlistBloc, MovieWatchlistState>(
        'should throw failure message status when adding watchlist failed',
        build: () {
          when(mockSaveWatchlistUseCase.execute(testMovieDetail)).thenAnswer(
              (_) async =>
                  Left(DatabaseFailure('can\'t add data to watchlist')));
          return movieWatchlistBloc;
        },
        act: (bloc) => bloc.add(AddWatchlist(testMovieDetail)),
        expect: () => [
          MovieWatchlistError('can\'t add data to watchlist'),
        ],
        verify: (bloc) {
          verify(mockSaveWatchlistUseCase.execute(testMovieDetail));
          return AddWatchlist(testMovieDetail).props;
        },
      );

      blocTest<MovieWatchlistBloc, MovieWatchlistState>(
        'should update watchlist status when removing watchlist succeeded',
        build: () {
          when(mockRemoveWatchlistUseCase.execute(testMovieDetail))
              .thenAnswer((_) async => const Right("removeMessage"));
          return movieWatchlistBloc;
        },
        act: (bloc) => bloc.add(RemoveWatchlist(testMovieDetail)),
        expect: () => [
          MovieWatchlistSuccessMessage("removeMessage"),
        ],
        verify: (bloc) {
          verify(mockRemoveWatchlistUseCase.execute(testMovieDetail));
          return RemoveWatchlist(testMovieDetail).props;
        },
      );

      blocTest<MovieWatchlistBloc, MovieWatchlistState>(
        'should throw failure message status when removing watchlist failed',
        build: () {
          when(mockRemoveWatchlistUseCase.execute(testMovieDetail)).thenAnswer(
              (_) async =>
                  Left(DatabaseFailure('can\'t add data to watchlist')));
          return movieWatchlistBloc;
        },
        act: (bloc) => bloc.add(RemoveWatchlist(testMovieDetail)),
        expect: () => [
          MovieWatchlistError('can\'t add data to watchlist'),
        ],
        verify: (bloc) {
          verify(mockRemoveWatchlistUseCase.execute(testMovieDetail));
          return RemoveWatchlist(testMovieDetail).props;
        },
      );
    },
  );
}
