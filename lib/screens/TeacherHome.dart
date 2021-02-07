import 'package:flutter/material.dart';
import 'package:flutter_app/components/CustomAppBar.dart';
import 'package:flutter_app/components/Hamburger.dart';

class TeacherHome extends StatelessWidget {
  TeacherHome({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final className = List<String>.generate(5, (i) => "Class $i");

    return Scaffold(
        appBar: CustomAppBar( 'Teacher View' ),
        body: ListView.builder(
          itemCount: className.length,
          itemBuilder: (context, index) {
            return ElevatedButton(
              onPressed: () {},
              child: Text('${className[index]}'),
            );
          },
        ),
        drawer: Hamburger());
  }
}
