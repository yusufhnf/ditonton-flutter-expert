import 'package:ditonton/presentation/widgets/movie_card_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../dummy_data/dummy_objects.dart';

void main() {
  Widget _makeTestableWidget(Widget body) {
    return MaterialApp(
      home: Scaffold(
        body: body,
      ),
    );
  }

  testWidgets('Movie Card can show the text', (WidgetTester tester) async {
    await tester.pumpWidget(_makeTestableWidget(MovieCard(testMovie)));
    expect(find.text("Spider-Man"), findsOneWidget);
  });
}
