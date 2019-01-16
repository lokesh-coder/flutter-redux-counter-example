// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_counter/main.dart';
import 'package:flutter_counter/models/counter.dart';
import 'package:flutter_counter/reducers/main.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:redux/redux.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    final Store<Counter> store = Store(
      mainReducer,
      initialState: Counter(),
    );
    // Build our app and trigger a frame.
    await tester.pumpWidget(CounterApp(store: store));

    // Verify that our counter starts at 0.
    expect(find.byWidget(MaterialApp), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.chevron_right));
    await tester.tap(find.byIcon(Icons.plus_one));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
