import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../models/catalog.dart';
import '../widgets/home_widget/catalog_item.dart';
import 'home_detail.dart';
import 'package:google_fonts/google_fonts.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            "What are you looking for?"
                .text
                .textStyle(TextStyle(
                    fontWeight: FontWeight.bold,
                    color: context.theme.accentColor))
                .xl5
                .make()
                .p20(),
            Container(
              child: TextFormField(
                decoration: InputDecoration(
                    icon: Icon(FluentSystemIcons.ic_fluent_search_regular),
                    labelText: "Search"),
                textInputAction: TextInputAction.search,
              ).px24(),
            ),
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
              "You might also like"
                  .text
                  .xl3
                  .fontWeight(FontWeight.bold)
                  .make()
                  .pOnly(top: 50, left: 13)
            ]),
            ListView.builder(
              shrinkWrap: true,
              itemCount: 3,
              itemBuilder: ((context, index) {
                final catalog = CatalogModel.items[index];
                return InkWell(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => HomeDetail(catalog: catalog))),
                  ),
                  child: CatalogItem(catalog: catalog),
                );
              }),
            ).px12().expand(),
          ],
        ),
      ),
    );
  }
}
