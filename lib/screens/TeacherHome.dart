import 'package:flutter/material.dart';
import 'package:flutter_app/components/hamburger.dart';

class TeacherHome extends StatelessWidget {
  TeacherHome({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final className = List<String>.generate(5, (i) => "Class $i");

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Teacher View"),
      ),
      body: ListView.builder(
        itemCount: className.length,
        itemBuilder: (context, index) {
          return ElevatedButton(
            onPressed: () {},
            child: Text('${className[index]}'),
          );
        },
      ),
      drawer: Hamburger(),
    );
  }
}
