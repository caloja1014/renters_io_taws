import 'package:get/get.dart';
import 'package:renters_io_taws/models/category_enum.dart';
import 'package:renters_io_taws/models/entrepreneurship_model.dart';
import 'package:renters_io_taws/models/product_model.dart';
import 'package:renters_io_taws/models/stock_model.dart';

class EntrepreneurshipController extends GetxController {
  final listEntre = RxList<EntrepreneurshipModel>.empty(growable: true);
  final entrerPreneurSelected = Rxn<EntrepreneurshipModel>();

  @override
  void onInit() {
    super.onInit();
    listEntre.add(EntrepreneurshipModel(
        id: '1',
        name: 'Emprendimiento 1',
        listInactiveTransactions: [],
        listStock: [
          StockModel(
            product: ProductModel(
                id: "1",
                name: "Prueba 1",
                category: Category.metal,
                quantity: 2,
                price: 123,
                infractionCost: 2),
            quantity: 2,
            id: "1",
          )
        ],
        listActiveTransactions: []));
    listEntre.add(EntrepreneurshipModel(
        id: '2',
        name: 'Emprendimiento 2',
        listInactiveTransactions: [],
        listStock: [
          StockModel(
            product: ProductModel(
                id: "2",
                name: "Prueba 2",
                category: Category.metal,
                quantity: 2,
                price: 123,
                infractionCost: 2),
            quantity: 2,
            id: "2",
          ),
          StockModel(
            product: ProductModel(
                id: "3",
                name: "Prueba 3",
                category: Category.metal,
                quantity: 2,
                price: 123,
                infractionCost: 2),
            quantity: 2,
            id: "3",
          )
        ],
        listActiveTransactions: []));
  }
}
