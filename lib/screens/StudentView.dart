import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_app/components/CustomAppBar.dart';
import 'package:flutter_app/components/hamburger.dart';

import 'SignIn.dart';

class StudentView extends StatelessWidget {
  StudentView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar('Student View'),
      drawer: Hamburger(),
      backgroundColor: const Color(0xff1d1f27),
      body: Stack(
        children: <Widget>[
          Pinned.fromSize(
            bounds: Rect.fromLTWH(136.0, 379.0, 259.0, 56.0),
            size: Size(412.0, 870.0),
            pinRight: true,
            fixedWidth: true,
            fixedHeight: true,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(39.0),
                color: const Color(0xffffffff),
                border: Border.all(width: 1.0, color: const Color(0xff707070)),
              ),
            ),
          ),
          Pinned.fromSize(
            bounds: Rect.fromLTWH(15.0, 503.0, 243.0, 56.0),
            size: Size(412.0, 870.0),
            pinLeft: true,
            fixedWidth: true,
            fixedHeight: true,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(45.0),
                color: const Color(0xffffffff),
                border: Border.all(width: 1.0, color: const Color(0xff707070)),
              ),
            ),
          ),
          Pinned.fromSize(
            bounds: Rect.fromLTWH(15.0, 503.0, 243.0, 56.0),
            size: Size(412.0, 870.0),
            pinLeft: true,
            fixedWidth: true,
            fixedHeight: true,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(45.0),
                color: const Color(0xffffffff),
                border: Border.all(width: 1.0, color: const Color(0xff707070)),
              ),
            ),
          ),
          Pinned.fromSize(
            bounds: Rect.fromLTWH(141.0, 697.0, 243.0, 56.0),
            size: Size(412.0, 870.0),
            pinRight: true,
            pinBottom: true,
            fixedWidth: true,
            fixedHeight: true,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(28.0),
                color: const Color(0xff03dac5),
              ),
            ),
          ),
          Pinned.fromSize(
            bounds: Rect.fromLTWH(15.0, 503.0, 243.0, 56.0),
            size: Size(412.0, 870.0),
            pinLeft: true,
            fixedWidth: true,
            fixedHeight: true,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(45.0),
                color: const Color(0xffffffff),
                border: Border.all(width: 1.0, color: const Color(0xff707070)),
              ),
            ),
          ),
          Pinned.fromSize(
            bounds: Rect.fromLTWH(197.0, 701.0, 132.0, 48.0),
            size: Size(412.0, 870.0),
            pinBottom: true,
            fixedWidth: true,
            fixedHeight: true,
            child: Text(
              'I\'m here',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 36,
                color: const Color(0xff000000),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Pinned.fromSize(
            bounds: Rect.fromLTWH(15.0, 650.0, 126.0, 149.0),
            size: Size(412.0, 870.0),
            pinLeft: true,
            pinBottom: true,
            fixedWidth: true,
            fixedHeight: true,
            child: InkWell(
              onTap: () {
                AwesomeNotifications().createNotification(
                    content: NotificationContent(
                        id: 10,
                        channelKey: 'basic_channel',
                        title: '✋',
                        body: (name + ' would like to ask a question.')
                    ),
                );
              },
              child: Text(
              '✋',
              style: TextStyle(
              fontFamily: 'Segoe UI',
              fontSize: 112,
              color: const Color(0xffffffff),
              ),
              textAlign: TextAlign.center,
              ),
            ),
          ),
          Pinned.fromSize(
            bounds: Rect.fromLTWH(73.0, 507.0, 133.0, 48.0),
            size: Size(412.0, 870.0),
            fixedWidth: true,
            fixedHeight: true,
            child: Text(
              'asdfasdf',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 36,
                color: const Color(0xff000000),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Pinned.fromSize(
            bounds: Rect.fromLTWH(190.0, 379.0, 145.0, 56.0),
            size: Size(412.0, 870.0),
            fixedWidth: true,
            fixedHeight: true,
            child: Text(
              'asdfasdf',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 36,
                color: const Color(0xff000000),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Pinned.fromSize(
            bounds: Rect.fromLTWH(27.0, 211.0, 368.0, 101.0),
            size: Size(412.0, 870.0),
            pinLeft: true,
            pinRight: true,
            fixedHeight: true,
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xffaa3636),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
