import 'package:get/get.dart';
import 'package:renters_io_taws/components/search_bar.dart';
import 'package:renters_io_taws/pages/add_product/add_product_controller.dart';
import 'package:renters_io_taws/pages/stock/stock_controller.dart';
import 'package:renters_io_taws/pages/transaction/transaction_controller.dart';

class TransactionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TransactionController>(
      () => TransactionController(),
    );
    Get.put<StockController>(
      StockController(),
    );
    Get.lazyPut<SearchController>(
      () => SearchController(),
    );
  }
}
