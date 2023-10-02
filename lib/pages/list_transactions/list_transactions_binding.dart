import 'package:get/get.dart';
import 'package:renters_io_taws/pages/list_transactions/list_transactions_controller.dart';

class ListTransactionsBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListTransactionsController>(
      () => ListTransactionsController(),
    );
  }
}