import 'package:exhange_rates_flutter/screens/history_page.dart';
import 'package:flutter/material.dart';


class HomePageAppbar extends StatelessWidget implements PreferredSizeWidget {
  const HomePageAppbar({
    Key? key,
  }) : super(key: key);
  Size get preferredSize => const Size.fromHeight(100);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: const Text('Currency'),
        backgroundColor: Colors.purple,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  HistoryPage()),
                );
              },
              icon: const Icon(
                Icons.history,
                size: 30,
              ))
        ]);
  }
}
