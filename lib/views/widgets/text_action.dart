import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TextAction extends StatelessWidget {
  final String text;
  final String action;
  final Function()? onAction;
  const TextAction({
    super.key,
    required this.text,
    required this.action,
    this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
          text: text,
          style: const TextStyle(color: Colors.black),
          children: [
            TextSpan(
                text: action,
                style: const TextStyle(color: Colors.green),
                recognizer: TapGestureRecognizer()..onTap = onAction),
          ]),
    );
  }
}
