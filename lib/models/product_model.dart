import './category_enum.dart';

import 'package:uuid/uuid.dart';

var uuid = const Uuid();

class ProductModel {
  String id;
  String idEntrepreneurship;
  String name;
  Category category;
  int quantity;
  double price;
  double infractionCost;
  String imageRoute;

  ProductModel({
    required this.id,
    required this.idEntrepreneurship,
    required this.name,
    required this.category,
    required this.quantity,
    required this.price,
    required this.infractionCost,
    this.imageRoute = 'assets/images/product.png',
  });

  ProductModel.fromMap(Map<String, dynamic> map) :
    id = map['id'],
    idEntrepreneurship = map['idEntrepreneurship'],
    name = map['name'],
    category = Category.values.firstWhere((element) => element.toString() == 'Category.' + map['category']),
    quantity = map['quantity'],
    price = (map['price'] as num).toDouble(),
    infractionCost = (map['infractionCost'] as num).toDouble(),
    imageRoute = map['imageRoute'];
  

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'idEntrepreneurship': idEntrepreneurship,
      'name': name,
      'category': category.toString().split('.').last,
      'quantity': quantity,
      'price': price,
      'infractionCost': infractionCost,
      'imageRoute': imageRoute,
    };
  }

  static listToString(List<ProductModel> list) {
    String result = '';
    for (var element in list) {
      result += '${element.quantity} unidades de ${element.name} ,';
    }
    return result;
  }

}