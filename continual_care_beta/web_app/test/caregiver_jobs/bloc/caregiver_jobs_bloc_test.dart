// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:continual_care_beta_web/caregiver_jobs/bloc/bloc.dart';

void main() {
  group('CaregiverJobsBloc', () {
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          CaregiverJobsBloc(),
          isNotNull,
        );
      });
    });

    test('initial state has default value for customProperty', () {
      final caregiverJobsBloc = CaregiverJobsBloc();
      expect(caregiverJobsBloc.state.customProperty, equals('Default Value'));
    });

    blocTest<CaregiverJobsBloc, CaregiverJobsState>(
      'CustomCaregiverJobsEvent emits nothing',
      build: CaregiverJobsBloc.new,
      act: (bloc) => bloc.add(const CustomCaregiverJobsEvent()),
      expect: () => <CaregiverJobsState>[],
    );
  });
}
