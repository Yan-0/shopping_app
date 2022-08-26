import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:google_fonts/google_fonts.dart';

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(children: [
          "assets/images/S_logo.png"
              .circularAssetImage(radius: 30.0, bgColor: Colors.black)
              .innerShadow(color: Colors.black),
          "hopmart"
              .text
              .xl6
              .bold
              .color(context.accentColor)
              .textStyle(
                  TextStyle(fontFamily: GoogleFonts.spaceGrotesk().fontFamily))
              .make(),
        ]),
        "Trending products".text.xl3.make(),
      ],
    );
  }
}
