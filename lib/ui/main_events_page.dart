import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wethepeople_flutter/providers/user.dart';

import 'create_event/create_event_main.dart';

class MainEventsPage extends StatelessWidget {
  int _currentIndex = 0;

  void _onTabTapped(int index) {
    _currentIndex = index;
  }

  void _onCreatePress(context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CreateEventMain()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return Scaffold(
      appBar: new AppBar(title: Text("RazerOuts")),
      body: Column(children: <Widget>[
        Padding(padding: EdgeInsets.only(bottom: 50)),
        Text("BALANCE: ${user.getBalance()}",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 34,
            )),
        Container(
          margin: const EdgeInsets.all(10.0),
          color: Colors.green,
          width: 500.0,
          height: 250.0,
        ),
        Divider(thickness: 5, indent: 30, endIndent: 30, color: Colors.black87),
        Text("PLAN NOW, PAY LATER",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w900,
              color: Colors.green[900],
            )),
        Padding(padding: EdgeInsets.only(bottom: 50)),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 30),
          child: Align(
            child: SizedBox(
              width: 500,
              height: 40,
              child: RaisedButton(
                color: Colors.green[900],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.green[900])
                ),
                child: Text("CREATE",
                    style: TextStyle(fontSize: 18, color: Colors.white)),
                onPressed: () {
                  _onCreatePress(context);
                },
              ),
            ),
          ),
        ),
      ]),
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
