import './product_model.dart';

import 'package:uuid/uuid.dart';

var uuid = const Uuid();

class StockModel {
  String id;
  ProductModel product;
  int quantity;

  StockModel({
    required this.product,
    required this.quantity,
    required this.id,
  });

  static StockModel getStock(ProductModel product, int quantity) {
    return StockModel(
      id: uuid.v1(),
      product: product,
      quantity: quantity,
    );
  }

  static List<StockModel> buildStock(List<ProductModel> products) {
    List<StockModel> stock = [];
    List<ProductModel> products = ProductModel.getProducts();

    stock.add(
      StockModel(
        id: uuid.v1(),
        product: products[0],
        quantity: 10,
      ),
    );

    stock.add(
      StockModel(
        id: uuid.v1(),
        product: products[1],
        quantity: 20,
      ),
    );

    return stock;
  }
}