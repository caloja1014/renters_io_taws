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
    final screenWidth = MediaQuery.of(context).size.width;
    final columnCount = (screenWidth / 150).floor();

    final stockController = Get.find<StockController>();

    return Obx(
      () => SizedBox(
            height: 300.0,
            child: GridView.count(
              crossAxisCount: columnCount,
              children: stockController.products.map((product) => 
                AddProductComponent(
                  id: product.id,
                  name: product.name,
                  imageRoute: product.imageRoute,
                  price: product.price,   
                  product: product, 
                )
              ).toList(),
            ),
      ),
    );
  }
}