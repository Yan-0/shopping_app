import 'package:flutter/material.dart';

import '../widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class Cart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.cremeColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart".text.xl.make(),
      ),
    );
  }
}
