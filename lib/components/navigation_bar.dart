import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renters_io_taws/controllers/bottom_bar_controller.dart';
import 'package:renters_io_taws/routes/app_pages.dart';

class NavigationBar extends StatelessWidget {
  NavigationBar({
    super.key,
    this.transactionButtonLocation = FloatingActionButtonLocation.endDocked,
    this.shape = const CircularNotchedRectangle(),
  });

  final FloatingActionButtonLocation transactionButtonLocation;
  final NotchedShape? shape;
  final bottomController = Get.find<BottomController>();
  static final List<FloatingActionButtonLocation> centerLocations =
      <FloatingActionButtonLocation>[
    FloatingActionButtonLocation.centerDocked,
    FloatingActionButtonLocation.centerFloat,
  ];

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: shape,
      color: Color.fromARGB(255, 1, 69, 124),
      child: IconTheme(
        data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            // if (centerLocations.contains(transactionButtonLocation))
            //  const Spacer(),
            IconButton(
              iconSize: 30,
              tooltip: 'Inventario',
              icon: const Icon(Icons.inventory),
              onPressed: () {
                Get.toNamed(Routes.STOCK);
              },
            ),

            IconButton(
                onPressed: () {
                  Get.toNamed(Routes.HOME);
                },
                icon: const Icon(
                  Icons.home,
                  size: 30,
                )),
            IconButton(
              iconSize: 30,
              tooltip: 'Transacciones',
              icon: const Icon(Icons.shopping_cart),
              onPressed: () {
                Get.toNamed(Routes.TRANSACTION);
              },
            ),
          ],
        ),
      ),
    );
  }
}
