import 'package:flutter/material.dart';

class Home3 extends StatefulWidget {
  @override
  _Home3State createState() => _Home3State();
}

class _Home3State extends State<Home3> {

  bool isBig = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('My App')
      ),
      body: GestureDetector(
        onTap: () {
          setState(() {
            isBig = !isBig;
          });
        },
        child: AnimatedContainer(
          duration: Duration(milliseconds:  300),
          curve: Curves.linear,
          alignment: Alignment.center,
          width: isBig ? 160 : 60,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius:  BorderRadius.circular(30)
          ),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: AnimatedOpacity(
                  duration: Duration(milliseconds: 100),
                  opacity: isBig ? 0 : 1,
                  child: Icon(Icons.person_add, color: Colors.white)
                )
              ),
              Align(
                alignment: Alignment.center,
                child: AnimatedOpacity(
                  duration: Duration(milliseconds: 100),
                  opacity: isBig ? 1 : 0,
                  child: Text('Message', style: TextStyle(color: Colors.white))
                )
              )
            ]
          )
        )
      ),
    );
  }
}
