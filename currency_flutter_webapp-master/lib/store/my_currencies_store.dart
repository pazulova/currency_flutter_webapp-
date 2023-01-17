
import 'package:hive_flutter/adapters.dart';

import '../models/currency_model.dart';
  
class MyCurrenciesDataStore  {
  static const myCurrenciesBox = "myCurrenciesBox";
  static Box<CurrencyModel> boxCurrency =
      Hive.box<CurrencyModel>(myCurrenciesBox);

  Future<void> addCurrency(
      {required CurrencyModel myCurrenciesBox, required int index}) async {
    await boxCurrency.put(index, myCurrenciesBox);
  }

  Future<void> deleteCurrency({required int index}) async {
    await boxCurrency.delete(index);
  }
}
 