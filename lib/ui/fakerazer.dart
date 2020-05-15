import 'package:flutter/material.dart';
import 'main_events_page.dart';

class FakeRazer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MainEventsPage()),
          );
        },
        child: new Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              alignment: Alignment.topCenter,
              image: AssetImage('assets/razer_screenshot.png'),
              fit: BoxFit.cover,
            ),
          ),
        ));
  }
}
