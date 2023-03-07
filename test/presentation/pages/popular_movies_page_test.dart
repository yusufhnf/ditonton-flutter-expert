import 'package:ditonton/presentation/bloc/movie_popular/movie_popular_bloc.dart';
import 'package:ditonton/presentation/pages/popular_movies_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../helpers/mock_bloc_helper.dart';

void main() {
  late MoviePopularBloc mockMoviePopularBloc;

  setUp(() {
    mockMoviePopularBloc = MockMoviePopularBloc();
  });

  setUpAll(() {
    registerFallbackValue(MoviePopularEventFake);
    registerFallbackValue(MoviePopularStateFake);
  });

  tearDown(() {
    mockMoviePopularBloc.close();
  });

  Widget _makeTestableWidget(Widget body) {
    return BlocProvider(
      create: (_) => mockMoviePopularBloc,
      child: MaterialApp(
        home: body,
      ),
    );
  }

  testWidgets('Page should display center progress bar when loading',
      (WidgetTester tester) async {
    when(() => mockMoviePopularBloc.state)
        .thenAnswer((invocation) => MoviePopularLoading());

    final progressBarFinder = find.byType(CircularProgressIndicator);
    final centerFinder = find.byType(Center);

    await tester.pumpWidget(_makeTestableWidget(PopularMoviesPage()));

    expect(centerFinder, findsOneWidget);
    expect(progressBarFinder, findsOneWidget);
  });

  testWidgets('Page should display ListView when data is loaded',
      (WidgetTester tester) async {
    when(() => mockMoviePopularBloc.state)
        .thenAnswer((invocation) => MoviePopularLoading());
    when(() => mockMoviePopularBloc.state)
        .thenAnswer((invocation) => MoviePopularSuccess(testMovieList));

    final listViewFinder = find.byType(ListView);

    await tester.pumpWidget(_makeTestableWidget(PopularMoviesPage()));

    expect(listViewFinder, findsOneWidget);
  });

  testWidgets('Page should display text with message when Error',
      (WidgetTester tester) async {
    when(() => mockMoviePopularBloc.state)
        .thenAnswer((invocation) => MoviePopularLoading());
    when(() => mockMoviePopularBloc.state)
        .thenAnswer((invocation) => MoviePopularError("Failed"));

    final textFinder = find.byKey(Key('error_message'));

    await tester.pumpWidget(_makeTestableWidget(PopularMoviesPage()));

    expect(textFinder, findsOneWidget);
  });
}
