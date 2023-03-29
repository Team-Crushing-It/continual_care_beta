import 'package:mobile/home_overview/widgets/widgets.dart';
import 'package:mobile/log_flow/log_flow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CaregiverPage extends StatelessWidget {
  const CaregiverPage({super.key});

  static MaterialPage<void> page() {
    return const MaterialPage<void>(child: CaregiverPage());
  }

  @override
  Widget build(BuildContext context) {
    final date = context.read<LogBloc>().state.started!;

    return Scaffold(
      appBar: AppBar(
        title: Text(date.dateIosFormat()!),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
                        context.read<LogBloc>().add(LogStatusChanged(LogStatus.initial));
          },
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                LogProgress(),
                MoodPicker(
                  prompt: 'How are you doing today?',
                  cMood: true,
                ),
                
              ],
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
                            LogStatusChanged(LogStatus.caregiverCompleted),
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
