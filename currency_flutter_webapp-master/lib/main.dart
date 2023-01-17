import 'package:exhange_rates_flutter/routes/currency_routes.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'logic/home_cubit.dart';
import 'models/currency_model.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'firebase_options.dart';

// https://console.cloud.google.com/iam-admin/privacy?project=weighty-treat-343318&supportedpurview=project
// how to useGoogle Drive App to upload delete and create a public URL for a file.


// Link G[gle Driver
//https://console.cloud.google.com/apis/library?project=diary-app-339509
//https://console.cloud.google.com/apis/credentials/consent/edit;newAppInternalUser=false?project=flutter-gdriver-373610&supportedpurview=project

  void main()  async {

   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  //  options: DefaultFirebaseOptions.currentPlatform,
    
  );
  
   
  await Hive.initFlutter();
 
    Hive.registerAdapter<CurrencyModel>(CurrencyModelAdapter ());
  await Hive.openBox<CurrencyModel>("myCurrenciesBox");
  // await Hive.openBox<CurrencyModel>('favorite');
  
  runApp(MultiBlocProvider(providers: [BlocProvider(
    create: (context) => HomeCubit(),
    
  )], child: const MyApp(),));
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return 
      MaterialApp(
        title: 'Currency App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: CurrencyRoutes.instance.onGenerateRoute,
        initialRoute: "/home",
      
    );
  }
}