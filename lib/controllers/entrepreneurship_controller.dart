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
        name: 'Ferretería La Cumbre',
        listInactiveTransactions: [],
        listProducts: [],
        listActiveTransactions: []
        )
      );
    listEntre.add(EntrepreneurshipModel(
        id: '2',
        name: 'Electrónica Juanito',
        listInactiveTransactions: [],
        listProducts: [],
        listActiveTransactions: []
        )
      );
    setDefaultEntrepreneurship();
  }

  void setDefaultEntrepreneurship() {
    entrerPreneurSelected.value = listEntre[0];
  }

  String getEntrepreneurshipId() {
    return entrerPreneurSelected.value!.id;
  }
}
