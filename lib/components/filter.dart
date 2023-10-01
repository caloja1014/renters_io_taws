import 'package:flutter/material.dart';
import 'package:renters_io_taws/models/category_enum.dart';
import 'package:get/get.dart';
import 'package:renters_io_taws/pages/stock/stock_controller.dart';

class FilterController extends GetxController {
  final Category category;
  bool _isTapped = false;

  bool get isTapped => _isTapped;

  void handleTap() {
    _isTapped = !_isTapped;

    StockController stockController = Get.find<StockController>();

    stockController.filter(category);

    update();
  }

  FilterController({required this.category});
}
class CustomFilterWidget extends StatelessWidget {
  const CustomFilterWidget({
    Key? key,
    required this.text,
    required this.category,
  }) : super(key: key);

  final Category category;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FilterController>(
      tag: category.toString(),
      init: FilterController(category: category),
      builder: (controller) => GestureDetector(
          onTap: controller.handleTap,
          child: FittedBox(
            fit: BoxFit.fitWidth,
            child: Container(
              decoration: BoxDecoration(
                color: controller.isTapped ? Theme.of(context).colorScheme.onBackground : Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(
                  color: Colors.black,
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
              child: Text(
                text,
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: controller._isTapped ? Colors.white : Colors.black,
              ),
              ),
            ),
          ),
    ));
  }
}
