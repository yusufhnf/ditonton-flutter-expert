import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tv/tv.dart';

import '../../dummy_data/tv_dummy_objects.dart';
import '../../helpers/tv_mock_bloc_helper.dart';

void main() {
  late TvPopularBloc mockTvPopularBloc;

  setUp(() {
    mockTvPopularBloc = MockTvPopularBloc();
  });

  setUpAll(() {
    registerFallbackValue(TvPopularEventFake);
    registerFallbackValue(TvPopularStateFake);
  });

  tearDown(() {
    mockTvPopularBloc.close();
  });

  Widget makeTestableWidget(Widget body) {
    return BlocProvider(
      create: (_) => mockTvPopularBloc,
      child: MaterialApp(
        home: body,
      ),
    );
  }

  testWidgets('Page should display center progress bar when loading',
      (WidgetTester tester) async {
    when(() => mockTvPopularBloc.state)
        .thenAnswer((invocation) => TvPopularLoading());

    final progressBarFinder = find.byType(CircularProgressIndicator);
    final centerFinder = find.byType(Center);

    await tester.pumpWidget(makeTestableWidget(const PopularTvPage()));

    expect(centerFinder, findsOneWidget);
    expect(progressBarFinder, findsOneWidget);
  });

  testWidgets('Page should display ListView when data is loaded',
      (WidgetTester tester) async {
    when(() => mockTvPopularBloc.state)
        .thenAnswer((invocation) => TvPopularLoading());
    when(() => mockTvPopularBloc.state)
        .thenAnswer((invocation) => TvPopularSuccess(testTvList));

    final listViewFinder = find.byType(ListView);

    await tester.pumpWidget(makeTestableWidget(const PopularTvPage()));

    expect(listViewFinder, findsOneWidget);
  });

  testWidgets('Page should display text with message when Error',
      (WidgetTester tester) async {
    when(() => mockTvPopularBloc.state)
        .thenAnswer((invocation) => TvPopularLoading());
    when(() => mockTvPopularBloc.state)
        .thenAnswer((invocation) => TvPopularError("Failed"));

    final textFinder = find.byKey(const Key('error_message'));

    await tester.pumpWidget(makeTestableWidget(const PopularTvPage()));

    expect(textFinder, findsOneWidget);
  });
}
