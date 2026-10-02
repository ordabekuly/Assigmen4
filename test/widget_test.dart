import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_application_2/main.dart';

void main() {
  testWidgets('profile actions toggle and reset correctly', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Follow'), findsOneWidget);
    expect(find.text('128 likes'), findsOneWidget);
    expect(find.byIcon(Icons.favorite_border_rounded), findsOneWidget);

    await tester.tap(find.byKey(const Key('followButton')));
    await tester.pump();
    expect(find.text('Following'), findsOneWidget);

    await tester.tap(find.byKey(const Key('likeButton')));
    await tester.pump();
    expect(find.text('129 likes'), findsOneWidget);
    expect(find.byIcon(Icons.favorite_rounded), findsOneWidget);

    await tester.tap(find.text('Reset'));
    await tester.pump();
    expect(find.text('Follow'), findsOneWidget);
    expect(find.text('128 likes'), findsOneWidget);
    expect(find.byIcon(Icons.favorite_border_rounded), findsOneWidget);
  });

  testWidgets('tapping like twice increments and decrements the counter', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.byKey(const Key('likeButton')));
    await tester.pump();
    expect(find.text('129 likes'), findsOneWidget);

    await tester.tap(find.byKey(const Key('likeButton')));
    await tester.pump();
    expect(find.text('128 likes'), findsOneWidget);
  });
}
