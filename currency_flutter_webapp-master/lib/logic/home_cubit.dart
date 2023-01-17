
import 'package:flutter_bloc/flutter_bloc.dart';

import '../core/constants/url_const.dart';
import '../models/currency_model.dart';
import 'home_state.dart';
class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeStateInitial()) {
    getDataCurrency() ;
  }

void getDataCurrency() async {
  emit (HomeStateLoading());
   await FetchAllCurrency().getListAllCurrency().then((value) {
       if (value is List<CurrencyModel>) {
       emit(HomeStateLoaded(value));
      } else {
        emit ( HomeStateError(value.toString()));
     }
   });
}








  // Future getData() async {
  //   emit(HomeStateLoaing());
  //   try {
  //     Response res = await Dio().get(FetchServerce().fetchcurrencies().toString());
  //     List<CurrencyModel> currencyModel =
  //         (res.data as List).map((e) => CurrencyModel.fromJson(e)).toList();
  //     emit(HomeStateLoaded(currencyModel));
  //   } catch (e) {
  //     emit(HomeStateError(e.toString()));
  //   }
  // }
}

