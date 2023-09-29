import './category_enum.dart';

import 'package:uuid/uuid.dart';

var uuid = const Uuid();

class ProductModel {
  String id;
  String name;
  Category category;
  double price;
  double infractionCost;
  String imageRoute;

  ProductModel({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.infractionCost,
    this.imageRoute = 'assets/images/product.png',
  });

  ProductModel.fromMap(Map<String, dynamic> map) :
    id = map['id'],
    name = map['name'],
    category = Category.values.firstWhere((element) => element.toString() == 'Category.' + map['category']),
    price = map['price'],
    infractionCost = map['infractionCost'],
    imageRoute = map['imageRoute'];
  

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'category': category.toString().split('.').last,
      'price': price,
      'infractionCost': infractionCost,
      'imageRoute': imageRoute,
    };
  }

  static List <ProductModel> getProducts() {
    List<ProductModel> products = [];

    products.add(
      ProductModel(
        id: uuid.v4(),
        name: 'Abrazadera para manguera de 3/4 pulgadas',
        category: Category.metal,
        price: 0.45,
        infractionCost: 0.10,
        imageRoute: 'assets/images/abrazadera.png'
      ),
    );
    products.add(
      ProductModel(
        id: uuid.v4(),
        name: 'Abrazadera para manguera de 1/4 pulgadas',
        category: Category.metal,
        price: 0.30,
        infractionCost: 0.05,
        imageRoute: 'assets/images/abrazadera.png'
      )
    );
    
    return products;
  }

}