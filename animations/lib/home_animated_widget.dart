import 'package:flutter/material.dart';

class AnimatedWidgetHome extends StatefulWidget {
  @override
  _AnimatedWidgetHomeState createState() => _AnimatedWidgetHomeState();
}

class _AnimatedWidgetHomeState extends State<AnimatedWidgetHome> with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  AnimationStatus _animationStatus;


  @override
  initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(seconds: 5),
      vsync: this
    )
    ..repeat()
    ..addStatusListener((status) {
      _animationStatus = status;
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Container(
            height: 400,
            child: RotationTransition(
              alignment: Alignment.center,
              child: Image.asset('images/huru.jpeg'),
              turns: _animationController
            )
          ),
          ElevatedButton(
            child: Text('Press here'),
            onPressed: () {
              if (_animationStatus == AnimationStatus.dismissed) {
                _animationController.repeat();
              } else {
                _animationController.reverse();
              }

              /*
              if(_animationController.isAnimating) {
                _animationController.stop();
              } else {
                _animationController.repeat();
              }
              */
            }
          )
        ]
      )
    );
  }
}

