import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movie/movie.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../helpers/mock_bloc_helper.dart';

void main() {
  late MovieTopRatedBloc mockMovieTopRatedBloc;

  setUp(() {
    mockMovieTopRatedBloc = MockMovieTopRatedBloc();
  });

  setUpAll(() {
    registerFallbackValue(MovieTopRatedEventFake);
    registerFallbackValue(MovieTopRatedStateFake);
  });

  tearDown(() {
    mockMovieTopRatedBloc.close();
  });

  Widget makeTestableWidget(Widget body) {
    return BlocProvider(
      create: (_) => mockMovieTopRatedBloc,
      child: MaterialApp(
        home: body,
      ),
    );
  }

  testWidgets('Page should display center progress bar when loading',
      (WidgetTester tester) async {
    when(() => mockMovieTopRatedBloc.state)
        .thenAnswer((invocation) => MovieTopRatedLoading());

    final progressBarFinder = find.byType(CircularProgressIndicator);
    final centerFinder = find.byType(Center);

    await tester.pumpWidget(makeTestableWidget(const TopRatedMoviesPage()));

    expect(centerFinder, findsOneWidget);
    expect(progressBarFinder, findsOneWidget);
  });

  testWidgets('Page should display ListView when data is loaded',
      (WidgetTester tester) async {
    when(() => mockMovieTopRatedBloc.state)
        .thenAnswer((invocation) => MovieTopRatedLoading());
    when(() => mockMovieTopRatedBloc.state)
        .thenAnswer((invocation) => MovieTopRatedSuccess(testMovieList));

    final listViewFinder = find.byType(ListView);

    await tester.pumpWidget(makeTestableWidget(const TopRatedMoviesPage()));

    expect(listViewFinder, findsOneWidget);
  });

  testWidgets('Page should display text with message when Error',
      (WidgetTester tester) async {
    when(() => mockMovieTopRatedBloc.state)
        .thenAnswer((invocation) => MovieTopRatedLoading());
    when(() => mockMovieTopRatedBloc.state)
        .thenAnswer((invocation) => MovieTopRatedError("Failed"));

    final textFinder = find.byKey(const Key('error_message'));

    await tester.pumpWidget(makeTestableWidget(const TopRatedMoviesPage()));

    expect(textFinder, findsOneWidget);
  });
}
