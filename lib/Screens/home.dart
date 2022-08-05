import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final String name = "Shreyan";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My App"),
      ),
      body: Center(
        child: Container(
          child: Text("Welcome to My App \n By $name"),
        ),
      ),
      drawer: Drawer(),
    );
  }
}
