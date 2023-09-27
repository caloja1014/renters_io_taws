import 'package:flutter/material.dart';
import 'package:renters_io_taws/layout/layout_scaffold.dart';

import 'package:renters_io_taws/components/search_bar.dart' as search_bar;
import 'package:renters_io_taws/components/filter.dart' as filter;
import 'package:renters_io_taws/components/product.dart' as product;
import 'package:renters_io_taws/components/button.dart' as button;
import 'package:renters_io_taws/components/filter_button.dart' as filter_button;

import 'package:renters_io_taws/models/product_model.dart';
import 'package:renters_io_taws/models/stock_model.dart';
import 'package:renters_io_taws/models/category_enum.dart';

class Transaction extends StatelessWidget {
  const Transaction({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutScaffold(
      body: Content(),
    );
  }
}

class Content extends StatelessWidget {
  final List<ProductModel> products;
  final List<StockModel> stock;

  Content({
    super.key,
  })  : products = ProductModel.getProducts(),
        stock = StockModel.buildStock(ProductModel.getProducts());

  List<Category> categoryList = Category.values.toList();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
      ),
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          const search_bar.Search(),
          const SizedBox(height: 20.0),
          Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            children: [
              const filter_button.FilterButton(text: 'Personalizar'),
              filter.Filter(text: 'Plástico', category: categoryList[0]),
              filter.Filter(text: 'Iluminación', category: categoryList[1]),
              filter.Filter(text: 'Tornillos', category: categoryList[2]),
              filter.Filter(text: 'Metal', category: categoryList[3]),
              filter.Filter(text: 'Madera', category: categoryList[4]),
            ],
          ),
          const SizedBox(height: 20.0),
          Expanded(
            child: ListView(
              children: stock
                  .map((stock) => product.Product(
                        id: stock.product.id,
                        name: stock.product.name,
                        category: stock.product.category,
                        price: stock.product.price,
                        availableAmount: -1,
                        imageRoute: stock.product.imageRoute,
                      ))
                  .toList(),
            ),
          ),
          const SizedBox(height: 20.0),
          button.Button(
            text: 'Continuar',
            onPressed: () {
              Navigator.pushNamed(context, '/add-transaction');
            },
          ),
          const SizedBox(height: 20.0)
        ],
      ),
    );
  }
}
