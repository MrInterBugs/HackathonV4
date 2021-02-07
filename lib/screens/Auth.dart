import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';

import 'SignIn.dart';
import 'UserInfo.dart';

class Auth extends StatelessWidget {
  Auth({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff2d2b2a),
      body: Stack(
        children: <Widget>[
          // Welcome Text
          Pinned.fromSize(
            bounds: Rect.fromLTWH(89.1, 22.5, 240, 72.0),
            size: Size(412.0, 870.0),
            pinLeft: true,
            pinRight: true,
            pinTop: true,
            fixedHeight: true,
            child: Text(
              'Welcome',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 52,
                color: const Color(0xffebdbb2),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          // Login Button
          Pinned.fromSize(
            // position and width styling
            bounds: Rect.fromLTWH(17.8, 591.7, 376.3, 74.3),
            size: Size(412.0, 870.0),
            pinLeft: true,
            pinRight: true,
            fixedHeight: true,
            // Nice button go brrrr
            child: InkWell(
              onTap: () {
                signInWithGoogle().then((result) {
                  if (result != null) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return UserInfo();
                        },
                      ),
                    );
                  }
                });
              },
              borderRadius: BorderRadius.circular(96.0),
              child: Ink(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(96.0),
                  color: const Color(0xfffe8019),
                ),
                child: Text(
                  'Register',
                  style: TextStyle(
                    fontFamily: 'Segoe UI',
                    fontSize: 54,
                    color: const Color(0xff000000),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          // Placeholder Text (to be replaced with microphone svg)
          Pinned.fromSize(
            bounds: Rect.fromLTWH(3.6, 262.5, 404.7, 119.0),
            size: Size(412.0, 870.0),
            pinLeft: true,
            pinRight: true,
            fixedHeight: true,
            child: Text(
              'Insert random Logo (microphone svg?)',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 36,
                color: const Color(0xff707070),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          // Hint text
          Pinned.fromSize(
            bounds: Rect.fromLTWH(22.0, 800.0, 368.0, 68.0),
            size: Size(412.0, 870.0),
            pinLeft: true,
            pinRight: true,
            pinBottom: true,
            fixedHeight: true,
            child: Text(
              'Or, say "login" to enter the next page',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 24,
                color: const Color(0xff707070),
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
