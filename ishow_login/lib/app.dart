import 'package:flutter/material.dart';
import 'package:ishow_login/login.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'iShow Login',
      debugShowCheckedModeBanner: false,
      home: LoginPage()
    );
  }
}
