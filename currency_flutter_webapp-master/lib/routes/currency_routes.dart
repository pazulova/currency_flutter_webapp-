import 'package:exhange_rates_flutter/screens/home_currency.dart';
import 'package:flutter/material.dart';

class CurrencyRoutes {
  static final CurrencyRoutes _instance = CurrencyRoutes._init();
  static CurrencyRoutes get instance => _instance;
  CurrencyRoutes._init();
  Route? onGenerateRoute(RouteSettings s) {
    var args = s.arguments;

    switch (s.name) {
      case "/home":
        return MaterialPageRoute(builder: (ctx) => const Home());
    }
  }
}
