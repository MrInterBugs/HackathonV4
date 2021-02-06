import 'package:flutter/material.dart';

class Hamburger extends StatelessWidget {
  @override
  Widget Build(BuildContext context) {
    return Container(
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
            // Home
            ListTile(
              title: Text('Home Page'),
              onTap: () {
                Navigator.pushNamed(context, '/');
              },
            ),
            // Teachers View
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
              title: Text('Student View'),
              onTap: () {
                // Update the state of the app.
                // ...
                // Then close the drawer.
                Navigator.pushReplacementNamed(context, '/studentView');
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
            // Logout Button
            ListTile(
              title: Text('Logout'),
              onTap: () {
                // Update the state of the app.
                // ...
                // Then close the drawer. and return to auth screen
                Navigator.pushReplacementNamed(context, '/authenticate');
              },
            ),
          ],
        ),
      ),
    );
  }
}
