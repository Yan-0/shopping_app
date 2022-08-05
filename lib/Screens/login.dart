import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Text(
          "Login",
          style: TextStyle(
            fontSize: 30,
            color: Colors.cyan,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
