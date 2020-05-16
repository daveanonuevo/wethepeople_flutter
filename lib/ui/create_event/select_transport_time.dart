import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wethepeople_flutter/providers/events.dart';
import 'package:wethepeople_flutter/ui/details.dart';

class SelectTransportTime extends StatelessWidget {
  int _currentIndex = 0;

  void _onTabTapped(int index) {
    _currentIndex = index;
    print(_currentIndex);
  }

  void _onPress(context, event, String type, time) {
    event.selectTransport(type, time);

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Details()),
    );
  }

  String type;

  SelectTransportTime({Key key, @required this.type}) : super(key: key);

  List<String> transportTimes = List<String>();

  @override
  Widget build(BuildContext context) {
    final event = Provider.of<Events>(context);
    event.setTransportTimes(type);
    transportTimes = event.transportTimes;

    print(transportTimes);
    return Scaffold(
      appBar: new AppBar(title: Text("RazerOuts")),
      body: ListView.builder(
          itemCount: transportTimes.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: Column(
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(bottom: 25)),
                  GestureDetector(
                    onTap: () {
                      _onPress(context, event, type, transportTimes[index]);
                    },
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                        height: 120,
                        child: new Center(
                          child: new Text(
                            "${transportTimes[index]}",
                            style: TextStyle(color: Colors.white, fontSize: 22),
                            textAlign: TextAlign.center,
                          ),
                        )),
                  ),
                ],
              ),
            );
          }),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        // this will be set when a new tab is tapped
        backgroundColor: Colors.black87,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.green,
        onTap: _onTabTapped,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            title: new Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.add),
            title: new Text('Add Events'),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today), title: Text('Analytics')),
        ],
      ),
    );
  }
}
