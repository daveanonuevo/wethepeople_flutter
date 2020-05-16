import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wethepeople_flutter/providers/events.dart';
import 'package:wethepeople_flutter/ui/copayment_setup.dart';
import 'package:wethepeople_flutter/ui/create_event/create_event_main.dart';
import 'package:wethepeople_flutter/ui/main_events_page.dart';

class Details extends StatelessWidget {
  int _currentIndex = 0;

  void _onTabTapped(int index) {
    _currentIndex = index;
  }

  void _onCreatePress(context, type) {
    if (type == "RESTART")
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CreateEventMain()),
      );
    if (type == "CONFIRM")
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MainEventsPage()),
      );
    if (type == 'CO-PAY')
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CoPaymentSetup()),
      );
  }

  double activityCosts = 0;
  double foodCosts = 0;
  double transportationCosts = 0;
  double total = 0;

  @override
  Widget build(BuildContext context) {
    final event = Provider.of<Events>(context);

    if (total == 0) event.calculateActivity();
    activityCosts = event.activityCosts;
    foodCosts = event.foodCosts;
    transportationCosts = event.transportationCosts;
    total = event.total;

    print("Total costs: $total");

    return Scaffold(
      appBar: new AppBar(title: Text("RazerOuts")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28),
        child: ListView(
          children: [
            Padding(padding: EdgeInsets.only(bottom: 25)),
            Container(
                margin: const EdgeInsets.all(10.0),
                color: Colors.green[900],
                width: 550.0,
                height: 360.0,
                child: Column(
                  children: <Widget>[
                    Padding(padding: EdgeInsets.only(bottom: 25)),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 225, 0),
                      child: Text("When:",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          )),
                    ),
                    Text("${event.selectedDate.toString().split(' ')[0]}",
                        style: TextStyle(
                            fontSize: 24,
                            color: Colors.black,
                            fontWeight: FontWeight.w600)),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 220, 0),
                      child: Text("Activity:",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          )),
                    ),
                    Text("${event.selectedActivity}@${event.selectedLocation}",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.w600)),
                    Text(
                        "${event.currencyActivities}${activityCosts.toString()}",
                        style: TextStyle(
                            fontSize: 24,
                            color: Colors.black,
                            fontStyle: FontStyle.italic)),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 225, 0),
                      child: Text("Food:",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          )),
                    ),
                    Text("${event.selectedFoodName}",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.w600)),
                    Text("${event.currencyFood}${foodCosts.toString()}",
                        style: TextStyle(
                            fontSize: 24,
                            color: Colors.black,
                            fontStyle: FontStyle.italic)),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 160, 0),
                      child: Text("Transportation:",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          )),
                    ),
                    Text(
                        "${event.selectedTransport}@ ${event.selectedTransportTime}pricing",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.w600)),
                    Text(
                        "${event.currencyTransportation}${transportationCosts.toString()}",
                        style: TextStyle(
                            fontSize: 24,
                            color: Colors.black,
                            fontStyle: FontStyle.italic)),
                    Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                    Text("TOTAL: SGD${event.total.toStringAsFixed(2)}",
                        style: TextStyle(
                            fontSize: 24,
                            color: Colors.black,
                            fontWeight: FontWeight.w900)),
                    Text(
                        (event.conversionRate != 0)
                            ? "Conversion Rate 1MYR = ${event.conversionRate.toStringAsFixed(2)}SGD"
                            : "Transaction is fully in SGD",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w900)),
                  ],
                )),
            Padding(padding: EdgeInsets.only(bottom: 30)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  child: Align(
                    child: SizedBox(
                      width: 145,
                      height: 40,
                      child: RaisedButton(
                        color: Colors.green[700],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.green[700])),
                        child: Text("RESTART",
                            style:
                                TextStyle(fontSize: 18, color: Colors.white)),
                        onPressed: () {
                          _onCreatePress(context, "RESTART");
                        },
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  child: Align(
                    child: SizedBox(
                      width: 145,
                      height: 40,
                      child: RaisedButton(
                        color: Colors.green[700],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.green[700])),
                        child: Text("CO-PAY",
                            style:
                                TextStyle(fontSize: 18, color: Colors.white)),
                        onPressed: () {
                          _onCreatePress(context, "CO-PAY");
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(padding: EdgeInsets.only(bottom: 10)),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              child: Align(
                child: SizedBox(
                  width: 500,
                  height: 40,
                  child: RaisedButton(
                    color: Colors.black87,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.black38)),
                    child: Text("CONFIRM",
                        style: TextStyle(fontSize: 18, color: Colors.white)),
                    onPressed: () {
                      _onCreatePress(context, "CONFIRM");
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
