import 'package:mobile/home_overview/widgets/widgets.dart';
import 'package:mobile/log_flow/log_flow.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommentsPage extends StatelessWidget {
  const CommentsPage({super.key});

  static MaterialPage<void> page() {
    return const MaterialPage<void>(child: CommentsPage());
  }

  @override
  Widget build(BuildContext context) {
    final date = context.read<LogBloc>().state.started!;
    final client = context.read<LogBloc>().state.client;

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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  children: [
                    LogProgress(),
                    Expanded(
                        child: Column(
                      children: [
                        MoodPicker(
                          prompt: 'How was $client today?',
                          cMood: false,
                        ),
                        Comments(),
                      ],
                    )),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: StyledButton(
                      value: 'Finish',
                      pressable: true,
                      onPressed: () {
                        // call the event to submit new log
                        context.read<LogBloc>().add(
                              LogSubmitted(),
                            );
                        // once the event is complete, then complete the flow
                        context.flow<LogState>().complete();
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
