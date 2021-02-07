import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/components/CustomAppBar.dart';
import 'package:flutter_app/components/hamburger.dart';

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
    final ClassViewArguments args = ModalRoute.of(context).settings.arguments;

    final firestoreInstance = FirebaseFirestore.instance;
    DocumentReference classes =
        firestoreInstance.collection('classes').doc(args.id);

    classes.get().then(
        (DocumentSnapshot snapshot) => {_status = snapshot.data()['status']});

    classes.snapshots().listen((snapshot) {
      setState(() {
        classes.get().then(
            (DocumentSnapshot snapshot) => {_status = snapshot.get('status')});
      });
    });

    return new FutureBuilder<DocumentSnapshot>(
        future: classes.get(),
        builder: (BuildContext buildContext,
            AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (!snapshot.hasData) return new Text('Loading...');
          return Scaffold(
            appBar: CustomAppBar('Teachers'),
            drawer: Hamburger(),
            body: Column(children: <Widget>[
              ListTile(
                title: new Text("Status"),
                subtitle: new Text('$_status'),
              ),
              ElevatedButton(
                  onPressed: () {
                    FirebaseFirestore.instance
                        .collection('notification')
                        .add({
                          'notification': 'Class is starting!',
                        })
                        .then((result) => print("success"))
                        .catchError((err) => print(err));
                    snapshot.data.data().update("status", (value) => "active");
                  },
                  child: Text("Start Class")
              ),
              ElevatedButton(
                  onPressed: () {
                    FirebaseFirestore.instance
                        .collection('notification')
                        .add({
                      'notification': 'Class is ending!',
                    })
                        .then((result) => print("success"))
                        .catchError((err) => print(err));
                    snapshot.data.data().update("status", (value) => "inactive");
                  },
                  child: Text("End Class")
              )
            ]),
          );
        });
  }
}

class ClassViewArguments {
  final String classname;
  final String id;

  ClassViewArguments(this.classname, this.id);
}
