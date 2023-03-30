// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:continual_care_beta_web/jobs_overview/bloc/bloc.dart';

void main() {
  group('JobsOverviewBloc', () {
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          JobsOverviewBloc(),
          isNotNull,
        );
      });
    });

    test('initial state has default value for customProperty', () {
      final jobsOverviewBloc = JobsOverviewBloc();
      expect(jobsOverviewBloc.state.customProperty, equals('Default Value'));
    });

    blocTest<JobsOverviewBloc, JobsOverviewState>(
      'CustomJobsOverviewEvent emits nothing',
      build: JobsOverviewBloc.new,
      act: (bloc) => bloc.add(const CustomJobsOverviewEvent()),
      expect: () => <JobsOverviewState>[],
    );
  });
}
