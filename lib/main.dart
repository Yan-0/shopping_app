import 'package:flutter/material.dart';
import 'package:flutter_app/Screens/cart.dart';
import 'package:flutter_app/Screens/home.dart';
import 'package:flutter_app/Screens/login.dart';
import 'package:flutter_app/core/store.dart';
import 'package:flutter_app/models/cart_model.dart';
import 'package:flutter_app/models/catalog.dart';
import 'package:flutter_app/utils/routes.dart';
import 'package:flutter_app/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();
  runApp(
    VxState(store: MyStore(CatalogModel(), CartModel()), child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      debugShowCheckedModeBanner: false,
      initialRoute: MyRoutes.homeRoute,
      routes: {
        "/": (context) => Login(),
        MyRoutes.homeRoute: (context) => Home(),
        MyRoutes.loginRoute: (context) => Login(),
        MyRoutes.cartRoute: (context) => Cart(),
      },
    );
  }
}
