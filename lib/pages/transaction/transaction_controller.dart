import 'package:get/get.dart';
import 'package:renters_io_taws/models/product_model.dart';


class TransactionController extends GetxController{
  List<ProductModel> products = [];

  void addProduct(ProductModel product) {
    int index = products.indexWhere((p) => p.id == product.id);

    if (product.quantity == 0) {
      products.removeAt(index);
      update();
      return;
    }

    if (index != -1) {
      products[index] = product;
    } else {
      products.add(product);
    }
    update();
  }
}