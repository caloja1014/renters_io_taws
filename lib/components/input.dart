import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomInputController extends GetxController {
  final textController = TextEditingController().obs;
  
  String get text => textController.value.text;

  @override
  void onClose() {
    textController.value.dispose();
    super.onClose();
  }
}

class CustomInputWidget extends StatelessWidget {
  final String placeholder;
  final bool isPrice;

  CustomInputWidget({super.key, required this.placeholder, this.isPrice = false});

   @override
  Widget build(BuildContext context) {
    final controller = Get.put(
      CustomInputController(),
      tag: placeholder,
    );

    return Obx(
      () => Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        width: 200.0,
        height: 50.0,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          border: Border.all(
            color: Theme.of(context).colorScheme.outline,
            width: 2.0,
          ),
        ),
        child: Row(
          children: [
            if (isPrice)
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Icon(Icons.attach_money),
              ),
            Expanded(
              child: TextFormField(
                controller: controller.textController.value,
                keyboardType: isPrice ? TextInputType.number : TextInputType.text,
                decoration: InputDecoration(
                  hintText: placeholder,
                  border: InputBorder.none,
                ),
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}