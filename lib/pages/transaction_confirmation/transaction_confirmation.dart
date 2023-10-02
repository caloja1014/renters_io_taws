import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:renters_io_taws/components/combo_box.dart';
import 'package:renters_io_taws/components/field.dart';
import 'package:renters_io_taws/components/input.dart';
import 'package:renters_io_taws/controllers/entrepreneurship_controller.dart';
import 'package:renters_io_taws/layout/input_grid.dart';
import 'package:renters_io_taws/layout/layout_scaffold.dart';
import 'package:renters_io_taws/models/charge_frequency_enum.dart';
import 'package:renters_io_taws/models/product_model.dart';
import 'package:renters_io_taws/models/transaction_model.dart';
import 'package:renters_io_taws/pages/transaction_confirmation/transaction_confirmation_controller.dart';
import 'package:renters_io_taws/components/button.dart' as custom_button;
import 'package:renters_io_taws/layout/transaction_list_layout.dart';
import 'package:renters_io_taws/routes/app_pages.dart';

import 'package:uuid/uuid.dart';

var uuid = const Uuid();

class TransactionConfirmation extends GetView<TransactionConfirmationController> {
  const TransactionConfirmation({super.key});

  List<Widget> get childrenLeft => [
    const TitleWidget(title: 'Fecha inicio'),
    const TitleWidget(title: 'Fecha fin'),
    const TitleWidget(title: 'Frecuencia de cobro'), 
    const TitleWidget(title: 'Cliente'),
    const TitleWidget(title: 'Número telf. del cliente'),
    const TitleWidget(title: 'Notas'),
  ];

  List<Widget> get childrenRight => [
    CustomInputWidget(placeholder: 'inicio dd-mm-aaaa'),
    CustomInputWidget(placeholder: 'fin dd-mm-aaaa'),
    const CustomComboBox<ChargeFrequency>(labelText: 'Seleccionar', options: ChargeFrequency.values,),
    CustomInputWidget(placeholder: 'Nombre del cliente'),
    CustomInputWidget(placeholder: 'Número telf. del cliente'),
    CustomInputWidget(placeholder: 'Notas'),
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
            InputGrid(
              childrenLeft: childrenLeft, 
              childrenRight: childrenRight
            ),
            TransactionListLayout(transactionProducts: controller.transactionProducts),
            const SizedBox(height: 20.0),
            custom_button.Button(
              text: 'Alquilar',
              onPressed: () async {
                await controller.sqliteService.updateProducts(controller.transactionProducts);

                TransactionModel newTransaction = TransactionModel(
                  id: uuid.v1(),
                  entrepreneushipId: Get.find<EntrepreneurshipController>().getEntrepreneurshipId(),
                  listStockRented: ProductModel.listToString(controller.transactionProducts),
                  startDate: DateFormat('dd/MM/yyy').parse(Get.find<CustomInputController>(tag: (childrenRight[0] as CustomInputWidget).placeholder).text) ,
                  endDate: DateFormat('dd/MM/yyy').parse(Get.find<CustomInputController>(tag: (childrenRight[1] as CustomInputWidget).placeholder).text),
                  chargeFrequency: Get.find<CustomComboBoxController<ChargeFrequency>>(tag: (childrenRight[2] as CustomComboBox<ChargeFrequency>).labelText).text!,
                  clientName: Get.find<CustomInputController>(tag: (childrenRight[3] as CustomInputWidget).placeholder).text,
                  clientNumber: Get.find<CustomInputController>(tag: (childrenRight[4] as CustomInputWidget).placeholder).text,
                  notes: Get.find<CustomInputController>(tag: (childrenRight[5] as CustomInputWidget).placeholder).text,                
                );

                controller.addTransaction(newTransaction);
                Get.toNamed(Routes.HOME);
              },
            ),
          ],
        ),
      )
    );
  }
}