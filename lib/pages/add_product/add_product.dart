import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renters_io_taws/controllers/entrepreneurship_controller.dart';
import 'package:renters_io_taws/routes/app_pages.dart';
import 'package:uuid/uuid.dart';

import 'package:renters_io_taws/layout/layout_scaffold.dart';
import 'package:renters_io_taws/layout/input_grid.dart' as input_grid;
import 'package:renters_io_taws/components/button.dart' as button;
import 'package:renters_io_taws/components/image_picker.dart';
import 'package:renters_io_taws/components/new_product_amount.dart';
import 'package:renters_io_taws/components/field.dart' as field;
import 'package:renters_io_taws/components/input.dart';
import 'package:renters_io_taws/components/combo_box.dart';
import 'package:renters_io_taws/models/category_enum.dart';
import 'package:renters_io_taws/pages/add_product/add_product_controller.dart';

var uuid = const Uuid();
class AddProduct extends GetView<AddProductController> {
  AddProduct({super.key});

  List<Widget> get childrenLeft => [
        const field.TitleWidget(title: 'Nombre'),
        const field.TitleWidget(title: 'Categoría'),
        const field.TitleWidget(title: 'Precio de alquiler'),
        const field.TitleWidget(title: 'Costo de infracción'),
      ];

  List<Widget> get childrenRight => [
        CustomInputWidget(placeholder: 'Nombre'),
        CustomComboBox<Category>(labelText: 'Seleccionar', options: Category.values,),
        CustomInputWidget(placeholder: 'Alquiler', isPrice: true),
        CustomInputWidget(placeholder: 'Infracción', isPrice: true),
      ];

  @override
  Widget build(BuildContext context) {
    return LayoutScaffold(
      body: Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
      ),
      child: Column(
        children: [
          Row(children: [
            ImagePickerWidget(),
            const SizedBox(width: 20.0),
            AvailableAmountWidget(),
          ]),
          const SizedBox(height: 20.0),
          input_grid.InputGrid(
            childrenLeft: childrenLeft,
            childrenRight: childrenRight,
          ),
          const SizedBox(height: 20.0),
          button.Button(text: 'Crear producto', onPressed: () {
            controller.addProduct(
              uuid.v1(), // product id 
              Get.find<EntrepreneurshipController>().getEntrepreneurshipId(), // entrepreneurship id
              Get.find<CustomInputController>(tag: (childrenRight[0] as CustomInputWidget).placeholder).text, // name
              Get.find<CustomComboBoxController<Category>>(tag: (childrenRight[1] as CustomComboBox<Category>).labelText).text!, // category
              Get.find<AvailableAmountWidgetController>(tag: 'availableAmount').text, // quantity
              double.parse(Get.find<CustomInputController>(tag: (childrenRight[2] as CustomInputWidget).placeholder).text), // price
              double.parse(Get.find<CustomInputController>(tag: (childrenRight[3] as CustomInputWidget).placeholder).text), // infractionCost
              Get.find<ImagePickerController>().imageFilePath, // imageRoute
            );

            Get.toNamed(Routes.STOCK);
          })
        ],
      ),
    )
    );
  }
}