import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_app/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:google_fonts/google_fonts.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        child: Text(
          "What are you looking for?",
          style: TextStyle(
            color: MyTheme.darkbluishColor,
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ).p20(),
      ),
    ));
  }
}
