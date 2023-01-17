

import 'package:exhange_rates_flutter/models/currency_model.dart';

abstract class HomeState {
  HomeState();
}

class HomeStateInitial extends HomeState {
  HomeStateInitial();
}

class HomeStateLoading extends HomeState {

  HomeStateLoading();
}


class HomeStateLoaded extends HomeState {
  List<CurrencyModel> data;
  HomeStateLoaded(this.data);
}


class HomeStateError extends HomeState {
  String error ;
  HomeStateError(this.error);
}
class HomeStateChoose extends HomeState {
   List<CurrencyModel> currenFavor;
  HomeStateChoose (this.currenFavor);
}
