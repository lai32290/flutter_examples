import 'package:flutter/material.dart';

class Home2 extends StatefulWidget {
  @override
  _Home2State createState() => _Home2State();
}

class _Home2State extends State<Home2> {

  bool isBig = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('My App')
      ),
      body: AnimatedContainer(
        duration: Duration(seconds: 1),
        color: Colors.green,
        padding: EdgeInsets.only(top: 20, bottom: 100),
        alignment: isBig ? Alignment.topCenter : Alignment.bottomCenter,
        child: AnimatedOpacity(
          duration: Duration(seconds: 1),
          opacity: isBig ? 0 : 1,
          child: Container(
            height: 50,
            child: Icon(Icons.airplanemode_active, size: 50, color: Colors.white)
          )
        )
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
        elevation: 6,
        child: Icon(Icons.add_box),
        onPressed: () {
          setState(() { isBig = !isBig; });
        }
      )
    );
  }
}
