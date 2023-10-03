import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:renters_io_taws/layout/layout_scaffold.dart';
import 'package:renters_io_taws/pages/list_transactions/list_transactions_controller.dart';

class ListTransactions extends GetView<ListTransactionsController> {
  const ListTransactions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutScaffold(
      body: Obx(
        () => SingleChildScrollView(
          child: Column(
            children: controller.transactions.map((transaction) {
              final startDate = DateFormat('dd/MM/yyyy').format(transaction.startDate);
              final endDate = DateFormat('dd/MM/yyyy').format(transaction.endDate);

              return Container(
                margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.tertiary,
                  borderRadius: BorderRadius.circular(5.0),
                  border: Border.all(
                    color: Theme.of(context).colorScheme.outline,
                    width: 2.0,
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 13,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            transaction.clientName,
                            style: const TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                            'Alquiler: ${transaction.listStockRented.substring(0, transaction.listStockRented.length - 2)}',
                            style: const TextStyle(fontSize: 16.0),
                          ),
                          Text(
                            'Start Date: $startDate',
                            style: const TextStyle(fontSize: 16.0),
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                            'End Date: $endDate',
                            style: const TextStyle(fontSize: 16.0),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: IconButton(
                        icon: const Icon(Icons.call),
                        onPressed: () async {
                          final url = 'tel:${transaction.clientNumber}';
                          if (await canLaunchUrl(Uri.parse(url))) {
                            await launchUrl(Uri.parse(url));
                          }
                        },
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}