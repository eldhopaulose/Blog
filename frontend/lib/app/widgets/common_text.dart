import 'package:flutter/material.dart';

class CommonText extends StatelessWidget {
  final String text;
  final TextStyle style;

  const CommonText({super.key, required this.text, required this.style});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
    );
  }
}
