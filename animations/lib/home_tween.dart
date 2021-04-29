import 'package:flutter/material.dart';

class TweenAnimation extends StatefulWidget {
  @override
  _TweenAnimationState createState() => _TweenAnimationState();
}

class _TweenAnimationState extends State<TweenAnimation> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: TweenAnimationBuilder(
        duration: Duration(seconds: 8),
        tween: Tween<double>(begin: 0, end: 6.28),
        child: Image.asset('images/huru.jpeg'),
        builder: (BuildContext context, double angle, Widget widget) {
          return Transform.rotate(
            angle: angle,
            child: ColorFiltered(
              colorFilter: ColorFilter.mode(Colors.teal, BlendMode.overlay),
              child: widget
            )
          );
        }
      ) 
    );
  }
}
