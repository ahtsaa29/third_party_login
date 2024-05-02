import 'package:flutter/material.dart';

class AuthFunctions {
  errorMessage(String message, BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text(
                message.toUpperCase(),
              ),
              content: const Text("Please check the Credentials and try again"),
            ));
  }
}

AuthFunctions authFunctions = AuthFunctions();
