import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wethepeople_flutter/providers/events.dart';

class CreateEventMain extends StatelessWidget {
  int _currentIndex = 0;

  void _onTabTapped(int index) {
    _currentIndex = index;
    print(_currentIndex);
  }
  void _onCreatePress(context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CreateEventMain()),
    );
  }
  final _formKey = GlobalKey<FormState>();

  String dropdownValue = 'One';

  @override
  Widget build(BuildContext context) {
    final event = Provider.of<Events>(context);
    return Scaffold(
      appBar: new AppBar(title: Text("RazerOuts")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(bottom: 25)),
                  Text(
                    "Activity",
                    style: TextStyle(
                      fontSize: 28,
                    ),
                  ),
                  DropdownButton<String>(
                    hint: Text("Select an activity"),
                    items: event.getFoodNames().map((String value) {
                      return new DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (value) {},
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 50)),
                  Text(
                    "Location",
                    style: TextStyle(
                      fontSize: 28,
                    ),
                  ),
                  TextFormField(
                    autofocus: true,
                    cursorColor: Colors.green,
                    decoration: InputDecoration(
                      hintText: "Select a Location",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(
                          color: Colors.amber,
                          style: BorderStyle.solid,
                        ),
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 50)),
                  Text(
                    "Food",
                    style: TextStyle(
                      fontSize: 28,
                    ),
                  ),
                  TextFormField(
                    autofocus: true,
                    cursorColor: Colors.green,
                    decoration: InputDecoration(
                      hintText: "Select a place to eat",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(
                          color: Colors.amber,
                          style: BorderStyle.solid,
                        ),
                      ),
                    ),
                  ),
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
                              side: BorderSide(color: Colors.green[900])),
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
          ),
        ),
      ),
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
