import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tv/tv.dart';

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

  Widget makeTestableWidget(Widget body) {
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

    await tester.pumpWidget(makeTestableWidget(const TopRatedTvPage()));

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

    await tester.pumpWidget(makeTestableWidget(const TopRatedTvPage()));

    expect(listViewFinder, findsOneWidget);
  });

  testWidgets('Page should display text with message when Error',
      (WidgetTester tester) async {
    when(() => mockTvTopRatedBloc.state)
        .thenAnswer((invocation) => TvTopRatedLoading());
    when(() => mockTvTopRatedBloc.state)
        .thenAnswer((invocation) => TvTopRatedError("Failed"));

    final textFinder = find.byKey(const Key('error_message'));

    await tester.pumpWidget(makeTestableWidget(const TopRatedTvPage()));

    expect(textFinder, findsOneWidget);
  });
}
