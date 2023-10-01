import 'package:get/get.dart';
import 'package:renters_io_taws/pages/transaction_confirmation/transaction_confirmation_controller.dart';

class TransactionConfirmationBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<TransactionConfirmationController>(TransactionConfirmationController());
  }
}