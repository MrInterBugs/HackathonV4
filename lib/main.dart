import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'components/hamburger.dart';
import 'screens/studentView.dart';
import 'screens/TeacherHome.dart';
import 'screens/Auth.dart';

void main() {
  // run authenitcation check here
  final bool isAuthenticated = false;
  runApp(MaterialApp(
    title: 'COVID system',
    // Start the app with the "/" named route. In this case, the app starts
    // on the FirstScreen widget.
    //
    initialRoute: isAuthenticated ? '/' : '/authenticate',
    routes: {
      '/': (context) => Home(),
      '/teacherView': (context) => TeacherHome(),
      '/studentView': (context) => StudentView(),
      '/authenticate': (context) => Auth(),
    },
  ));
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Page"),),
        body: Text('centered thingy'),
        drawer: Hamburger(),
    );
  }
}
