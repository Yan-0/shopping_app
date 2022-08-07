import 'package:flutter/material.dart';
import 'package:flutter_app/models/catalog.dart';
import 'package:flutter_app/widgets/item_widget.dart';

import '../widgets/drawer.dart';

class Home extends StatelessWidget {
  final String name = "Shreyan";

  @override
  Widget build(BuildContext context) {
    final dummyList = List.generate(20, (index) => CatalogModel.items[0]);
    return Scaffold(
      appBar: AppBar(
        title: Text("Catalog App"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: dummyList.length,
          itemBuilder: (context, index) {
            return ItemWidget(
              item: dummyList[index],
            );
          },
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
