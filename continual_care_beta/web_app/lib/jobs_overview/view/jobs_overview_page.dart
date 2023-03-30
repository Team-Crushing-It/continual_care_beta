import 'package:flutter/material.dart';
import 'package:continual_care_beta_web/jobs_overview/bloc/bloc.dart';
import 'package:continual_care_beta_web/jobs_overview/widgets/jobs_overview_body.dart';

/// {@template jobs_overview_page}
/// A description for JobsOverviewPage
/// {@endtemplate}
class JobsOverviewPage extends StatelessWidget {
  /// {@macro jobs_overview_page}
  const JobsOverviewPage({super.key});

  /// The static route for JobsOverviewPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const JobsOverviewPage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => JobsOverviewBloc(),
      child: const Scaffold(
        body: JobsOverviewView(),
      ),
    );
  }    
}

/// {@template jobs_overview_view}
/// Displays the Body of JobsOverviewView
/// {@endtemplate}
class JobsOverviewView extends StatelessWidget {
  /// {@macro jobs_overview_view}
  const JobsOverviewView({super.key});

  @override
  Widget build(BuildContext context) {
    return const JobsOverviewBody();
  }
}
