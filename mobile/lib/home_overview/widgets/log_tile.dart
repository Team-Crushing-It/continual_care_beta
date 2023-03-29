import 'package:continual_care_beta/home_overview/home_overview.dart';
import 'package:flutter/material.dart';
import 'package:jobs_api/jobs_api.dart';

class JobTile extends StatelessWidget {
  const JobTile({
    Key? key,
    required this.initialJob,
    this.onTap,
  }) : super(key: key);

  final Job initialJob;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    Log log;

    final logExists = initialJob.logs.isNotEmpty;

    if (logExists) {
      log = initialJob.logs.first;
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

    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        height: 80,
        decoration: ShapeDecoration(
          shape: Border(
            bottom: BorderSide(
              color: Colors.black,
              width: 0.5,
            ),
          ),
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.all(0),
          minVerticalPadding: 0,
          onTap: onTap,
          title: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  logExists
                      ? Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              log.completed.dateIosFormat()!,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(log.completed.timeFormat()!),
                            ),
                          ],
                        )
                      : Text(
                          'na',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text.rich(
                        overflow: TextOverflow.ellipsis,
                        TextSpan(children: [
                          TextSpan(
                            text: "Mood: ",
                            style: TextStyle(
                              color: Color(0xff989898),
                            ),
                          ),
                          if (log.iMood == Mood.happy) TextSpan(text: "🤩"),
                          if (log.iMood == Mood.neutral) TextSpan(text: "😐"),
                          if (log.iMood == Mood.sad) TextSpan(text: "😔"),
                        ])),
                  ),
                ],
              ),
            ],
          ),
          subtitle: Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _InfoItem(
                    title: "Comments",
                    count: logExists ? log.comments.length : 0),
                // InfoItem(title: "Tasks", count: initialJob.tasks.length),
                _InfoItem(title: "IADL", count: logExists ? iadlsCount : 0),
                _InfoItem(title: "BADL", count: logExists ? badlsCount : 0)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _InfoItem extends StatelessWidget {
  const _InfoItem({Key? key, required this.title, required this.count})
      : super(key: key);
  final String title;
  final int count;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        ),
        Text(
          count.toString(),
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
        ),
      ],
    );
  }
}
