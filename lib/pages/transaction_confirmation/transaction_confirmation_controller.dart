import 'package:get/get.dart';
import 'package:renters_io_taws/models/product_model.dart';

class TransactionConfirmationController extends GetxController {
  late List<ProductModel> transactionProducts;

  @override
  void onInit() {
    transactionProducts = Get.arguments as List<ProductModel>;
    super.onInit();
  }
}