import './category_enum.dart';

class ProductModel {
  String id;
  String name;
  Category category;
  double price;
  double infractionCost;

  ProductModel({
    required this.name,
    required this.category,
    required this.price,
    required this.infractionCost,
    required this.id,
  });

}