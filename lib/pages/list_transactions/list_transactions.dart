import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renters_io_taws/layout/layout_scaffold.dart';
import 'package:renters_io_taws/models/transaction_model.dart';
import 'package:renters_io_taws/pages/list_transactions/list_transactions_controller.dart';

class ListTransactions extends GetView<ListTransactionsController> {
  const ListTransactions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<TransactionModel> transactionsList = controller.transactions;

    print(transactionsList);

    return LayoutScaffold(
      body: Text('Hola'),
    );
  }
}