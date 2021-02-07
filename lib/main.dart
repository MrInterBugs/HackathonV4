import 'package:flutter/material.dart';
import 'package:flutter_app/components/CustomAppBar.dart';
import 'package:flutter_app/components/hamburger.dart';
import 'screens/StudentView.dart';
import 'screens/TeacherHome.dart';
import 'screens/Auth.dart';
import 'package:awesome_notifications/awesome_notifications.dart';

void main() async {
  AwesomeNotifications().initialize(
    // set the icon to null if you want to use the default app icon
      'resource://drawable/test',
      [
        NotificationChannel(
            channelKey: 'basic_channel',
            channelName: 'Basic notifications',
            channelDescription: 'Notification channel for basic tests',
            defaultColor: Color(0xFF9D50DD),
            ledColor: Colors.white
        )
      ]
  );
  AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
    if (!isAllowed) {
      // Insert here your friendly dialog box before call the request method
      // This is very important to not harm the user experience
      AwesomeNotifications().requestPermissionToSendNotifications();
    }
  });
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
      '/teacherView/classView': (context) => ClassView(),
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


