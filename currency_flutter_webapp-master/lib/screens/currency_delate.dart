import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import '../core/constants/url_const.dart';
import '../store/my_currencies_store.dart';
import 'all_currency.dart';
import 'package:http/http.dart' as http;
import 'package:googleapis/drive/v3.dart' as drive;
import 'package:google_sign_in/google_sign_in.dart' as signIn;
import 'package:googleapis/drive/v3.dart' as drive;
import 'package:google_sign_in/google_sign_in.dart' as signIn;

class MyFavoriteCurrency extends StatefulWidget {
  @override
  State<MyFavoriteCurrency> createState() => _MyFavoriteCurrencyState();
}

class _MyFavoriteCurrencyState extends State<MyFavoriteCurrency> {
  final MyCurrenciesDataStore dataStore = MyCurrenciesDataStore();
  FetchAllCurrency _allCurrency = FetchAllCurrency();
  List<String> currencies = [];
  List? selectedCurrencies;

  Future<void> getCurrencyList() async {
    final allCurrencies = await FetchAllCurrency().getListAllCurrency();
    currencies = allCurrencies as List<String>;

    setState(() {});

    // Google Drive

//    final googleSignIn =
//         signIn.GoogleSignIn.standard(scopes: [drive.DriveApi.driveScope]);
//     final signIn.GoogleSignInAccount account = await googleSignIn.signIn();
//     print("User account $account");

//     final authHeaders = await account.authHeaders;
//     final authenticateClient = GoogleAuthClient(authHeaders);
//     final driveApi = drive.DriveApi(authenticateClient);

//     final Stream<List<int>> mediaStream = Future.value([104, 105]).asStream();
//     var media = new drive.Media(mediaStream, 2);
//     var driveFile = new drive.File();
//     driveFile.name = "Currency";
//     final result = await driveApi.files.create(driveFile, uploadMedia: media);
//     print("Upload result: $result");
//   }
//   Future<void> _incrementCounter() async {
//  setState(() {
// //  _counter++;
//  });

//  final googleSignIn = signIn.GoogleSignIn.standard(scopes: [drive.DriveApi.DriveScope]);
//  final signIn.GoogleSignInAccount account = await googleSignIn.signIn();
//  print("User account $account");
  }

  @override
  Widget build(BuildContext context) {
    // final favor = FetchServerce();
    return Scaffold(
      appBar: AppBar(
          title: const Text('My Favorite'), backgroundColor: Colors.amber),
      body: ValueListenableBuilder(
        valueListenable: MyCurrenciesDataStore.boxCurrency.listenable(),
        builder: (context, Box box, widget) {
          var list = box.values.toList();
          var listKey = box.keys.toList();
          return SafeArea(
            child: Column(children: [
              box.length > 0
                  ? ListView.builder(
                      shrinkWrap: true,
                      itemCount: list.length,
                      itemBuilder: (BuildContext context, index) {
                        final myFavCur = list[index];

                        return Card(
                            margin: EdgeInsets.all(10),
                            elevation: 3,
                            child: ListTile(
                                title: Text(
                                  ' ${list}'.toString(),
                                ),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                        icon: const Icon(
                                          Icons.delete,
                                        ),
                                        onPressed: () {
                                          dataStore.deleteCurrency(
                                              index: listKey[index]);
                                        }),
                                  ],
                                )));
                      })
                  : const Center(
                      child: Text('Kata Bar'),
                    ),
            ]),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue.shade900,
        onPressed: () async {
          final googleSignIn =
              signIn.GoogleSignIn.standard(scopes: [drive.DriveApi.driveScope]);
          final signIn.GoogleSignInAccount? account =
              await googleSignIn.signIn();
          print("curren $account");
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AlCurrency()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class GoogleAuthClient extends http.BaseClient {
  final Map<String, String> _headers;

  final http.Client _client = new http.Client();

  GoogleAuthClient(this._headers);

  Future<http.StreamedResponse> send(http.BaseRequest request) {
    return _client.send(request..headers.addAll(_headers));
  }
}
