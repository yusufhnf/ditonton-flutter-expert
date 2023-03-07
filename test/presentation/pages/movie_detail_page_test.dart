import 'package:bloc_test/bloc_test.dart';
import 'package:ditonton/presentation/bloc/movie_detail/movie_detail_bloc.dart';
import 'package:ditonton/presentation/bloc/movie_recommendation/movie_recommendation_bloc.dart';
import 'package:ditonton/presentation/bloc/movie_watchlist/movie_watchlist_bloc.dart';
import 'package:ditonton/presentation/pages/movie_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../helpers/mock_bloc_helper.dart';

void main() {
  late MovieDetailBloc mockMovieDetailBloc;
  late MovieWatchlistBloc mockMovieWatchlistBloc;
  late MovieRecommendationBloc mockMovieRecommendationBloc;

  setUp(() {
    mockMovieDetailBloc = MockMovieDetailBloc();
    mockMovieWatchlistBloc = MockMovieWatchlistBloc();
    mockMovieRecommendationBloc = MockMovieRecommendationBloc();
  });

  setUpAll(() {
    registerFallbackValue(MovieDetailEventFake);
    registerFallbackValue(MovieDetailStateFake);
    registerFallbackValue(MovieWatchlistEventFake);
    registerFallbackValue(MovieWatchlistStateFake);
  });

  tearDown(() {
    mockMovieDetailBloc.close();
    mockMovieRecommendationBloc.close();
    mockMovieWatchlistBloc.close();
  });

  final tId = 1;

  Widget _makeTestableWidget(Widget body) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => mockMovieDetailBloc,
        ),
        BlocProvider(
          create: (_) => mockMovieRecommendationBloc,
        ),
        BlocProvider(
          create: (_) => mockMovieWatchlistBloc,
        ),
      ],
      child: MaterialApp(
        home: body,
      ),
    );
  }

  testWidgets(
      'Watchlist button should display add icon when movie not added to watchlist',
      (WidgetTester tester) async {
    when(() => mockMovieDetailBloc.state)
        .thenAnswer((invocation) => MovieDetailSuccess(testMovieDetail));
    when(() => mockMovieDetailBloc.state)
        .thenAnswer((invocation) => MovieDetailSuccess(testMovieDetail));
    when(() => mockMovieRecommendationBloc.add(OnGetRecommendation(tId)))
        .thenAnswer((invocation) {});
    when(() => mockMovieRecommendationBloc.state)
        .thenAnswer((invocation) => MovieRecommendationSuccess(testMovieList));
    when(() => mockMovieWatchlistBloc.add(OnGetWatchlist()))
        .thenAnswer((invocation) {});
    when(() => mockMovieWatchlistBloc.state)
        .thenAnswer((invocation) => MovieWatchlistIsWatchlist(false));

    final watchlistButtonIcon = find.byIcon(Icons.add);

    await tester.pumpWidget(_makeTestableWidget(MovieDetailPage(id: 1)));

    expect(watchlistButtonIcon, findsOneWidget);
  });

  testWidgets(
      'Watchlist button should dispay check icon when movie is added to wathclist',
      (WidgetTester tester) async {
    when(() => mockMovieDetailBloc.add(OnGetDetail(tId)))
        .thenAnswer((invocation) {});
    when(() => mockMovieDetailBloc.state)
        .thenAnswer((invocation) => MovieDetailSuccess(testMovieDetail));
    when(() => mockMovieRecommendationBloc.add(OnGetRecommendation(tId)))
        .thenAnswer((invocation) {});
    when(() => mockMovieRecommendationBloc.state)
        .thenAnswer((invocation) => MovieRecommendationSuccess(testMovieList));
    when(() => mockMovieWatchlistBloc.add(OnGetWatchlist()))
        .thenAnswer((invocation) {});
    when(() => mockMovieWatchlistBloc.add(AddWatchlist(testMovieDetail)))
        .thenAnswer((invocation) {});
    when(() => mockMovieWatchlistBloc.state)
        .thenAnswer((invocation) => MovieWatchlistIsWatchlist(true));

    final watchlistButtonIcon = find.byIcon(Icons.check);

    await tester.pumpWidget(_makeTestableWidget(MovieDetailPage(id: 1)));

    expect(watchlistButtonIcon, findsOneWidget);
  });

  testWidgets(
      'Watchlist button should display Snackbar when added to watchlist',
      (WidgetTester tester) async {
    when(() => mockMovieDetailBloc.state)
        .thenAnswer((invocation) => MovieDetailSuccess(testMovieDetail));
    when(() => mockMovieDetailBloc.state)
        .thenAnswer((invocation) => MovieDetailSuccess(testMovieDetail));
    when(() => mockMovieRecommendationBloc.add(OnGetRecommendation(tId)))
        .thenAnswer((invocation) {});
    when(() => mockMovieRecommendationBloc.state)
        .thenAnswer((invocation) => MovieRecommendationSuccess(testMovieList));
    when(() => mockMovieWatchlistBloc.add(OnGetWatchlist()))
        .thenAnswer((invocation) {});
    when(() => mockMovieWatchlistBloc.state)
        .thenAnswer((invocation) => MovieWatchlistIsWatchlist(false));

    final watchlistButton = find.byType(ElevatedButton);

    await tester.pumpWidget(_makeTestableWidget(MovieDetailPage(id: 1)));

    expect(find.byIcon(Icons.add), findsOneWidget);

    await tester.tap(watchlistButton);
    await tester.pump();

    expect(find.byType(SnackBar), findsOneWidget);
    expect(find.text('Add to Watchlist'), findsOneWidget);
  });

  testWidgets(
      'Watchlist button should display AlertDialog when add to watchlist failed',
      (WidgetTester tester) async {
    whenListen(mockMovieDetailBloc,
        Stream.fromIterable([MovieDetailLoading(), MovieDetailError('Failed')]),
        initialState: MovieDetailInitial());
    whenListen(
        mockMovieWatchlistBloc,
        Stream.fromIterable(
            [MovieWatchlistLoading(), MovieWatchlistIsWatchlist(false)]),
        initialState: MovieWatchlistInitial());

    await tester.pumpWidget(
      _makeTestableWidget(MovieDetailPage(id: tId)),
    );
    await tester.pump(Duration.zero);

    expect(find.text('Failed'), findsOneWidget);
  });
}
