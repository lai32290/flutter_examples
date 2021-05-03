import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {

  final String hint;
  final bool obscure;
  final Icon icon;

  CustomInput({@required this.hint, this.icon, this.obscure = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: TextField(
        obscureText: obscure,
        decoration: InputDecoration(
          icon: icon,
          border: InputBorder.none,
          hintText: hint,
          hintStyle:  TextStyle(
            color: Colors.grey[200],
            fontSize:  18,
          )
        ),
      )
    );
  }
}
