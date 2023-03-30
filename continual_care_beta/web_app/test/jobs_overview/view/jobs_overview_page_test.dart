// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:continual_care_beta_web/jobs_overview/jobs_overview.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('JobsOverviewPage', () {
    group('route', () {
      test('is routable', () {
        expect(JobsOverviewPage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders JobsOverviewView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: JobsOverviewPage()));
      expect(find.byType(JobsOverviewView), findsOneWidget);
    });
  });
}
