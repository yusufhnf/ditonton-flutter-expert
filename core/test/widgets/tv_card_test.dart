import 'package:core/widgets/tv_card_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../dummy_data/tv_dummy_objects.dart';

void main() {
  Widget makeTestableWidget(Widget body) {
    return MaterialApp(
      home: Scaffold(
        body: body,
      ),
    );
  }

  testWidgets('Tv Card can show the text', (WidgetTester tester) async {
    await tester.pumpWidget(makeTestableWidget(TvCard(testTv)));
    expect(find.text("Pasión de gavilanes"), findsOneWidget);
  });
}
