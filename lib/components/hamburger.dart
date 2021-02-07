import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/screens/SignIn.dart';

class Hamburger extends StatelessWidget {
  Hamburger({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: Theme.of(context).copyWith(canvasColor: Color(0xff2d2b2a)),
        child: Container(
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
                  child: Text('Menu',
                      style: TextStyle(color: Color(0xfffe8019), fontSize: 35)),
                ),
                // Home
                ListTile(
                  title: Text('Home Page'),
                  onTap: () {
                    Navigator.pushNamed(context, '/');
                  },
                ),
                // Teachers View

                CustomListTile(
                    title: 'Teachers View', routeName: '/teacherView'),
                CustomListTile(
                    title: 'Student View', routeName: '/studentView'),
                ListTile(
                  title: Text('Messages'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Text('Timetable'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                // Logout Button
                ListTile(
                  title: Text('Logout'),
                  onTap: () {
                    signOutGoogle();
                    SystemNavigator.pop();
                  },
                ),
              ],
            ),
          ),
        ));
  }
}

class CustomListTile extends StatelessWidget {
  final String title;
  final String routeName;

  final Function stateMutations;

  CustomListTile(
      {@required this.title, @required this.routeName, this.stateMutations});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(this.title),
        selected: ModalRoute.of(context).settings.name == this.routeName,
        onTap: () {
          if (this.stateMutations != null) this.stateMutations();
          Navigator.pushNamed(context, this.routeName);
        });
  }
}
