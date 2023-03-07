import 'package:ditonton/presentation/bloc/tv/tv_top_rated/tv_top_rated_bloc.dart';
import 'package:ditonton/presentation/pages/tv/top_rated_tv_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../dummy_data/tv_dummy_objects.dart';
import '../../helpers/tv_mock_bloc_helper.dart';

void main() {
  late TvTopRatedBloc mockTvTopRatedBloc;

  setUp(() {
    mockTvTopRatedBloc = MockTvTopRatedBloc();
  });

  setUpAll(() {
    registerFallbackValue(TvTopRatedEventFake);
    registerFallbackValue(TvTopRatedStateFake);
  });

  tearDown(() {
    mockTvTopRatedBloc.close();
  });

  Widget _makeTestableWidget(Widget body) {
    return BlocProvider(
      create: (_) => mockTvTopRatedBloc,
      child: MaterialApp(
        home: body,
      ),
    );
  }

  testWidgets('Page should display center progress bar when loading',
      (WidgetTester tester) async {
    when(() => mockTvTopRatedBloc.state)
        .thenAnswer((invocation) => TvTopRatedLoading());

    final progressBarFinder = find.byType(CircularProgressIndicator);
    final centerFinder = find.byType(Center);

    await tester.pumpWidget(_makeTestableWidget(TopRatedTvPage()));

    expect(centerFinder, findsOneWidget);
    expect(progressBarFinder, findsOneWidget);
  });

  testWidgets('Page should display ListView when data is loaded',
      (WidgetTester tester) async {
    when(() => mockTvTopRatedBloc.state)
        .thenAnswer((invocation) => TvTopRatedLoading());
    when(() => mockTvTopRatedBloc.state)
        .thenAnswer((invocation) => TvTopRatedSuccess(testTvList));

    final listViewFinder = find.byType(ListView);

    await tester.pumpWidget(_makeTestableWidget(TopRatedTvPage()));

    expect(listViewFinder, findsOneWidget);
  });

  testWidgets('Page should display text with message when Error',
      (WidgetTester tester) async {
    when(() => mockTvTopRatedBloc.state)
        .thenAnswer((invocation) => TvTopRatedLoading());
    when(() => mockTvTopRatedBloc.state)
        .thenAnswer((invocation) => TvTopRatedError("Failed"));

    final textFinder = find.byKey(Key('error_message'));

    await tester.pumpWidget(_makeTestableWidget(TopRatedTvPage()));

    expect(textFinder, findsOneWidget);
  });
}
