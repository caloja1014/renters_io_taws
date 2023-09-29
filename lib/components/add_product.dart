import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renters_io_taws/models/product_model.dart';

class AddProductController extends GetxController {
  final String id;
  final String name;
  final String imageRoute;
  final double price;
  int quantity;

  AddProductController({
    required this.id,
    required this.name, 
    required this.imageRoute,
    required this.price, 
    required this.quantity 
  });

}

class AddProductComponent extends GetView<AddProductController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() => 
    Center(
      child: Container(
        child: Column(
          children: [
            Image.asset(
              controller.imageRoute,
              fit: BoxFit.cover,
            ),
            Row(
              children: [
                Text(
                  controller.name,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Lato',
                  ),
                ),
                Text(
                  controller.price.toString(),
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Lato',
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {

                      },
                      child: const Icon(
                        Icons.remove,
                        size: 15.0,
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
                      },
                      child: const Icon(
                        Icons.add,
                        size: 15.0,
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        )
      )
    ));
  }
}