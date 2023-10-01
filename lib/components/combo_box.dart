import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomComboBoxController<T extends dynamic> extends GetxController {
  final selectedOption = Rx<T?>(null);

  T? get text => selectedOption.value;

  void setSelectedOption(T? newValue) {
    selectedOption.value = newValue;
  }
}

class CustomComboBox<T extends dynamic> extends StatelessWidget {
  final String labelText;
  final List<T> options;

  const CustomComboBox({
    Key? key,
    required this.labelText,
    required this.options,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CustomComboBoxController<T> controller = Get.put(
      CustomComboBoxController<T>(),
      tag: labelText  
    );

    return Obx(
      () => Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context).colorScheme.outline,
            width: 2.0,
          ),
          color: Theme.of(context).colorScheme.surface,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: DropdownButton<T>(
            isExpanded: true,
            value: controller.selectedOption.value,
            hint: Text(labelText),
            onChanged: (T? newValue) {
              controller.setSelectedOption(newValue);
            },
            items: options.map<DropdownMenuItem<T>>((T value) {
              return DropdownMenuItem<T>(
                value: value,
                child: Text(value.toString().split('.').last),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}