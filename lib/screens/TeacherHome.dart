import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/components/CustomAppBar.dart';
import 'package:flutter_app/components/Hamburger.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/screens/ClassView.dart';

class TeacherHome extends StatelessWidget {
  TeacherHome({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firestoreInstance = FirebaseFirestore.instance;
    CollectionReference classes = firestoreInstance.collection('classes');

    return new StreamBuilder<QuerySnapshot>(
        stream: classes.snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading");
          }

          return new Scaffold(
            body: new ListView(
              children: snapshot.data.docs.map((DocumentSnapshot document) {
                return new ElevatedButton(
                  onPressed: () {
                    print(document.data()['name']);
                    Navigator.pushNamed(context, ClassView.routeName,
                        arguments: ClassViewArguments(document.data()['name']));
                  },
                  child: new Text(document.data()['name']),
                );
              }).toList(),
            ),
          );
        });
  }
}
