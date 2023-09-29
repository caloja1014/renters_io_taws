import 'package:get/get.dart';
import 'package:renters_io_taws/data/sqlite_service.dart';
import 'package:renters_io_taws/models/category_enum.dart';
import 'package:renters_io_taws/models/product_model.dart';
import 'package:sqflite/sqflite.dart';

import 'package:uuid/uuid.dart';

var uuid = const Uuid();

class StockController extends GetxController {
  late final SqliteService sqliteService;
  RxList<ProductModel> products = RxList<ProductModel>([]);

  Future<void> _refreshProducts() async {
    final List<ProductModel> _products = await sqliteService.getProducts();
    products.value = _products;
  }

  @override
  void onInit() {
    super.onInit();
    sqliteService = SqliteService();
    sqliteService.initializeDB().whenComplete(() async {
      addProduct(uuid.v1(), "Abrazadera para manguera de 3/4 pulgadas", Category.metal, 50, 0.45, 0.10, 'assets/images/abrazadera.png');
      addProduct(uuid.v1(), "Abrazadera para manguera de 1/2 pulgada", Category.metal, 100, 0.25, 0.05, 'assets/images/abrazadera.png');
      await _refreshProducts();
      update();
    });
  }

  void addProduct(String id, String name, Category category, int quantity, double price, double infractionCost, String imageRoute) async {
    final product = ProductModel(id: id, name: name, category: category, quantity: quantity, price: price, infractionCost: infractionCost, imageRoute: imageRoute);
    await sqliteService.createProduct(product);
  }
}
