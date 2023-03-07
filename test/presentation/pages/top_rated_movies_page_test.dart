import 'package:ditonton/presentation/bloc/movie_top_rated/movie_top_rated_bloc.dart';
import 'package:ditonton/presentation/pages/top_rated_movies_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

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

  Widget _makeTestableWidget(Widget body) {
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

    await tester.pumpWidget(_makeTestableWidget(TopRatedMoviesPage()));

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

    await tester.pumpWidget(_makeTestableWidget(TopRatedMoviesPage()));

    expect(listViewFinder, findsOneWidget);
  });

  testWidgets('Page should display text with message when Error',
      (WidgetTester tester) async {
    when(() => mockMovieTopRatedBloc.state)
        .thenAnswer((invocation) => MovieTopRatedLoading());
    when(() => mockMovieTopRatedBloc.state)
        .thenAnswer((invocation) => MovieTopRatedError("Failed"));

    final textFinder = find.byKey(Key('error_message'));

    await tester.pumpWidget(_makeTestableWidget(TopRatedMoviesPage()));

    expect(textFinder, findsOneWidget);
  });
}
