import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renters_io_taws/layout/layout_scaffold.dart';

import 'package:renters_io_taws/components/search_bar.dart';
import 'package:renters_io_taws/components/filter.dart';
import 'package:renters_io_taws/components/product.dart' as productView;
import 'package:renters_io_taws/components/button.dart' as button;
import 'package:renters_io_taws/components/filter_button.dart' as filter_button;

import 'package:renters_io_taws/models/product_model.dart';
import 'package:renters_io_taws/models/stock_model.dart';
import 'package:renters_io_taws/models/category_enum.dart';
import 'package:renters_io_taws/pages/stock/stock_controller.dart';
import 'package:renters_io_taws/routes/app_pages.dart';

class Stock extends GetView<StockController> {
  Stock({super.key});

  @override
  Widget build(BuildContext context) {
    List<Category> categoryList = controller.categoryList;
    
    return LayoutScaffold(
      body: Obx(
      () => Container(
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
            Expanded(
              child: ListView(
                children: controller.products.map((product) => productView.Product(
                  id: product.id,
                  name: product.name,
                  category: product.category,
                  price: product.price,
                  availableAmount: product.quantity,
                  imageRoute: product.imageRoute,
                )).toList(),
              ),
            ),
            const SizedBox(height: 20.0),
            button.Button(
              text: 'Agregar producto',
              onPressed: () {
                Get.toNamed(Routes.ADD_PRODUCT);
              },
            ),
            const SizedBox(height: 20.0)
          ],
        ),
      ),
    ));
  }
}