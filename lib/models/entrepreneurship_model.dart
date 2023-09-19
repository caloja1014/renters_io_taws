import './stock_model.dart';
import './transaction_model.dart';

class EntrepreneurshipModel {
  String id;
  String name;
  List<StockModel> listStock;
  List<TransactionModel> listActiveTransactions;
  List<TransactionModel> listInactiveTransactions;

  EntrepreneurshipModel({
    required this.name, 
    required this.id,
    required this.listStock,
    required this.listActiveTransactions,
    required this.listInactiveTransactions,
  });
}