import './product_model.dart';

import 'package:uuid/uuid.dart';
import 'package:renters_io_taws/models/stock_model.dart';
import 'package:renters_io_taws/models/stock_model.dart';
import 'package:renters_io_taws/models/stock_model.dart';
import 'package:renters_io_taws/models/stock_model.dart';
import 'package:renters_io_taws/models/stock_model.dart';

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

  StockModel.fromMap(Map<String, dynamic> map) :
    id = map['id'],
    product = ProductModel.fromMap(map['product']),
    quantity = map['quantity'];

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