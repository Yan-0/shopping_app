import 'package:flutter/material.dart';
import 'package:flutter_app/models/catalog.dart';
import 'package:flutter_app/widgets/home_widget/add_to_cart.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetail extends StatelessWidget {
  final Item catalog;

  const HomeDetail({super.key, required this.catalog})
      : assert(catalog != null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: context.canvasColor,
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${catalog.price}".text.bold.xl4.red900.make(),
            AddToCart(
              catalog: catalog,
            ).wh(130, 50),
          ],
        ).p32(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
              tag: Key(catalog.id.toString()),
              child: Image.network(catalog.image),
            ).h32(context),
            Expanded(
              child: VxArc(
                height: 30.0,
                arcType: VxArcType.CONVEY,
                edge: VxEdge.TOP,
                child: Container(
                    color: context.cardColor,
                    width: context.screenWidth,
                    child: Column(
                      children: [
                        catalog.name.text.xl4
                            .color(context.accentColor)
                            .bold
                            .make(),
                        catalog.desc.text
                            .textStyle(context.captionStyle)
                            .xl
                            .make(),
                        10.heightBox,
                        "Dumdsjaj dsjadjsajd dsakieqrq d kqwke qwkrksad a kdsadowqkeqwr kaos kwoqeirq  asodias doqwei qiwrowq"
                            .text
                            .textStyle(context.captionStyle)
                            .make()
                            .p16(),
                      ],
                    ).py64()),
              ),
            )
          ],
        ),
      ),
    );
  }
}
