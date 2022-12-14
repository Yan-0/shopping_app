import 'dart:convert';

class CatalogModel {
  static List<Item> items = [];

//Get Item By ID
  Item getById(int id) =>
      items.firstWhere((element) => element.id == id, orElse: null);

//Get Item By Position
  Item getByPosition(int pos) => items[pos];
}

class Item {
  final int id;
  final String name;
  final String desc;
  final String fulldesc;
  final num price;
  final String color;
  final String image;

  Item(
      {required this.id,
      required this.name,
      required this.desc,
      required this.fulldesc,
      required this.price,
      required this.color,
      required this.image});

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map["id"],
      name: map["name"],
      desc: map["desc"],
      fulldesc: map["fulldesc"],
      price: map["price"],
      color: map["color"],
      image: map["image"],
    );
  }

  toMap() => {
        "id": id,
        "name": name,
        "desc": desc,
        "fulldesc": fulldesc,
        "price": price,
        "color": color,
        "image": image,
      };
}
