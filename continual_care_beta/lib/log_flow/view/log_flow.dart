import 'package:continual_care_beta/app/bloc/app_bloc.dart';
import 'package:continual_care_beta/app/view/loading_page.dart';
import 'package:continual_care_beta/log_flow/log_flow.dart';

import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobs_api/jobs_api.dart';
import 'package:jobs_repository/jobs_repository.dart';

List<Page> onGenerateLocationPages(LogState state, List<Page> pages) {
  return [
    if (state.status == LogStatus.initial) InitialPage.page(),
    if (state.status == LogStatus.jobStarted) CaregiverPage.page(),
    if (state.status == LogStatus.caregiverCompleted) TasksPage.page(),
    if (state.status == LogStatus.tasksCompleted) IadlsPage.page(),
    if (state.status == LogStatus.iadlsCompleted) BadlsPage.page(),
    if (state.status == LogStatus.badlsCompleted) CommentsPage.page(),
    if (state.status == LogStatus.loading) LoadingPage.page(),
    if (state.status == LogStatus.success) LoadingPage.page(),
  ];
}

class LogFlow extends StatelessWidget {
  const LogFlow({super.key});

  static Route<void> route({Log? initialLog, required Job upcomingJob, required Job recentJob}) {
    return MaterialPageRoute(
      fullscreenDialog: true,
      builder: (context) => BlocProvider(
        create: (context) => LogBloc(
          user: User(
            id: context.read<AppBloc>().state.user.id,
            name: context.read<AppBloc>().state.user.name,
            email: context.read<AppBloc>().state.user.email,
            photo: context.read<AppBloc>().state.user.photo,
          ),
          jobsRepository: context.read<JobsRepository>(),
          initialLog: Log(),
          upcomingJob: upcomingJob,
          recentJob: recentJob
        )..add(LogLocationRequested()),
        child: const LogFlow(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildLogFlow();
  }
}

class _buildLogFlow extends StatelessWidget {
  const _buildLogFlow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlowBuilder<LogState>(
      state: context.select((LogBloc bloc) => bloc.state),
      onGeneratePages: onGenerateLocationPages,
    );
  }
}
