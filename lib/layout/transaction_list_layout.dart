import 'package:flutter/material.dart';
import 'package:renters_io_taws/models/product_model.dart';

class TransactionListLayout extends StatelessWidget {
  final List<ProductModel> transactionProducts;

  const TransactionListLayout({Key? key, required this.transactionProducts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double totalAmount = 0;

    return SizedBox(
      height: 200,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.tertiary,
          border: Border.all(
            color: Theme.of(context).colorScheme.outline,
            width: 2.0,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: Expanded(
                child: SingleChildScrollView(
                  child: DataTable(
                    headingRowHeight: 40,
                    columnSpacing: 20,
                    columns: [
                      DataColumn(
                          label: Text('Nombre',
                              style: Theme.of(context).textTheme.titleMedium)),
                      DataColumn(
                          label: Text('P.uni',
                              style: Theme.of(context).textTheme.titleMedium)),
                      DataColumn(
                          label: Text('Total',
                              style: Theme.of(context).textTheme.titleMedium)),
                      DataColumn(
                          label: Text('Cant.',
                              style: Theme.of(context).textTheme.titleMedium)),
                    ],
                    rows: transactionProducts.map((product) {
                      final total = product.price * product.quantity;
                      totalAmount += total;

                      return DataRow(cells: [
                        DataCell(Text(product.name)),
                        DataCell(Text(product.price.toString())),
                        DataCell(Text(total.toString())),
                        DataCell(Text(product.quantity.toString())),
                      ]);
                    }).toList(),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
              child: Center(
                child: Text('Total amount: $totalAmount'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}