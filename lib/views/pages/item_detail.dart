import 'package:carry_or_drag/common/debouncer.dart';
import 'package:carry_or_drag/constants/base_page.dart';
import 'package:carry_or_drag/provider/modify_item_no.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ItemDetail extends StatelessWidget {
  const ItemDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final countProvider = Provider.of<CountChanger>(context, listen: false);
    final debouncer = Debouncer(milliseconds: 500);

    snackBar(int value) => SnackBar(
          content: Text('Yay! A Counter SnackBar! $value'),
          duration: const Duration(milliseconds: 1000),
        );

    return BasePage(
        title: "Item Shopping Bag",
        bodyWidget: Column(
          children: [
            Container(
              height: 400,
              width: MediaQuery.of(context).size.width,
              color: Colors.grey,
            ),
            const Text(
              "Item Name",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                TextButton(
                    onPressed: () {
                      countProvider.decrementCount();
                    },
                    child: const Icon(Icons.minimize_outlined)),
                Container(
                    width: 60,
                    height: 40,
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(border: Border.all()),
                    child: Consumer<CountChanger>(
                      builder: (context, count, child) {
                        if (count.itemCount != 0) {
                          debouncer.run(() {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar(count.itemCount));
                          });
                        }
                        return Text(
                          count.itemCount.toString(),
                          textAlign: TextAlign.center,
                        );
                      },
                    )),
                TextButton(
                    onPressed: () {
                      countProvider.incrementCount();
                    },
                    child: const Icon(Icons.add)),
              ],
            ),
          ],
        ));
  }
}
