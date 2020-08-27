// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:rumah_arisan/main.dart';
import 'package:rumah_arisan/models/models.dart';
import 'package:rumah_arisan/services/services.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });

  test("Testing Remote Config", () async {
    Map _headers = await RemoteConfigService.getHeaders();
    print(_headers.toString());
    expect(_headers, null);
  });

  test("Testing getToken", () async {
    TokenResult _token = await AuthServices.getTokenResult("X7t9lCD96O6q7qkGJuLP8fTf8fWRqjG4W3meN9Htl");

    print(_token.status);

    expect(_token.status, true);
  });
}
