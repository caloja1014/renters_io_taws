import 'package:get/get.dart';
import 'package:renters_io_taws/data/sqlite_service.dart';
import 'package:renters_io_taws/models/product_model.dart';
import 'package:renters_io_taws/models/transaction_model.dart';

class TransactionConfirmationController extends GetxController {
  late List<ProductModel> transactionProducts;

  final sqliteService = SqliteService();

  @override
  void onInit() {
    transactionProducts = Get.arguments as List<ProductModel>;
    super.onInit();
  }

  void addTransaction(TransactionModel transaction) async {
    await sqliteService.addTransaction(transaction);
  }
}