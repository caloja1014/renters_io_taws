import 'package:get/get.dart';
import 'package:renters_io_taws/components/search_bar.dart';
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
  final SearchController searchController = Get.put(SearchController());
  final List<Category> categoryList = Category.values.toList();
  List<Category> activeCategories = [];

  List<Category> get getCategoryList => categoryList;

  Future<void> _refreshProducts() async {
    products.value = await sqliteService.getProductsFromEntrepreneurship(entreController.getEntrepreneurshipId());
    entreController.entrerPreneurSelected.listen((event) async {
      products.value = await sqliteService.getProductsFromEntrepreneurship(entreController.getEntrepreneurshipId());
    });
  }

  void search(String query) async {
    if (query.isEmpty) {
      // If the query is empty, show all products
      await _refreshProducts();
    } else {
      // If the query is not empty, filter the products list based on the query
      products.value = products.where((product) {
        return product.name.toLowerCase().contains(query.toLowerCase());
      }).toList();
    }
  }

  void filter(Category category) async {
    if (activeCategories.contains(category)) {
      activeCategories.remove(category);
    } else {
      activeCategories.add(category);
    }

    if (activeCategories.isEmpty) {
      await _refreshProducts();
    } else {
      products.value = products.where((product) {
        return activeCategories.contains(product.category);
      }).toList();
    }
  }

  @override
  void onInit() {
    super.onInit();
    _refreshProducts();
    update();
  }

  void addProduct(String id, String idEntrepreneurship, String name, Category category, int quantity,
      double price, double infractionCost, String imageRoute) async {
    final product = ProductModel(
        id: id,
        idEntrepreneurship: idEntrepreneurship,
        name: name,
        category: category,
        quantity: quantity,
        price: price,
        infractionCost: infractionCost,
        imageRoute: imageRoute);
    await sqliteService.createProduct(product);
    await _refreshProducts();
  }
}
