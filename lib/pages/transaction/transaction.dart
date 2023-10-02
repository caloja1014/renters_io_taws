import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renters_io_taws/layout/add_products_layout.dart';
import 'package:renters_io_taws/layout/layout_scaffold.dart';

import 'package:renters_io_taws/components/search_bar.dart';
import 'package:renters_io_taws/components/filter.dart';
import 'package:renters_io_taws/components/product.dart' as product;
import 'package:renters_io_taws/components/button.dart' as button;
import 'package:renters_io_taws/components/filter_button.dart' as filter_button;
import 'package:renters_io_taws/components/add_product.dart';

import 'package:renters_io_taws/models/product_model.dart';
import 'package:renters_io_taws/models/rented_stock_model.dart';
import 'package:renters_io_taws/models/category_enum.dart';
import 'package:renters_io_taws/pages/stock/stock_controller.dart';
import 'package:renters_io_taws/pages/transaction/transaction_controller.dart';
import 'package:renters_io_taws/routes/app_pages.dart';

class Transaction extends GetView<TransactionController> {
  Transaction({super.key});

  List<Category> categoryList = Category.values.toList();

  @override
  Widget build(BuildContext context) {
    return LayoutScaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
        ),
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const CustomSearchWidget(),
            const SizedBox(height: 20.0),
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: [
                const filter_button.FilterButton(text: 'Personalizar'),
                CustomFilterWidget(text: 'Plástico', category: categoryList[0]),
                CustomFilterWidget(text: 'Iluminación', category: categoryList[1]),
                CustomFilterWidget(text: 'Tornillos', category: categoryList[2]),
                CustomFilterWidget(text: 'Metal', category: categoryList[3]),
                CustomFilterWidget(text: 'Madera', category: categoryList[4]),
              ],
            ),
            const SizedBox(height: 20.0),
            AddProductsLayout(),
            const SizedBox(height: 20.0),
            button.Button(
              text: 'Continuar',
              onPressed: () {
                Get.toNamed(Routes.TRANSACTION_CONFIRMATION, arguments: controller.products);
              },
            ),
            const SizedBox(height: 20.0)
          ],
        ),
          ),
      );
  }
}
