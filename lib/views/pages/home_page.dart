import 'package:carry_or_drag/constants/base_page.dart';
import 'package:carry_or_drag/views/pages/item_detail.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  signOutUser() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
        actionWidgets: [
          IconButton(
              onPressed: () => signOutUser(), icon: const Icon(Icons.logout))
        ],
        bodyWidget: Center(
          child: Column(
            children: [
              const Text("user signed in"),
              const SizedBox(height: 20),
              InkWell(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ItemDetail())),
                child: Container(
                  height: 100,
                  width: 100,
                  color: Colors.amber,
                  child: const Icon(
                    Icons.shopping_bag_outlined,
                    color: Colors.white,
                    size: 60,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
