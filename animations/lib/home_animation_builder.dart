import 'package:flutter/material.dart';

class AnimnationBuilderHome extends StatefulWidget {
  @override
  _AnimnationBuilderHomeState createState() => _AnimnationBuilderHomeState();
}

class _AnimnationBuilderHomeState extends State<AnimnationBuilderHome> with SingleTickerProviderStateMixin {

  AnimationController _animationController;
  Animation _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this
    );

    _animation = Tween<double>(
      begin: 0,
      end: 4
    ).animate(_animationController);
  }

  @override
  dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _animationController.forward();

    return Container(
      padding: EdgeInsets.all(20),
      color: Colors.white,
      child: AnimatedBuilder(
        animation: _animation,
        child: Image.asset('images/huru.jpeg'),
        builder: (context, widget) {
          return Transform.scale(
            scale: _animation.value,
            child: widget
          );
        }
      )
    );
  }
}


