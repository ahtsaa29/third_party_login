import 'package:carry_or_drag/common/auth_functions.dart';
import 'package:carry_or_drag/constants/base_page.dart';
import 'package:carry_or_drag/services/auth_services.dart';
import 'package:carry_or_drag/views/pages/home_page.dart';
import 'package:carry_or_drag/views/pages/sign_in_page.dart';
import 'package:carry_or_drag/views/widgets/custom_button.dart';
import 'package:carry_or_drag/views/widgets/form_widget.dart';
import 'package:carry_or_drag/views/widgets/text_action.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();
    return BasePage(
        title: "Sign up",
        bodyWidget: Column(
          children: [
            const Text("Register Page"),
            const SizedBox(
              height: 40,
            ),
            FormWidget(
              hintText: "Email",
              controller: emailController,
            ),
            FormWidget(
              hintText: "Password",
              obscureText: true,
              controller: passwordController,
            ),
            FormWidget(
              hintText: "Confirm Password",
              obscureText: true,
              controller: confirmPasswordController,
            ),
            CustomButton(
              text: "Sign In",
              onPressed: () async {
                if (passwordController.text == confirmPasswordController.text) {
                  AuthService().signUpWithEmailPassword(
                      context, emailController, passwordController);
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const HomePage()));
                } else {
                  authFunctions.errorMessage(
                      "Passwords Doesn't match", context);
                }
              },
            ),
            TextAction(
              text: "Already Have An Account? ",
              action: "Sign In!",
              onAction: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const SignInPage())),
            ),
          ],
        ));
  }
}
