import 'package:flutter/material.dart';
import 'package:flutter_app/Screens/home_detail.dart';
import '../../models/catalog.dart';
import 'catalog_item.dart';

class CatalogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: ((context, index) {
        final catalog = CatalogModel.items[index];
        return InkWell(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: ((context) => HomeDetail(catalog: catalog)),
            ),
          ),
          child: CatalogItem(catalog: catalog),
        );
      }),
    );
  }
}
