import 'package:flutter/material.dart';

class StyledButton extends StatelessWidget {
  const StyledButton({
    super.key,
    required this.onPressed,
    required this.pressable,
    required this.value,
  });

  final VoidCallback onPressed;
  final bool pressable;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 32,
      child: pressable
          ? OutlinedButton(
              onPressed: onPressed,
              child: Text(
                value,
                style: TextStyle(
                  // fontWeight: FontWeight.w900,
                  fontSize: 16,
                  color: Color(0xffD00404),
                ),
              ),
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: Color(0xffD00404), width: 1.0),
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            )
          : OutlinedButton(
              onPressed: null,
              child: Text(
                value,
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
              ),
            ),
    );
  }
}
