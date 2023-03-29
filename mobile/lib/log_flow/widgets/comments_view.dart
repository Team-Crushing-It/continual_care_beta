import 'package:continual_care_beta/log_flow/log_flow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobs_api/jobs_api.dart';

class CommentsView extends StatelessWidget {
  final TextEditingController textFieldController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final state = context.watch<LogBloc>().state;
    return Column(
      children: [
        MainTitle(title: 'Comments'),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocBuilder<LogBloc, LogState>(
            // buildWhen: (previous, current) {
            //   return previous.comments!.length != current.comments!.length;
            // },
            builder: (context, state) {
              if (state.comments!.isNotEmpty) {
                return Container(
                  width: double.maxFinite,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.comments!.length,
                    itemBuilder: ((context, index) {
                      return CommentTile(
                        comment: state.comments![index],
                      );
                    }),
                  ),
                );
              }
              return Text('no comments');
            },
          ),
        ),
      ],
    );
  }
}
