import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wethepeople_flutter/providers/events.dart';
import 'package:wethepeople_flutter/ui/create_event/create_event_transport.dart';

class CreateEventMain extends StatefulWidget {
  @override
  _CreateEventMainState createState() => _CreateEventMainState();
}

class _CreateEventMainState extends State<CreateEventMain> {
  int _currentIndex = 0;

  void _onTabTapped(int index) {
    _currentIndex = index;
    print(_currentIndex);
  }

  void _onCreatePress(context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CreateEventTransport()),
    );
  }

  String _foodDropdownValue = 'Loading';
  String _activityDropdownValue = 'Loading';
  String _locationDropdownValue = 'Loading';

  bool init = true;

  List<String> foodNames = List<String>();
  List<String> activityNames = List<String>();
  List<String> locationNames = List<String>();

  @override
  Widget build(BuildContext context) {
    final event = Provider.of<Events>(context);

    foodNames = event.foodNames;
    _foodDropdownValue = event.selectedFoodName;

    activityNames = event.activityNames;
    _activityDropdownValue = event.selectedActivity;

    locationNames = event.locationNames;
    _locationDropdownValue = event.selectedLocation;

    print(foodNames);
    print(activityNames);
    print(locationNames);

    return Scaffold(
      appBar: new AppBar(title: Text("RazerOuts")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28),
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
                Consumer<Events>(
                  builder: (context, event, child) => DropdownButton<String>(
                      value: _activityDropdownValue,
                      onChanged: (String newValue) {
                        setState(() {
                          event.setActivityName(newValue);
                          _activityDropdownValue = newValue;
                        });
                      },
                      items: activityNames
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList()),
                ),
                Padding(padding: EdgeInsets.only(bottom: 25)),
                Text(
                  "Location",
                  style: TextStyle(
                    fontSize: 28,
                  ),
                ),
                Consumer<Events>(
                  builder: (context, event, child) => DropdownButton<String>(
                      value: _locationDropdownValue,
                      onChanged: (String newValue) {
                        setState(() {
                          event.setLocationName(newValue);
                          _locationDropdownValue = newValue;
                        });
                      },
                      items: locationNames
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList()),
                ),
                Padding(padding: EdgeInsets.only(bottom: 25)),
                Text(
                  "Food",
                  style: TextStyle(
                    fontSize: 28,
                  ),
                ),
                Consumer<Events>(
                  builder: (context, event, child) => DropdownButton<String>(
                      value: _foodDropdownValue,
                      onChanged: (String newValue) {
                        setState(() {
                          event.setFoodName(newValue);
                          _foodDropdownValue = newValue;
                        });
                      },
                      items: foodNames
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList()),
                ),
                Padding(padding: EdgeInsets.only(bottom: 25)),
                Text(
                  "Date",
                  style: TextStyle(
                    fontSize: 28,
                  ),
                ),
                Text("${event.selectedDate}".split(' ')[0],
                style: TextStyle(
                  fontSize: 24
                )),
                SizedBox(
                  height: 20.0,
                ),
                RaisedButton(
                  onPressed: () => event.selectDate(context),
                  child: Text('Select date'),
                ),
                Padding(padding: EdgeInsets.only(bottom: 25)),
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
                        child: Text("NEXT",
                            style:
                                TextStyle(fontSize: 18, color: Colors.white)),
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
    );
  }
}
