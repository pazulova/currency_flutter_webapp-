import 'package:exhange_rates_flutter/functions/fetchrates.dart';
import 'package:flutter/material.dart';

class AnyToAny extends StatefulWidget {
  final rates;
  final Map currencies;
  const AnyToAny({Key? key, @required this.rates, required this.currencies})
      : super(key: key);

  @override
  _AnyToAnyState createState() => _AnyToAnyState();
}

class _AnyToAnyState extends State<AnyToAny> {
  TextEditingController amountController = TextEditingController();

  String dropdownValue1 = 'AUD';
  String dropdownValue2 = 'AUD';
  String result = ' shown here  result !!!';

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
      var h = MediaQuery.of(context).size.height;
    return  Card(
      child: Container(
        width: w / 0.5,
        height: h / 0.3,
        padding: EdgeInsets.only(top: 50,  ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Convert Any Currency',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            SizedBox(height: 20),
             
        
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                key: ValueKey('amount'),
                controller: amountController,
                decoration: InputDecoration(hintText: 'Enter Amount'),
                keyboardType: TextInputType.number,
              ),
            ),
            SizedBox(height: 10),
             
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  Expanded(
                    child: DropdownButton<String>(
                      value: dropdownValue1,
                      icon: const Icon(Icons.arrow_drop_down_rounded),
                      iconSize: 24,
                      elevation: 16,
                      isExpanded: true,
                      underline: Container(
                        height: 2,
                        color: Colors.grey.shade400,
                      ),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownValue1 = newValue!;
                        });
                      },
                      items: widget.currencies.keys
                          .toSet()
                          .toList()
                          .map<DropdownMenuItem<String>>((value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
               
                  Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Text('To')),
                  Expanded(
                    child: DropdownButton<String>(
                      value: dropdownValue2,
                      icon: const Icon(Icons.arrow_drop_down_rounded),
                      iconSize: 24,
                      elevation: 16,
                      isExpanded: true,
                      underline: Container(
                        height: 2,
                        color: Colors.grey.shade400,
                      ),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownValue2 = newValue!;
                        });
                      },
                      items: widget.currencies.keys
                          .toSet()
                          .toList()
                          .map<DropdownMenuItem<String>>((value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
        
            SizedBox(height: 10),
            Container(
              child: ElevatedButton(
                
                onPressed: () {
                  
                  setState(() {
                    result = amountController.text +
                        ' ' +
                        dropdownValue1 +
                        ' ' +
                       FetchServerce ().convertany(widget.rates, amountController.text,
                            dropdownValue1, dropdownValue2) +
                        ' ' +
                        dropdownValue2;
                  });
                },
             child: Center(
            child: Text('Convert',
             style: TextStyle(
               color: Colors.white, fontSize: 25),)),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                 Theme.of(context).primaryColor)),
              ),
              
            ),
            SizedBox(
              width: 30,
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(child: Text(result, 
              style: TextStyle(color: Colors.purple, fontSize: 17),)),),
            
          ],
        ),
      ),
    );
  }
}
  