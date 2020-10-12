import 'package:flutter/material.dart';
import 'package:testlogin_app/sidebar/sidebar_layout.dart';

class mainScreen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'GotMySafety',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primaryColor: Colors.white,
       // primarySwatch: Colors.green,
      ),
      home: SideBarLayout(),
    );
  }
}
