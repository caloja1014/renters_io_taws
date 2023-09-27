import 'package:get/get.dart';
import 'package:renters_io_taws/pages/add_transaction/add_transaction_controller.dart';


class AddTransactionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddTransactionController>(
      () => AddTransactionController(),
    );
  }
}
