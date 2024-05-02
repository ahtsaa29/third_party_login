import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FormWidget extends StatelessWidget {
  final double? width;
  final String hintText;
  final TextEditingController controller;
  final bool? obscureText;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  const FormWidget({
    super.key,
    this.width,
    required this.hintText,
    required this.controller,
    this.obscureText = false,
    this.inputFormatters,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText!,
        inputFormatters: inputFormatters ?? [],
        keyboardType: keyboardType ?? TextInputType.name,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.green),
            borderRadius: BorderRadius.circular(10),
          ),
          hintText: hintText,
        ),
      ),
    );
  }
}
