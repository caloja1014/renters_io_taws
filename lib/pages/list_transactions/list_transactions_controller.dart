import 'package:get/get.dart';
import 'package:renters_io_taws/controllers/entrepreneurship_controller.dart';
import 'package:renters_io_taws/data/sqlite_service.dart';
import 'package:renters_io_taws/models/transaction_model.dart';

class ListTransactionsController extends GetxController {
  final entreController = Get.find<EntrepreneurshipController>();
  final SqliteService sqliteService = SqliteService();

  RxList<TransactionModel> transactions = RxList<TransactionModel>([]);

  Future<void> refreshTransactions() async {
    String entrepreneurshipId = entreController.getEntrepreneurshipId();
    transactions.value = await sqliteService.getTransactionsFromEntrepreneurship(entrepreneurshipId);
    entreController.entrerPreneurSelected.listen((event) async {
      transactions.value = await sqliteService.getTransactionsFromEntrepreneurship(entrepreneurshipId);
    });
  }

  @override
  void onInit() async {
    super.onInit();
    await refreshTransactions();
    update();
  }
}