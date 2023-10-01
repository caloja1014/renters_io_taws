import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renters_io_taws/pages/stock/stock_controller.dart';

class SearchController extends GetxController {
  final textController = Rxn(TextEditingController());

  @override
  void onClose() {
    textController.value?.dispose();
    super.onClose();
  }

  @override
  void onInit() {
    textController.value?.addListener(() {
      final controller = Get.find<StockController>();
      controller.search(searchingText);
    });
    super.onInit();
  }

  String get searchingText => textController.value?.text ?? '';
}

class CustomSearchWidget extends StatelessWidget {
  const CustomSearchWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SearchController>();
    
    return Obx(
      () => Container(
        width: 335.0, // Adjust the width as needed
        height: 60, // Equal width and height for a squared search bar
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface, // Background color
          borderRadius: BorderRadius.circular(5.0), // Rounded corners
          border: Border.all(color: Colors.black), // Black border
        ),
        child: Center(
          child: TextField(
            controller: controller.textController.value,
            decoration: InputDecoration(
              border: InputBorder.none, // Remove border
              prefixIcon: Icon(
                Icons.search, // You can replace this with your desired icon
                color: Colors.black, // Icon color
              ),
              hintText: "Buscar", // Placeholder text
              hintStyle: Theme.of(context).textTheme.labelSmall,
            ),
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            )
          ),
        ),
      ),
    );
  }
}