import 'package:flutter/material.dart';

class CustomOutlineButton extends StatelessWidget {
  const CustomOutlineButton({
    super.key,
    this.onPressed,
    this.color = Colors.blue,
    required this.text,
    this.isFilled = false,
  });
  final void Function()? onPressed;
  final Color color;
  final String text;
  final bool isFilled;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(isFilled ? color.withOpacity(0.3) : Colors.transparent),
          side: MaterialStateProperty.all(BorderSide(color: color)),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(
            text,
            style: const TextStyle(fontSize: 16),
          ),
        ));
  }
}
