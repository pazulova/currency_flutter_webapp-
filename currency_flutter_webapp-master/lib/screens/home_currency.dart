import 'package:exhange_rates_flutter/components/anyToAny.dart';
import 'package:exhange_rates_flutter/functions/fetchrates.dart';
import 'package:exhange_rates_flutter/models/ratesmodel.dart';
import 'package:exhange_rates_flutter/screens/history_page_app_bar.dart';
import 'package:flutter/material.dart';

import '../components/home_drawer.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //Initial Variables

  late Future<RatesModel> result;
  late Future<Map> allcurrencies;
  final formkey = GlobalKey<FormState>();

  
  @override
  void initState() {
    super.initState();
    setState(() {
      result = FetchServerce().fetchrates();
      allcurrencies = FetchServerce().fetchcurrencies();
    });
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
          appBar: const HomePageAppbar(),
           drawer: const HomeDraw(),
        body: Container(
          height: h,
          width: w,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/currency.jpeg'),
                  fit: BoxFit.cover)),
          child: SingleChildScrollView(
            child: Form(
              key: formkey,
              child: FutureBuilder<RatesModel>(
                future: result,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  return Center(
                    child: FutureBuilder<Map>(
                        future: allcurrencies,
                        builder: (context, currSnapshot) {
                          if (currSnapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(child: CircularProgressIndicator());
                           }
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AnyToAny(
                                currencies: currSnapshot.data!,
                                rates: snapshot.data!.rates,
                              ),
                            ],
                          );
                        }
                        ),
                  );
                },
              ),
            ),
          ),
        ));
  }
}
  