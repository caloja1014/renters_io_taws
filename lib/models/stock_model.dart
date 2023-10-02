import './product_model.dart';

import 'package:uuid/uuid.dart';

var uuid = const Uuid();

class RentedStockModel {
  String id;
  ProductModel product;
  int quantity;

  RentedStockModel({
    required this.product,
    required this.quantity,
    required this.id,
  });
}