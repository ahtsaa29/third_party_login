import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.width,
    required this.text,
    this.onPressed,
    this.buttonColor,
  });
  final double? width;
  final String text;
  final Function()? onPressed;
  final Color? buttonColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
      width: width ?? MediaQuery.of(context).size.width,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all(buttonColor ?? Colors.green),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }
}
