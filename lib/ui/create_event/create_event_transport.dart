import 'package:flutter/material.dart';
import 'package:wethepeople_flutter/ui/create_event/select_transport_time.dart';

class CreateEventTransport extends StatelessWidget {
  int _currentIndex = 0;

  void _onTabTapped(int index) {
    _currentIndex = index;
    print(_currentIndex);
  }

  void _onPress(context, String type) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SelectTransportTime(type: type)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(title: Text("RazerOuts")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(padding: EdgeInsets.only(bottom: 25)),
              Text(
                "Select mode of transport",
                style: TextStyle(
                  fontSize: 28,
                ),
              ),
              Padding(padding: EdgeInsets.only(bottom: 25)),
              GestureDetector(
                onTap: () {
                  _onPress(context, "Taxi");
                },
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    height: 120,
                    child: new Center(
                      child: new Text(
                        "Taxi",
                        style: TextStyle(color: Colors.white, fontSize: 22),
                        textAlign: TextAlign.center,
                      ),
                    )),
              ),
              Padding(padding: EdgeInsets.only(bottom: 25)),
              GestureDetector(
                onTap: () {
                  _onPress(context, "Train");
                },
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    height: 120,
                    child: new Center(
                      child: new Text(
                        "Train",
                        style: TextStyle(color: Colors.white, fontSize: 22),
                        textAlign: TextAlign.center,
                      ),
                    )),
              ),
              Padding(padding: EdgeInsets.only(bottom: 25)),
              GestureDetector(

                onTap: () {
                  _onPress(context, "Bus");
                },
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    height: 120,
                    child: new Center(
                      child: new Text(
                        "Bus",
                        style: TextStyle(color: Colors.white, fontSize: 22),
                        textAlign: TextAlign.center,
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
