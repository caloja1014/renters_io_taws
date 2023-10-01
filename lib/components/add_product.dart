import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renters_io_taws/controllers/entrepreneurship_controller.dart';
import 'package:renters_io_taws/models/product_model.dart';
import 'package:renters_io_taws/pages/transaction/transaction_controller.dart';

class AddProductControllerTransaction extends GetxController {
  int quantity;
  final ProductModel product;

  TransactionController transactionController = Get.find<TransactionController>();

  AddProductControllerTransaction(
    this.quantity,
    this.product,
  );

  void increment() {
    quantity++;
    addProduct();
    update();
  }

  void decrement() {
    if (quantity > 0) {
      quantity--;
      addProduct();
      update();
    }
  }

  void addProduct() {
    if (quantity > 0) {
      transactionController.addProduct(
        ProductModel(
          id: product.id,
          idEntrepreneurship: Get.find<EntrepreneurshipController>().getEntrepreneurshipId(),
          name: product.name,
          category: product.category,
          quantity: quantity,
          price: product.price,
          infractionCost: product.infractionCost,
          imageRoute: product.imageRoute,
        ),
      );
    }
  }
}

class AddProductComponent extends StatelessWidget {
  final String id;
  final String name;
  final String imageRoute;
  final double price;
  final ProductModel product;

  AddProductComponent({
    required this.id,
    required this.name,
    required this.imageRoute,
    required this.price,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddProductControllerTransaction>(
      tag: id,
      init: AddProductControllerTransaction(0, product),
      builder: (controller) => Center(
      child: Container(
        width: 150.0,
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.tertiary,
          borderRadius: BorderRadius.circular(5.0),
          border: Border.all(
            color: Theme.of(context).colorScheme.outline,
            width: 2.0,
          ),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 10.0,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Theme.of(context).colorScheme.outline,
                  width: 2.0,
                ),
              ),
              child: Image.file(
              File(imageRoute),
              fit: BoxFit.cover,
              height: 100.0,
            )),
            Row(
              children: [
                Column(
                  children: [
                    Container(
                      width: 60.0,
                      child: Text(
                        name,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onBackground,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Lato',
                        ),
                      ),
                    ),
                    Text(
                      '\$ ${price.toStringAsFixed(2)}',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onBackground,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Lato',
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        controller.decrement();
                      },
                      child: const Icon(
                        Icons.remove,
                        size: 20.0,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // _showAmountDialog(context);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          controller.quantity.toString(),
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onBackground,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Lato',
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        controller.increment();
                      },
                      child: const Icon(
                        Icons.add,
                        size: 20.0,
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      )
    )
    );
  }
}