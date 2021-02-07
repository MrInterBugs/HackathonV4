import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/components/CustomAppBar.dart';
import 'package:flutter_app/components/hamburger.dart';

class Register extends StatelessWidget {
  Register({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firestoreInstance = FirebaseFirestore.instance;
    CollectionReference classes = firestoreInstance.collection('register');

    return Scaffold(
        appBar: CustomAppBar('Register View'),
        drawer: Hamburger(),
        body: new StreamBuilder<QuerySnapshot>(
            stream: classes.snapshots(),
            builder: (BuildContext context,
                AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return Text('Something went wrong');
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return Text("Loading");
              }

              return new Scaffold(
                body: new ListView (
                  children: snapshot.data.docs.map((DocumentSnapshot document) {
                    return Text(document.data()['full_name']);
                  }).toList(),
                ),
              );
            })
    );
  }
}
