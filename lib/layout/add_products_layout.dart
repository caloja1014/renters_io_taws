import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renters_io_taws/components/add_product.dart';
import 'package:renters_io_taws/pages/stock/stock_controller.dart';

class AddProductsLayout extends StatelessWidget {
  AddProductsLayout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // final screenWidth = MediaQuery.of(context).size.width;
    // final columnCount = (screenWidth / 150).floor();

    return GetBuilder<StockController>(
      builder: (stockController) =>
        Container(
          height: 300.0,
          child: GridView.count(
            crossAxisCount: 2,
            children: stockController.products.map((product) => 
              GetBuilder<AddProductController>(
                id: product.id,
                init: AddProductController(
                  id: product.id,
                  quantity: 0,
                ),
                builder: (addProductController) => AddProductComponent(
                  name: product.name,
                  imageRoute: product.imageRoute,
                  price: product.price,
                )
              )
            ).toList(),
          ),
        )
    );
  }
}