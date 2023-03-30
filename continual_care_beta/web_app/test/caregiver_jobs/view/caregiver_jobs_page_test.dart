// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:continual_care_beta_web/caregiver_jobs/caregiver_jobs.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CaregiverJobsPage', () {
    group('route', () {
      test('is routable', () {
        expect(CaregiverJobsPage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders CaregiverJobsView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: CaregiverJobsPage()));
      expect(find.byType(CaregiverJobsView), findsOneWidget);
    });
  });
}
