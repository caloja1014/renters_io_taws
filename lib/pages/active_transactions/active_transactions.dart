import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renters_io_taws/layout/layout_scaffold.dart';
import 'package:renters_io_taws/pages/active_transactions/active_transactions_controller.dart';

class ActiveTransactions extends GetView<ActiveTransactionsController> {
  const ActiveTransactions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutScaffold(
      body: Text('Hola'),
    );
  }
}