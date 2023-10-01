import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AvailableAmountWidgetController extends GetxController {
  final amount = Rx<int>(0);

  int get text => amount.value;

  void setAmount(int newValue) {
    amount.value = newValue;
  }

  void incrementAmount() {
    amount.value++;
  }

  void decrementAmount() {
    if (amount.value > 0) amount.value--;
  }
}

class AvailableAmountWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AvailableAmountWidgetController controller = Get.put(
      AvailableAmountWidgetController(),
      tag: 'availableAmount',
    );

    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
                  'Cantidad disponible',
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onBackground,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Poppins'),
                ),
          const SizedBox(height: 8.0),
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(
                color: Theme.of(context).colorScheme.outline,
                width: 2.0,
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    controller.decrementAmount();
                  },
                  child: const Icon(
                    Icons.remove,
                    size: 40.0,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _showAmountDialog(context);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    width: 60.0,
                    child: Text(
                      '${controller.amount.value}',
                      style: Theme.of(context).textTheme.labelLarge,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    controller.incrementAmount();
                  },
                  child: const Icon(
                    Icons.add,
                    size: 40.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showAmountDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Cantidad disponible',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          content: TextField(
            keyboardType: TextInputType.number,
            onChanged: (value) {
              Get.find<AvailableAmountWidgetController>(
                      tag: 'availableAmount')
                  .setAmount(int.parse(value));
            },
            decoration: const InputDecoration(
              hintText: 'Ingresa la cantidad disponible',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Guardar'),
            ),
          ],
        );
      },
    );
  }
}
