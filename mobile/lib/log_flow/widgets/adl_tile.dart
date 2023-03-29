import 'package:flutter/material.dart';

class ADLTile extends StatelessWidget {
  const ADLTile({
    super.key,
    required this.type,
    required this.value,
  });

  final String type;
  final int value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        VerticalText(type),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                'Latest',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontSize: 16),
              ),
              Text(
                value.toString(),
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontSize: 16),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                'Average',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontSize: 16),
              ),
              Text(
                value.toString(),
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontSize: 16),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class VerticalText extends StatelessWidget {
  final String text;

  const VerticalText(this.text);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 16,
      direction: Axis.vertical,
      alignment: WrapAlignment.center,
      children: text
          .split("")
          .map((string) => Text(string, style: TextStyle(fontSize: 10)))
          .toList(),
    );
  }
}
