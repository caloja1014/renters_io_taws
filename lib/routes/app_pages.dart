// ignore_for_file: prefer_const_constructors

import 'package:get/get.dart';
import 'package:renters_io_taws/pages/active_transactions/active_transactions.dart';
import 'package:renters_io_taws/pages/active_transactions/active_transactions_binding.dart';
import 'package:renters_io_taws/pages/add_product/add_product.dart';
import 'package:renters_io_taws/pages/add_product/add_product_binding.dart';
import 'package:renters_io_taws/pages/home/home.dart';
import 'package:renters_io_taws/pages/home/home_binding.dart';
import 'package:renters_io_taws/pages/list_transactions/list_transactions.dart';
import 'package:renters_io_taws/pages/list_transactions/list_transactions_binding.dart';
import 'package:renters_io_taws/pages/stock/stock.dart';
import 'package:renters_io_taws/pages/stock/stock_binding.dart';
import 'package:renters_io_taws/pages/transaction/transaction.dart';
import 'package:renters_io_taws/pages/transaction/transaction_binding.dart';
import 'package:renters_io_taws/pages/transaction_confirmation/transaction_confirmation.dart';
import 'package:renters_io_taws/pages/transaction_confirmation/transaction_confirmation_binding.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();


  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => Home(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.STOCK,
      page: () => Stock(),
      binding: StockBinding(),
    ),
    GetPage(
      name: _Paths.ADD_PRODUCT,
      page: () => AddProduct(),
      binding: AddProductBinding(),
    ),
    GetPage(
      name: _Paths.TRANSACTION,
      page: () => Transaction(),
      binding: TransactionBinding(),
    ),
    // GetPage(
    //   name: _Paths.ADD_TRANSACTION,
    //   page: () => AddProduct(),
    //   binding: AddTransactionBinding(),
    // ),
    GetPage(
      name: _Paths.TRANSACTION_CONFIRMATION,
      page: () => TransactionConfirmation(),
      binding: TransactionConfirmationBinding(),
    ),
    GetPage(
      name: _Paths.ACTIVE_TRANSACTIONS,
      page: () => ActiveTransactions(),
      binding: ActiveTransactionsBinding(),
    ),
    GetPage(
      name: _Paths.LIST_TRANSACTIONS,
      page: () => ListTransactions(),
      binding: ListTransactionsBindings(),
    )
  ];
}
