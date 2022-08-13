import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_app/models/cart_model.dart';
import 'package:flutter_app/models/catalog.dart';

class MyStore extends VxStore {
  CatalogModel catalog;
  CartModel cart;

  MyStore(
    this.catalog,
    this.cart,
  ) {
    catalog = CatalogModel();
    cart = CartModel();
    cart.catalog = catalog;
  }
}
