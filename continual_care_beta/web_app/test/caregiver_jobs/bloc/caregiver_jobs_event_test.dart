// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:continual_care_beta_web/caregiver_jobs/bloc/bloc.dart';

void main() {
  group('CaregiverJobsEvent', () {  
    group('CustomCaregiverJobsEvent', () {
      test('supports value equality', () {
        expect(
          CustomCaregiverJobsEvent(),
          equals(const CustomCaregiverJobsEvent()),
        );
      });
    });
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const CustomCaregiverJobsEvent(),
          isNotNull
        );
      });
    });
  });
}
