import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:wethepeople_flutter/providers/events.dart';
import 'package:wethepeople_flutter/providers/user.dart';
import 'providers/visaAPI.dart';
import 'ui/fakerazer.dart';

void main() {
  runApp(MyApp());
SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.green
));}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => User()),
        ChangeNotifierProvider(create: (context) => Events()),
        ChangeNotifierProvider(create: (context) => VisaAPI()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  String title;

  MyHomePage({Key key, @required this.title}) : super(key: key);

  TextEditingController _controller = new TextEditingController();

  void _onSubmit(username, context) {
    username.setUsername(_controller.text);
    print(username.getUsername());
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => FakeRazer()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final username = Provider.of<User>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              autofocus: true,
              cursorColor: Colors.green,
              controller: _controller,
              keyboardType: TextInputType.number,
              onSubmitted: (value) {
                _onSubmit(username, context);
              },
              decoration: InputDecoration(
                hintText: "Username",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: BorderSide(
                    color: Colors.amber,
                    style: BorderStyle.solid,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _onSubmit(username, context),
        tooltip: 'Login',
        child: Icon(Icons.check),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
