import 'package:get/get.dart';
import 'package:renters_io_taws/pages/add_product/add_product_controller.dart';
import 'package:renters_io_taws/pages/add_transaction/add_transaction_controller.dart';


class AddProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddProductController>(
      () => AddProductController(),
    );
  }
}
