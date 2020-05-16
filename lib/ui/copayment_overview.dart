import 'package:http/http.dart' as http;

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wethepeople_flutter/classes/VisaResponse.dart';
import 'package:wethepeople_flutter/providers/events.dart';
import 'package:wethepeople_flutter/ui/main_events_page.dart';

class CoPaymentOverview extends StatelessWidget {
  List<String> currencies;
  List<TextEditingController> numbers;
  List<String> mapCurrency = List<String>();

  double totalEachInSgd;
  double eachInMYR;

  CoPaymentOverview(
      {Key key, @required this.currencies, @required this.numbers})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final event = Provider.of<Events>(context);

    totalEachInSgd = (event.total) / (numbers.length + 1);

    if (event.eachInMYR == 0.0)
      event.sendRequestMYR(totalEachInSgd.toStringAsFixed(2));
    print(event.eachInMYR);
    for (int x = 0; x < currencies.length; x++) {
      mapCurrency.add((currencies[x] == '+65') ? 'SGD' : 'MYR');
    }
    eachInMYR = event.eachInMYR;

    return Scaffold(
        appBar: new AppBar(title: Text("RazerOuts")),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 50),
          child: ListView(
            children: <Widget>[
              ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: currencies.length,
                  itemBuilder: (BuildContext context, int index) {
                    return IntrinsicHeight(
                      child: Column(
                        children: <Widget>[
                          Text(
                            "${currencies[index]} ${numbers[index].value.text} needs to pay ${mapCurrency[index]}${(mapCurrency[index] == 'SGD' ? totalEachInSgd.toStringAsFixed(2) : event.eachInMYR.toStringAsFixed(2))}",
                            style: TextStyle(fontSize: 18),
                          ),
                          Padding(padding: EdgeInsets.only(bottom: 50))
                        ],
                      ),
                    );
                  }),
              Text(
                "You need to pay SGD ${totalEachInSgd.toStringAsFixed(2)}",
                style: TextStyle(fontSize: 18),
              ),
              Padding(padding: EdgeInsets.only(bottom: 100)),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 30),
                child: Align(
                  child: SizedBox(
                    width: 500,
                    height: 40,
                    child: RaisedButton(
                      color: Colors.blueAccent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.blueAccent)),
                      child: Text("CONFIRM",
                          style: TextStyle(fontSize: 18, color: Colors.white)),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MainEventsPage()),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
