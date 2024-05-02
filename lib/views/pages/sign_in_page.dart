// ignore_for_file: use_build_context_synchronously

import 'package:carry_or_drag/constants/base_page.dart';
import 'package:carry_or_drag/services/auth_services.dart';
import 'package:carry_or_drag/views/pages/home_page.dart';
import 'package:carry_or_drag/views/pages/settings_page.dart';
import 'package:carry_or_drag/views/pages/sign_up_page.dart';
import 'package:carry_or_drag/views/widgets/custom_button.dart';
import 'package:carry_or_drag/views/widgets/form_widget.dart';
import 'package:carry_or_drag/views/widgets/text_action.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();

    TextEditingController passwordController = TextEditingController();
    return BasePage(
      title: "Welcome",
      actionWidgets: [
        IconButton(
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const SettingsPage()));
          },
          icon: const Icon(
            Icons.settings,
          ),
        )
      ],
      bodyWidget: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("welcome to the app"),
            const Text("Sign in to the app with"),
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
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 4.0),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "Forgot Password?",
                  style: TextStyle(
                      color: Colors.green, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            CustomButton(
              text: "Sign In",
              onPressed: () async {
                await AuthService()
                    .signIn(context, emailController, passwordController);
              },
            ),
            TextAction(
              text: "Don't Have An Account? ",
              action: "Sign Up!",
              onAction: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const SignUpPage())),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () async {
                    bool loginDone = await AuthService().signInWithGoogle();
                    if (loginDone) {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomePage()));
                    }
                  },
                  child: Container(
                    height: 100,
                    width: 100,
                    color: Colors.grey,
                    child: const Center(
                      child: Text(
                        "G",
                        style: TextStyle(
                            fontSize: 40, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                // const SizedBox(width: 30),
                // InkWell(
                //   onTap: () {
                //     AuthService().signInWithFacebook();
                //     // Navigator.of(context).pushReplacement(MaterialPageRoute(
                //     //     builder: (context) => const HomePage()));
                //   },
                //   child: Container(
                //     height: 100,
                //     width: 100,
                //     color: Colors.grey,
                //     child: const Center(
                //       child: Text(
                //         "F",
                //         style: TextStyle(
                //             fontSize: 40, fontWeight: FontWeight.bold),
                //       ),
                //     ),
                //   ),
                // ),
                // const SizedBox(width: 30),
                // InkWell(
                //   onTap: () {
                //     AuthService().signInWithApple();
                //     // Navigator.of(context).pushReplacement(MaterialPageRoute(
                //     //     builder: (context) => const HomePage()));
                //   },
                //   child: Container(
                //     height: 100,
                //     width: 100,
                //     color: Colors.grey,
                //     child: const Center(
                //       child: Text(
                //         "A",
                //         style: TextStyle(
                //             fontSize: 40, fontWeight: FontWeight.bold),
                //       ),
                //     ),
                //   ),
                // )
              ],
            )
          ],
        ),
      ),
    );
  }
}
