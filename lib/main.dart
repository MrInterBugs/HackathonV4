import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'screens/TeacherHome.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Covid 19 Education Support App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Home page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  static const platform = const MethodChannel('com.rhulcsprojects.flutter_app/time');
  String _currentTime = 'Press the button to get the time.';

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }


  Future<void> _getCurrentTime() async {
    String currentTime;
    try {
      final String result = await platform.invokeMethod('getCurrentTime');
      currentTime = 'Time now is $result .';
    } on PlatformException catch (e) {
      currentTime = "Failed to get time: '${e.message}'.";
    }

    setState(() {
      _currentTime = currentTime;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            ElevatedButton(
              child: Text('Get the current time!'),
              onPressed: _getCurrentTime,
            ),
            Text(_currentTime),
          ],
        ),
      ),
      drawer: Container(
        width: 150,
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: Drawer(
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Text('Menu'),
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
              ),
              ListTile(
                title: Text('Home Page'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Teachers View'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TeacherHome()),
                  );
                },
              ),
              ListTile(
                title: Text('Messages'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                  // Then close the drawer.
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Timetable'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                  // Then close the drawer.
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Logout'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                  // Then close the drawer.
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
