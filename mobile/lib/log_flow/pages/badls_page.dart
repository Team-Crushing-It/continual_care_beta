import 'package:continual_care_beta/home_overview/widgets/widgets.dart';
import 'package:continual_care_beta/log_flow/log_flow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BadlsPage extends StatelessWidget {
  const BadlsPage({super.key});

  static MaterialPage<void> page() {
    return const MaterialPage<void>(child: BadlsPage());
  }

  @override
  Widget build(BuildContext context) {
    final date = context.read<LogBloc>().state.started!;
    final badls = context.watch<LogBloc>().state.badls;

    return Scaffold(
      appBar: AppBar(
        title: Text(date.dateIosFormat()!),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            context
                .read<LogBloc>()
                .add(LogStatusChanged(LogStatus.tasksCompleted));
          },
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  LogProgress(),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  MainTitle(title: 'Basic ADLs'),
                                  for (final badl in badls!)
                                    ADLCheck(
                                      adl: badl,
                                      isIadl: false,
                                    ),
                                ],
                              ),
                            ),
                          ),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 32.0),
                              child: ContinueButton(
                                pressable: true,
                                onPressed: () {
                                  context.read<LogBloc>().add(
                                        LogStatusChanged(LogStatus.badlsCompleted),
                                      );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: StyledButton(
                    value: 'Continue',
                    pressable: true,
                    onPressed: () {
                      context.read<LogBloc>().add(
                            LogStatusChanged(LogStatus.badlsCompleted),
                          );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
