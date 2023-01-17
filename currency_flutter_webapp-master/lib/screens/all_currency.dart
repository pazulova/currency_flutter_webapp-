
import 'package:exhange_rates_flutter/constants/colors.dart';
import 'package:exhange_rates_flutter/logic/home_state.dart';
import 'package:exhange_rates_flutter/screens/currency_delate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../constants/text_constants.dart';
import '../constants/text_style.dart';

import '../core/constants/url_const.dart';
import '../logic/home_cubit.dart';
import '../models/currency_model.dart';
import 'package:googleapis/drive/v3.dart' as drive;
import 'package:google_sign_in/google_sign_in.dart' as signIn;
import '../search/page/filter_search_list.dart';
import '../store/my_currencies_store.dart';


class AlCurrency extends StatefulWidget {
  @override
  State<AlCurrency> createState() => _AlCurrencyState();
}

class _AlCurrencyState extends State<AlCurrency> {
 
  // final controller = TextEditingController();
  // FetchServerce allCurrency = FetchServerce();
  List? currencies;
  MyCurrenciesDataStore dataStore = MyCurrenciesDataStore();

  Future<void> getMyCurrencyList() async {
    final allCurrencies = await FetchAllCurrency().getListAllCurrency();
    currencies = allCurrencies;
    setState(() {
       getMyCurrencyList();
    });
  
 final googleSignIn =
        signIn.GoogleSignIn.standard(scopes: [drive.DriveApi.driveScope]);
    final signIn.GoogleSignInAccount? account = await googleSignIn.signIn();
    print("User account $account");

    final authHeaders = await account!.authHeaders;
    final authenticateClient = GoogleAuthClient(authHeaders);
    final driveApi = drive.DriveApi(authenticateClient);

    final Stream<List<int>> mediaStream = Future.value([104, 105]).asStream();
    var media = new drive.Media(mediaStream, 2);
    var driveFile = new drive.File();
    driveFile.name = "Currency";
    final result = await driveApi.files.create(driveFile, uploadMedia: media);
    print("Upload result: $result");
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.amber,
            appBar: AppBar(
              title: const Text(
                AppText.allCurencies,
                style: AppTextStyles.titleStyle,
              ),
              backgroundColor: AppColors.mainColor,
            ),
            body: BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeStateLoading) {
          return Center(child: CircularProgressIndicator.adaptive()
          
          );
        } else if(state is HomeStateError) {
          return Center(child: Text(state.error),);
        } else if (state is HomeStateLoaded) {
         return 
           ValueListenableBuilder(
                    valueListenable:
                       MyCurrenciesDataStore .boxCurrency.listenable(),
                    builder: ((context, Box box, widget) {
                      return ListView.builder(
                          shrinkWrap: true,
                          itemCount: state.data.length,
                          itemBuilder: (BuildContext context, int index) {
                           
                            var isFavorite = box.get(index) != null;

                            return Card(
                              margin: const EdgeInsets.all(10),
                              elevation: 3,
                              child: ListTile(
                                autofocus: false,
                                title: Text(state.data[index].code.toString()),
                                subtitle: Text(state.data[index].cbPrice.toString()),
                                trailing: IconButton(
                                  onPressed: () async{
                                  getMyCurrencyList();
                                  CurrencyModel myCrMod =
                                       CurrencyModel(code: state.data[index].code);
                                    ScaffoldMessenger.of(context)
                                        .clearSnackBars();

                                    if (isFavorite) {
                                      dataStore.deleteCurrency(index: index);
                                      const snackBar = SnackBar(
                                        content: Text(AppText.reSuccess),
                                        backgroundColor: AppColors.mainColor,
                                      );

                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(snackBar);
                                    } else {
                                      dataStore.addCurrency(
                                          myCurrenciesBox: myCrMod,
                                          index: index);
                                      const snackBar = SnackBar(
                                        content: Text(AppText.addSuccess),
                                        backgroundColor: AppColors.mainColor,
                                      );

                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(snackBar);
                                    }
                                  },
                       icon: Icon(
            isFavorite ?
            Icons.favorite 
            : Icons.favorite_border,
             color: Colors.red,),
          ),
          )
        
        );
        },
      );
                    }         
            )
    );
        } else {
          return SizedBox();
        }   
        }
    ),

      floatingActionButton: FloatingActionButton(
        onPressed:  () async{
        // var file = await FilePicker.getFile();
        //           await drive.upload(file);
          getMyCurrencyList();
          final   route = MaterialPageRoute(builder: (context) =>  MyFavoriteCurrency (),
          );
          Navigator.push(context, route);
        },
      
        child: const Icon(Icons.add),
      ) 
    
  );}
            
          
    }
      
