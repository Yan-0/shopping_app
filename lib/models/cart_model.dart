import 'package:flutter_app/core/store.dart';
import 'package:flutter_app/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel {
//Category Field
  late CatalogModel _catalog;

//Collection of Ids - store Ids of each item

  final List<int> _itemIds = [];

  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newCatalog) {
    _catalog = newCatalog;
  }

//Get items in cart
  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

//Get total price

  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

//Remove item

  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}

class AddMutation extends VxMutation<MyStore> {
  final Item item;

  AddMutation(this.item);
  @override
  perform() {
    store?.cart._itemIds.add(item.id);
  }
}
