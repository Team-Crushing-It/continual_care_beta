import 'package:flutter/material.dart';
import 'package:continual_care_beta_web/jobs_overview/bloc/bloc.dart';

/// {@template jobs_overview_body}
/// Body of the JobsOverviewPage.
///
/// Add what it does
/// {@endtemplate}
class JobsOverviewBody extends StatelessWidget {
  /// {@macro jobs_overview_body}
  const JobsOverviewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<JobsOverviewBloc, JobsOverviewState>(
      builder: (context, state) {
        return Center(child: Text(state.customProperty));
      },
    );
  }
}
