import 'package:carry_or_drag/constants/base_page.dart';
import 'package:flutter/material.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BasePage(
        bodyWidget: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextButton(onPressed: () {}, child: const Text("Pay with Esewa")),
          TextButton(onPressed: () {}, child: const Text("Pay with Khalti")),
          TextButton(onPressed: () {}, child: const Text("Pay with FonePay")),
          TextButton(onPressed: () {}, child: const Text("Pay with Stripe")),
          TextButton(onPressed: () {}, child: const Text("Pay with FonePay")),
          TextButton(
              onPressed: () {}, child: const Text("Pay with Debit/Credit card")),
        ],
      ),
    ));
  }
}
