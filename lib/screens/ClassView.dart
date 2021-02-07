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
  String _status;

  @override
  Widget build(BuildContext context) {
    final ClassViewArguments args = ModalRoute
        .of(context)
        .settings
        .arguments;

    final firestoreInstance = FirebaseFirestore.instance;
    DocumentReference classes = firestoreInstance.collection('classes').doc(
        args.id);

    classes.get().then((DocumentSnapshot snapshot) => {
      _status = snapshot.data()['status']
    });

    classes.snapshots().listen((snapshot) {
      setState(() {
        classes.get().then((DocumentSnapshot snapshot) => {
          _status = snapshot.get('status')
        });
      });
    });

    return new FutureBuilder<DocumentSnapshot> (
        future: classes.get(),
        builder: (BuildContext buildContext,
            AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (!snapshot.hasData) return new Text('Loading...');
          return Scaffold(
              body: ListTile(
                title: new Text("Status"),
                subtitle: new Text('$_status'),
              )
          );
        }
    );
  }
}

class ClassViewArguments {
  final String classname;
  final String id;

  ClassViewArguments(this.classname, this.id);
}