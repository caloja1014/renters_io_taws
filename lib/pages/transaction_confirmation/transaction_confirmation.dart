import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renters_io_taws/components/combo_box.dart';
import 'package:renters_io_taws/components/field.dart';
import 'package:renters_io_taws/components/input.dart';
import 'package:renters_io_taws/layout/input_grid.dart';
import 'package:renters_io_taws/layout/layout_scaffold.dart';
import 'package:renters_io_taws/models/charge_frequency_enum.dart';
import 'package:renters_io_taws/pages/transaction/transaction_controller.dart';

class TransactionConfirmation extends GetView<TransactionController> {
  const TransactionConfirmation({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutScaffold(body: Content());
  }
}

class Content extends StatelessWidget {
  List<Widget> get childrenLeft => [
    const TitleWidget(title: 'Fecha inicio'),
    const TitleWidget(title: 'Fecha fin'),
    const TitleWidget(title: 'Frecuencia de cobro'), 
    const TitleWidget(title: 'Cliente'),
    const TitleWidget(title: 'Número telf. del cliente'),
    const TitleWidget(title: 'Notas'),
  ];

  List<Widget> get childrenRight => [
    const CustomInput(placeholder: 'dd/mm/aaaa'),
    const CustomInput(placeholder: 'dd/mm/aaaa'),
    const CustomComboBox<ChargeFrequency>(labelText: 'Seleccionar', options: ChargeFrequency.values,),
    const CustomInput(placeholder: 'Nombre del cliente'),
    const CustomInput(placeholder: 'Número telf. del cliente'),
    const CustomInput(placeholder: 'Notas'),
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
          InputGrid(
            childrenLeft: childrenLeft, 
            childrenRight: childrenRight
          )
        ],
      ),
    );
  }
}