import 'package:get/get.dart';
import 'package:renters_io_taws/pages/add_product/add_product_controller.dart';
import 'package:renters_io_taws/pages/stock/stock_controller.dart';

class StockBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StockController>(
      () => StockController(),
    );
  }
}
