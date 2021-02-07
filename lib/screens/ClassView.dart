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
    final ClassViewArguments args = ModalRoute.of(context).settings.arguments;
    final firestoreInstance = FirebaseFirestore.instance;
    CollectionReference classes = firestoreInstance.collection('classes');

    return Scaffold(
      appBar: CustomAppBar(args.classname),
      body: Text('Test')
    );
  }
}

class ClassViewArguments {
  final String classname;

  ClassViewArguments(this.classname);
}