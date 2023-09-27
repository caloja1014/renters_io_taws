import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:renters_io_taws/layout/layout_scaffold.dart';
import 'package:renters_io_taws/layout/input_grid.dart' as input_grid;
import 'package:renters_io_taws/components/button.dart' as button;
import 'package:renters_io_taws/components/image_picker.dart' as image_picker;
import 'package:renters_io_taws/components/new_product_amount.dart'
    as new_product_amount;
import 'package:renters_io_taws/components/field.dart' as field;
import 'package:renters_io_taws/components/input.dart' as input;
import 'package:renters_io_taws/components/combo_box.dart' as combo_box;
import 'package:renters_io_taws/pages/add_product/add_product_controller.dart';

class AddProduct extends GetView<AddProductController> {
  const AddProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutScaffold(body: Content());
  }
}

class Content extends StatelessWidget {
  Content({super.key});

  List<Widget> get childrenLeft => [
        const field.TitleWidget(title: 'Nombre'),
        const field.TitleWidget(title: 'Categoría'),
        const field.TitleWidget(title: 'Precio de alquiler'),
        const field.TitleWidget(title: 'Costo de infracción'),
      ];

  List<Widget> get childrenRight => [
        const input.CustomInput(placeholder: 'Nombre'),
        const combo_box.CustomComboBox(labelText: 'Seleccionar'),
        const input.CustomInput(placeholder: 'Alquiler', isPrice: true),
        const input.CustomInput(placeholder: 'Infracción', isPrice: true),
      ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
      ),
      child: Column(
        children: [
          const Row(children: [
            image_picker.ImagePickerWidget(),
            SizedBox(width: 20.0),
            new_product_amount.AvailableAmountWidget(),
          ]),
          const SizedBox(height: 20.0),
          input_grid.InputGrid(
            childrenLeft: childrenLeft,
            childrenRight: childrenRight,
          ),
          const SizedBox(height: 20.0),
          button.Button(text: 'Crear producto', onPressed: () {})
        ],
      ),
    );
  }
}
