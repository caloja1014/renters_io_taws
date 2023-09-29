import 'package:get/get.dart';
import 'package:renters_io_taws/data/sqlite_service.dart';
import 'package:renters_io_taws/models/product_model.dart';
import 'package:sqflite/sqflite.dart';


class StockController extends GetxController{
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
      await _refreshProducts();
      update();
    });
  }
}