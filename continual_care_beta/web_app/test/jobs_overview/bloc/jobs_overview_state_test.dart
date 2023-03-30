// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:continual_care_beta_web/jobs_overview/bloc/bloc.dart';

void main() {
  group('JobsOverviewState', () {
    test('supports value equality', () {
      expect(
        JobsOverviewState(),
        equals(
          const JobsOverviewState(),
        ),
      );
    });

    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const JobsOverviewState(),
          isNotNull,
        );
      });
    });

    group('copyWith', () {
      test(
        'copies correctly '
        'when no argument specified',
        () {
          const jobsOverviewState = JobsOverviewState(
            customProperty: 'My property',
          );
          expect(
            jobsOverviewState.copyWith(),
            equals(jobsOverviewState),
          );
        },
      );

      test(
        'copies correctly '
        'when all arguments specified',
        () {
          const jobsOverviewState = JobsOverviewState(
            customProperty: 'My property',
          );
          final otherJobsOverviewState = JobsOverviewState(
            customProperty: 'My property 2',
          );
          expect(jobsOverviewState, isNot(equals(otherJobsOverviewState)));

          expect(
            jobsOverviewState.copyWith(
              customProperty: otherJobsOverviewState.customProperty,
            ),
            equals(otherJobsOverviewState),
          );
        },
      );
    });
  });
}
