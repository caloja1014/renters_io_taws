import 'package:renters_io_taws/models/product_model.dart';

import 'rented_stock_model.dart';
import './transaction_model.dart';

class EntrepreneurshipModel {
  String id;
  String name;
  List<ProductModel> listProducts;
  List<TransactionModel> listActiveTransactions;
  List<TransactionModel> listInactiveTransactions;

  EntrepreneurshipModel({
    required this.name, 
    required this.id,
    required this.listProducts,
    required this.listActiveTransactions,
    required this.listInactiveTransactions,
  });
}