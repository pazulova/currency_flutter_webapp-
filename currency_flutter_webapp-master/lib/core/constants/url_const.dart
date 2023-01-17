

import 'dart:convert';
import 'dart:io';
// import 'dart:html';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import '../../models/currency_model.dart';

class UrlConst {

    String urlApi = "https://nbu.uz/uz/exchange-rates/json/";
   String imageUrl = "https://countryflagsapi.com/png/";
 

}
   
class FetchAllCurrency{
 var data = [];
 
 List<CurrencyModel> result = [];

    Future<List<CurrencyModel>> getListAllCurrency ({String? querrr}) async {
    var  url = Uri.parse(UrlConst().urlApi);
    var response = await http.get(url);
   try {
  if( response.statusCode == 200 ){
     data = json.decode(response.body);
  
    result = data.map((e) => CurrencyModel.fromJson(e)).toList();
    if (querrr != null) {
       result = result.where((element) =>
      element.code!.toLowerCase().contains(querrr.toLowerCase())).toList();
    
    } 
    
   }else {
     print ('api erorrrrrrrrrr');
   } 
} on Exception catch (e) {
print('error: $e');
}
return result;
 
  } 
}
  




class Fetchss {
static Future  getListAllCurrenc() async{
try {
  Response res =  await Dio().get(UrlConst().urlApi);
  if (res.statusCode == HttpStatus.ok)  {
    var resData = (res.data as List).map((e) => CurrencyModel.fromJson(e)).toList();
    return resData;
  }
} catch (e){
  return 'No Internet';

}
}
}