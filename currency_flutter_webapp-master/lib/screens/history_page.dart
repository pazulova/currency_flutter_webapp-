import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../core/constants/url_const.dart';
import '../models/currency_model.dart';
import '../search/page/filter_search_list.dart';

class HistoryPage extends StatefulWidget {

  // const HistoryPage(Key? key,) : super(key: key);
  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  FetchAllCurrency _allCurrency = FetchAllCurrency();
final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
             backgroundColor: Colors.purple,
              title:  TextField(
                  controller: controller,
                decoration: InputDecoration(
          // suffixIcon: 
          icon:  IconButton(icon: Icon(Icons.search), 
          
          onPressed: () { 
          showSearch(context: context, delegate: SearchCurrency());
         },    
         )    
           ),
          )
              
               ),
          body: Container(
            child: FutureBuilder<List<CurrencyModel>>(
                future: _allCurrency.getListAllCurrency(),
                builder: (context, snapshot) {
                  var data = snapshot.data;
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return Container(
                    child: ListView.builder(
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
                                child: Center(
                                  child: Text('${data?[index].code }',
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
                  ));
                }),
          )),
    );
  }
}

 