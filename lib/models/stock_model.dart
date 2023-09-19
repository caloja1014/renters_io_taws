import './product_model.dart';

class StockModel {
  String id;
  ProductModel product;
  int quantity;

  StockModel({
    required this.product,
    required this.quantity,
    required this.id,
  });
}