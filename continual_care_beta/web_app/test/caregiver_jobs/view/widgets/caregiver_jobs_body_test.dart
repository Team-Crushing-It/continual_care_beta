// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:continual_care_beta_web/caregiver_jobs/caregiver_jobs.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CaregiverJobsBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        BlocProvider(
          create: (context) => CaregiverJobsBloc(),
          child: MaterialApp(home: CaregiverJobsBody()),
        ),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}
