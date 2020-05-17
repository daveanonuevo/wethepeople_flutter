import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wethepeople_flutter/providers/user.dart';
import 'package:wethepeople_flutter/ui/analytics.dart';

import 'create_event/create_event_main.dart';

class MainEventsPage extends StatelessWidget {
  void _onCreatePress(context, type) {
    if (type == "CREATE"){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CreateEventMain()),
      );
    }    if (type == "ANALYTICS"){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Analytics()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return Scaffold(
      appBar: new AppBar(title: Text("RazerOuts")),
      body: Column(children: <Widget>[
        Padding(padding: EdgeInsets.only(bottom: 50)),
        Text("BALANCE: ${user.balance}",
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
                  _onCreatePress(context, "CREATE");
                },
              ),
            ),
          ),
        ),        Padding(padding: EdgeInsets.only(bottom: 25)),
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
                    side: BorderSide(color: Colors.blueAccent)
                ),
                child: Text("ANALYTICS",
                    style: TextStyle(fontSize: 18, color: Colors.white)),
                onPressed: () {
                  _onCreatePress(context, "ANALYTICS");
                },
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
