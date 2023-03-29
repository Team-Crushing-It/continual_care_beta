import 'package:continual_care_beta/home_overview/widgets/widgets.dart';
import 'package:continual_care_beta/log_flow/log_flow.dart';
import 'package:continual_care_beta/log_flow/widgets/detail_icon.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobs_api/jobs_api.dart';

class InitialPage extends StatelessWidget {
  const InitialPage({super.key});

  static MaterialPage<void> page() {
    return const MaterialPage<void>(child: InitialPage());
  }

  @override
  Widget build(BuildContext context) {
    final client = context.read<LogBloc>().state.client;
    final upcomingJob = context.read<LogBloc>().state.upcomingJob;
    final recentJob = context.read<LogBloc>().state.recentJob;
    final startDate = upcomingJob.startTime.dateIosFormat();
    final startTime = upcomingJob.startTime.timeFormat2();
    final location = upcomingJob.location;

    Log log;

    final logExists = recentJob.logs.isNotEmpty;

    if (logExists) {
      log = recentJob.logs.first;
    } else {
      log = Log();
    }

    var iadlsCount = 0;
    var badlsCount = 0;

    log.iadls!.forEach(
      (element) {
        if (element.isIndependent == true) {
          iadlsCount++;
        }
      },
    );

    log.badls!.forEach(
      (element) {
        if (element.isIndependent == true) {
          badlsCount++;
        }
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(client),
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            print('pressed');
            context.flow<LogState>().complete();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                MainTitle(title: 'Details'),
                DetailIcon(
                    icon: Icons.schedule,
                    primary: startDate!,
                    secondary: startTime!),
                DetailIcon(
                    icon: Icons.location_on_outlined,
                    primary: location,
                    secondary: location),
                MainTitle(title: 'Latest'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ADLTile(type: 'IADL', value: iadlsCount),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ADLTile(type: 'BADL', value: badlsCount),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: CommentsView(),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    StyledButton(
                      value: 'Start Now',
                      pressable: true,
                      onPressed: () {
                        context.read<LogBloc>().add(
                              LogStatusChanged(LogStatus.jobStarted),
                            );
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Location & time are saved once a job is started',
                          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                // fontStyle: FontStyle.italic,
                                fontSize: 14,
                              )),
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
