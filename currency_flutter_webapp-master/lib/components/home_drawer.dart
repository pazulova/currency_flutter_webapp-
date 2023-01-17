import 'package:flutter/material.dart';

import '../screens/all_currency.dart';
import '../screens/currency_delate.dart';


class HomeDraw extends StatelessWidget {
  const HomeDraw({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.only(top:  100),
        children: [
          ListTile(
            title: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>  AlCurrency()),
                  );
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 36),
                  child: Text('All Currencies'),
                )),
          ),
          ListTile(
            title: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 36),
              child: Text('Favorite Currencies'),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MyFavoriteCurrency ()),
              );
            },
          ),
        ],
      ),
    );
  }
}
