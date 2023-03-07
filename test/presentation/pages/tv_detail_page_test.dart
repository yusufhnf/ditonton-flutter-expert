import 'package:bloc_test/bloc_test.dart';
import 'package:ditonton/presentation/bloc/tv/tv_detail/tv_detail_bloc.dart';
import 'package:ditonton/presentation/bloc/tv/tv_recommendation/tv_recommendation_bloc.dart';
import 'package:ditonton/presentation/bloc/tv/tv_watchlist/tv_watchlist_bloc.dart';
import 'package:ditonton/presentation/pages/tv/tv_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../dummy_data/tv_dummy_objects.dart';
import '../../helpers/tv_mock_bloc_helper.dart';

void main() {
  late TvDetailBloc mockTvDetailBloc;
  late TvWatchlistBloc mockTvWatchlistBloc;
  late TvRecommendationBloc mockTvRecommendationBloc;

  setUp(() {
    mockTvDetailBloc = MockTvDetailBloc();
    mockTvWatchlistBloc = MockTvWatchlistBloc();
    mockTvRecommendationBloc = MockTvRecommendationBloc();
  });

  setUpAll(() {
    registerFallbackValue(TvDetailEventFake);
    registerFallbackValue(TvDetailStateFake);
    registerFallbackValue(TvWatchlistEventFake);
    registerFallbackValue(TvWatchlistStateFake);
  });

  tearDown(() {
    mockTvDetailBloc.close();
    mockTvRecommendationBloc.close();
    mockTvWatchlistBloc.close();
  });

  final tId = 1;

  Widget _makeTestableWidget(Widget body) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => mockTvDetailBloc,
        ),
        BlocProvider(
          create: (_) => mockTvRecommendationBloc,
        ),
        BlocProvider(
          create: (_) => mockTvWatchlistBloc,
        ),
      ],
      child: MaterialApp(
        home: body,
      ),
    );
  }

  testWidgets(
      'Watchlist button should display add icon when tv not added to watchlist',
      (WidgetTester tester) async {
    when(() => mockTvDetailBloc.state)
        .thenAnswer((invocation) => TvDetailSuccess(testTvDetail));
    when(() => mockTvDetailBloc.state)
        .thenAnswer((invocation) => TvDetailSuccess(testTvDetail));
    when(() => mockTvRecommendationBloc.add(OnGetRecommendation(tId)))
        .thenAnswer((invocation) {});
    when(() => mockTvRecommendationBloc.state)
        .thenAnswer((invocation) => TvRecommendationSuccess(testTvList));
    when(() => mockTvWatchlistBloc.add(OnGetWatchlist()))
        .thenAnswer((invocation) {});
    when(() => mockTvWatchlistBloc.state)
        .thenAnswer((invocation) => TvWatchlistIsWatchlist(false));

    final watchlistButtonIcon = find.byIcon(Icons.add);

    await tester.pumpWidget(_makeTestableWidget(TvDetailPage(id: 1)));

    expect(watchlistButtonIcon, findsOneWidget);
  });

  testWidgets(
      'Watchlist button should dispay check icon when tv is added to wathclist',
      (WidgetTester tester) async {
    when(() => mockTvDetailBloc.add(OnGetDetail(tId)))
        .thenAnswer((invocation) {});
    when(() => mockTvDetailBloc.state)
        .thenAnswer((invocation) => TvDetailSuccess(testTvDetail));
    when(() => mockTvRecommendationBloc.add(OnGetRecommendation(tId)))
        .thenAnswer((invocation) {});
    when(() => mockTvRecommendationBloc.state)
        .thenAnswer((invocation) => TvRecommendationSuccess(testTvList));
    when(() => mockTvWatchlistBloc.add(OnGetWatchlist()))
        .thenAnswer((invocation) {});
    when(() => mockTvWatchlistBloc.add(AddWatchlist(testTvDetail)))
        .thenAnswer((invocation) {});
    when(() => mockTvWatchlistBloc.state)
        .thenAnswer((invocation) => TvWatchlistIsWatchlist(true));

    final watchlistButtonIcon = find.byIcon(Icons.check);

    await tester.pumpWidget(_makeTestableWidget(TvDetailPage(id: 1)));

    expect(watchlistButtonIcon, findsOneWidget);
  });

  testWidgets(
      'Watchlist button should display Snackbar when added to watchlist',
      (WidgetTester tester) async {
    when(() => mockTvDetailBloc.state)
        .thenAnswer((invocation) => TvDetailSuccess(testTvDetail));
    when(() => mockTvDetailBloc.state)
        .thenAnswer((invocation) => TvDetailSuccess(testTvDetail));
    when(() => mockTvRecommendationBloc.add(OnGetRecommendation(tId)))
        .thenAnswer((invocation) {});
    when(() => mockTvRecommendationBloc.state)
        .thenAnswer((invocation) => TvRecommendationSuccess(testTvList));
    when(() => mockTvWatchlistBloc.add(OnGetWatchlist()))
        .thenAnswer((invocation) {});
    when(() => mockTvWatchlistBloc.state)
        .thenAnswer((invocation) => TvWatchlistIsWatchlist(false));

    final watchlistButton = find.byType(ElevatedButton);

    await tester.pumpWidget(_makeTestableWidget(TvDetailPage(id: 1)));

    expect(find.byIcon(Icons.add), findsOneWidget);

    await tester.tap(watchlistButton);
    await tester.pump();

    expect(find.byType(SnackBar), findsOneWidget);
    expect(find.text('Add to Watchlist'), findsOneWidget);
  });

  testWidgets(
      'Watchlist button should display AlertDialog when add to watchlist failed',
      (WidgetTester tester) async {
    when(() => mockTvDetailBloc.state)
        .thenAnswer((invocation) => TvDetailLoading());
    when(() => mockTvDetailBloc.state)
        .thenAnswer((invocation) => TvDetailError('Failed'));
    when(() => mockTvWatchlistBloc.state)
        .thenAnswer((invocation) => TvWatchlistLoading());
    when(() => mockTvWatchlistBloc.state)
        .thenAnswer((invocation) => TvWatchlistError('Failed'));

    await tester.pumpWidget(
      _makeTestableWidget(TvDetailPage(id: tId)),
    );
    await tester.pump(Duration.zero);

    expect(find.text('Failed'), findsOneWidget);
  });
}
