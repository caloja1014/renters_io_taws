import 'package:get/get.dart';
import 'package:renters_io_taws/data/sqlite_service.dart';
import 'package:renters_io_taws/models/category_enum.dart';
import 'package:renters_io_taws/models/product_model.dart';
import 'package:renters_io_taws/pages/stock/stock_controller.dart';


class AddProductController extends GetxController{
  final sqliteService = SqliteService();

  final StockController stockController = Get.find<StockController>();
  
  @override
  void onInit() {
    super.onInit();
    update();
  }

  void addProduct(String id, String idEntrepreneurship, String name, Category category, int quantity,
      double price, double infractionCost, String imageRoute) async {
    stockController.addProduct(id, idEntrepreneurship, name, category, quantity, price, infractionCost, imageRoute);    
  }
}