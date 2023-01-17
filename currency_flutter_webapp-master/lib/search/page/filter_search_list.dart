

import 'package:flutter/material.dart';

import '../../core/constants/url_const.dart';
import '../../models/currency_model.dart';
   /// Filter Currenccy
class SearchCurrency extends SearchDelegate{
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [IconButton(
    icon: Icon(Icons.close),
    onPressed: () {
      query = " ";
    },
    ),
    ];
  }
  @override
  Widget? buildLeading(BuildContext context) {
      return IconButton(onPressed: () {
       Navigator.pop( context, );
              },
      icon: Icon(Icons.arrow_back_ios));
     
  }
   FetchAllCurrency _allCurrency = FetchAllCurrency();
 
     List<CurrencyModel> result = [];
  @override
  Widget buildResults(BuildContext context) {
    return  Container(
            child: FutureBuilder<List<CurrencyModel>>(
                future: _allCurrency.getListAllCurrency(querrr: query),
                builder: (context, snapshot) {
                  var data = snapshot.data;
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } 
                  return Container(child: ListView.builder(
                    itemCount: data?.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          title: Row(
                            children: [
                              Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                    color: Colors.purple,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(child: Text('${data?[index].code }',
                                 style: TextStyle(color: Colors.white),)),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                children: [
                                  Text('${data![index].code}'),
                                    Text('${data[index].cbPrice}'),
                                    Text('${data[index].date}'),
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  )
                  );
                 
                }
                ),
          );
  } 
  

  @override
  Widget buildSuggestions(BuildContext context) {
 
   return   Center(child: Text(
     'Search Currency Converter'),

    
     );
     
  } 

}
