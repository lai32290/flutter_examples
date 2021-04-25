import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  bool isBig = false;

  @override
  Widget build(BuildContext context) {
    double size = isBig ? 400 : 200;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedContainer(
          duration: Duration(milliseconds: 400),
          padding: EdgeInsets.all(20),
          width: size,
          height: size,
          child: Image.asset('images/huru.jpeg'),
          curve: Curves.bounceOut
        ),
        ElevatedButton(
          child: Text('Change Size'),
          onPressed: () => setState(() { isBig = !isBig; })
        )
      ]
    );
  }
}
