import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renters_io_taws/models/product_model.dart';

class AddProductController extends GetxController {
  final String id;
  int quantity;

  AddProductController({
    required this.id,
    required this.quantity 
  });

}

class AddProductComponent extends StatelessWidget {
  final String name;
  final String imageRoute;
  final double price;

  AddProductComponent({
    required this.name,
    required this.imageRoute,
    required this.price
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AddProductController>();
    return Center(
      child: Column(
        children: [
          Image.asset(
            imageRoute,
            fit: BoxFit.cover,
          ),
          Row(
            children: [
              Column(
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onBackground,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Lato',
                    ),
                  ),
                  Text(
                    price.toString(),
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onBackground,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Lato',
                    ),
                  ),
                ],
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
    );
  }
}