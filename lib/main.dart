import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter_app/components/CustomAppBar.dart';
import 'package:flutter_app/components/hamburger.dart';
import 'screens/StudentView.dart';
import 'screens/TeacherHome.dart';
import 'screens/Auth.dart';
import 'package:firebase_core/firebase_core.dart';

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
      '/authenticate': (context) => Auth()
    },
  ));
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar('Home'),
      backgroundColor: Color(0xff2d2b2a),
      body: Center(child:Text('Center')),
      drawer: Hamburger(),
    );
  }
}
