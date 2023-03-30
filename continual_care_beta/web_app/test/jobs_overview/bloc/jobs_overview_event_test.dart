// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:continual_care_beta_web/jobs_overview/bloc/bloc.dart';

void main() {
  group('JobsOverviewEvent', () {  
    group('CustomJobsOverviewEvent', () {
      test('supports value equality', () {
        expect(
          CustomJobsOverviewEvent(),
          equals(const CustomJobsOverviewEvent()),
        );
      });
    });
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const CustomJobsOverviewEvent(),
          isNotNull
        );
      });
    });
  });
}
