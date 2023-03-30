// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:continual_care_beta_web/caregiver_jobs/bloc/bloc.dart';

void main() {
  group('CaregiverJobsState', () {
    test('supports value equality', () {
      expect(
        CaregiverJobsState(),
        equals(
          const CaregiverJobsState(),
        ),
      );
    });

    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const CaregiverJobsState(),
          isNotNull,
        );
      });
    });

    group('copyWith', () {
      test(
        'copies correctly '
        'when no argument specified',
        () {
          const caregiverJobsState = CaregiverJobsState(
            customProperty: 'My property',
          );
          expect(
            caregiverJobsState.copyWith(),
            equals(caregiverJobsState),
          );
        },
      );

      test(
        'copies correctly '
        'when all arguments specified',
        () {
          const caregiverJobsState = CaregiverJobsState(
            customProperty: 'My property',
          );
          final otherCaregiverJobsState = CaregiverJobsState(
            customProperty: 'My property 2',
          );
          expect(caregiverJobsState, isNot(equals(otherCaregiverJobsState)));

          expect(
            caregiverJobsState.copyWith(
              customProperty: otherCaregiverJobsState.customProperty,
            ),
            equals(otherCaregiverJobsState),
          );
        },
      );
    });
  });
}
