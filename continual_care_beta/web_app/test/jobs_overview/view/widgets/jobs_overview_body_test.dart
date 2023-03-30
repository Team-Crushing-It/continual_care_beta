// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:continual_care_beta_web/jobs_overview/jobs_overview.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('JobsOverviewBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        BlocProvider(
          create: (context) => JobsOverviewBloc(),
          child: MaterialApp(home: JobsOverviewBody()),
        ),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}
