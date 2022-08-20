import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/core/store.dart';
import 'package:flutter_app/Screens/bottom_bar.dart';
import 'package:flutter_app/models/cart_model.dart';
import 'dart:convert';
import 'package:flutter_app/models/catalog.dart';
import 'package:flutter_app/utils/routes.dart';
import 'package:flutter_app/widgets/home_widget/catalog_header.dart';
import 'package:flutter_app/widgets/home_widget/catalog_list.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final url = "https://api.jsonbin.io/b/604dbddb683e7e079c4eefd3";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");

    // final response = await http.get(Uri.parse(url));
    // final catalogJson = response.body;
    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore).cart;

    return Scaffold(
      backgroundColor: context.canvasColor,
      floatingActionButton: VxBuilder(
          mutations: {AddMutation, RemoveMutation},
          builder: ((context, store, status) => FloatingActionButton(
                onPressed: () =>
                    Navigator.pushNamed(context, MyRoutes.cartRoute),
                backgroundColor: context.theme.buttonColor,
                child: Icon(
                  CupertinoIcons.cart,
                  color: Colors.white,
                ),
              ).badge(
                color: Vx.gray300,
                size: 22,
                count: _cart.items.length,
                textStyle:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ))),
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogHeader(),
              if (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
                CatalogList().py16().expand()
              else
                CircularProgressIndicator(
                  color: context.accentColor,
                ).centered().expand(),
            ],
          ),
        ),
      ),
    );
  }
}
