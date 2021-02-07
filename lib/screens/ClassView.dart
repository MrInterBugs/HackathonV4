import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/components/CustomAppBar.dart';

class ClassView extends StatefulWidget {
  static const routeName = '/teacherView/classView';

  ClassView({Key key}) : super(key: key);

  @override
  _ClassViewState createState() => _ClassViewState();
}

class _ClassViewState extends State<ClassView> {
  @override
  Widget build(BuildContext context) {
    final ClassViewArguments args = ModalRoute
        .of(context)
        .settings
        .arguments;
    final firestoreInstance = FirebaseFirestore.instance;
    Query classes = firestoreInstance.collection('classes').where('name', isEqualTo: args.classname);

    // classes.snapshots().listen((querySnapshot) {
    //   querySnapshot.docChanges.forEach((change) {
    //
    //   });
    // });

    return new StreamBuilder<QuerySnapshot> (
        stream: classes.snapshots(),
        builder: (BuildContext buildContext, AsyncSnapshot<QuerySnapshot> snapshot) {
          if(!snapshot.hasData) return new Text('Loading...');
          return Scaffold(
            body: new ListView(
              children: snapshot.data.docs.map((DocumentSnapshot document) {
                return new ListTile(
                  title: new Text("Status"),
                  subtitle: new Text(document['status']),
                );
              }).toList(),
            )
          );
        }
    );
  }
}

class ClassViewArguments {
  final String classname;

  ClassViewArguments(this.classname);
}