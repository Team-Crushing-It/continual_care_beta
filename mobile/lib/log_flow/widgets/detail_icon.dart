import 'package:flutter/material.dart';

class DetailIcon extends StatelessWidget {
  const DetailIcon({
    super.key,
    required this.icon,
    required this.primary,
    required this.secondary,
  });

  final IconData icon;
  final String primary;
  final String secondary;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 48,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                primary,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontSize: 18),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
              child: Text(
                secondary,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontSize: 18),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
