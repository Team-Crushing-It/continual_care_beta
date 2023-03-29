// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:continual_care_beta_web/home/home.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('HomePage', () {
    group('route', () {
      test('is routable', () {
        expect(HomePage.page, isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders HomeView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: HomePage()));
      expect(find.byType(HomeView), findsOneWidget);
    });
  });
}
