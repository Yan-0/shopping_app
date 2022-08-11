import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogImage extends StatelessWidget {
  final String image;

  const CatalogImage({super.key, required this.image}) : assert(image != null);
  @override
  Widget build(BuildContext context) {
    return Image.network(
      image,
    ).box.rounded.color(MyTheme.cremeColor).make().p16().w40(context);
  }
}
