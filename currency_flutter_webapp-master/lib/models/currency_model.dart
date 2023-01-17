

import 'package:hive_flutter/adapters.dart';
part 'currency_model.g.dart';
@HiveType(typeId: 0)
class CurrencyModel {

    CurrencyModel({
        this.title,
        this.code,
        this.cbPrice,
        this.nbuBuyPrice,
        this.nbuCellPrice,
        this.date,
        this.imageUrl,
    });
    @HiveField(0)
    String? title;
     @HiveField(1)
    String? code;
     @HiveField(2)
    String? cbPrice;
     @HiveField(3)
    String? nbuBuyPrice;
     @HiveField(4)
    String? nbuCellPrice;
     @HiveField(5)
    String? date;
     @HiveField(6)
    String? imageUrl;

    factory CurrencyModel.fromJson(Map<String, dynamic> json) => CurrencyModel(
        title: json["title"],
        code: json["code"],
        cbPrice: json["cb_price"],
        nbuBuyPrice: json["nbu_buy_price"],
        nbuCellPrice: json["nbu_cell_price"],
        date: json["date"],
        imageUrl: json["imageUrl"]
    );
}
