import 'package:get/get.dart';
import 'package:renters_io_taws/controllers/entrepreneurship_controller.dart';
import 'package:renters_io_taws/data/sqlite_service.dart';
import 'package:renters_io_taws/models/category_enum.dart';
import 'package:renters_io_taws/models/product_model.dart';

import 'package:uuid/uuid.dart';

var uuid = const Uuid();

class StockController extends GetxController {
  final sqliteService = SqliteService();
  RxList<ProductModel> products = RxList<ProductModel>([]);
  final entreController = Get.find<EntrepreneurshipController>();
  Future<void> _refreshProducts() async {
    entreController.entrerPreneurSelected.listen((event) async {
      products.value =
          event == null ? [] : event.listStock.map((e) => e.product).toList();
    });
    // final List<ProductModel> _products = await sqliteService.getProducts();
    // products.value = _products;
  }

  @override
  void onInit() {
    super.onInit();
    _refreshProducts();
    update();
  }

  void addProduct(String id, String name, Category category, int quantity,
      double price, double infractionCost, String imageRoute) async {
    final product = ProductModel(
        id: id,
        name: name,
        category: category,
        quantity: quantity,
        price: price,
        infractionCost: infractionCost,
        imageRoute: imageRoute);
    await sqliteService.createProduct(product);
  }
}
