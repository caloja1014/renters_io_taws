import 'package:get/get.dart';
import 'package:renters_io_taws/pages/active_transactions/active_transactions_controller.dart';

class ActiveTransactionsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ActiveTransactionsController>(
      () => ActiveTransactionsController(),
    );
  }
}