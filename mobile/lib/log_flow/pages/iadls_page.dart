import 'package:continual_care_beta/home_overview/widgets/widgets.dart';
import 'package:continual_care_beta/log_flow/log_flow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IadlsPage extends StatelessWidget {
  const IadlsPage({super.key});

  static MaterialPage<void> page() {
    return const MaterialPage<void>(child: IadlsPage());
  }

  @override
  Widget build(BuildContext context) {
    final date = context.read<LogBloc>().state.started!;
    final iadls = context.watch<LogBloc>().state.iadls;

    return Scaffold(
      appBar: AppBar(
        title: Text(date.dateIosFormat()!),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            context
                .read<LogBloc>()
                .add(LogStatusChanged(LogStatus.caregiverCompleted));
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
                                  MainTitle(title: 'Instrumental ADLs'),
                                  for (final iadl in iadls!)
                                    ADLCheck(
                                      adl: iadl,
                                      isIadl: true,
                                    ),
                                ],
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
                            LogStatusChanged(LogStatus.iadlsCompleted),
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
