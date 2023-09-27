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
import 'package:renters_io_taws/pages/add_transaction/add_transaction_controller.dart';

class AddTransaction extends GetView<AddTransactionController> {
  const AddTransaction({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutScaffold(body: Content());
  }
}

class Content extends StatelessWidget {
  Content({super.key});

  List<Widget> get childrenLeft => [
        const field.TitleWidget(title: 'Uso total'),
        const field.TitleWidget(title: ''),
        const field.TitleWidget(title: 'Frecuencia de cobro'),
        const field.TitleWidget(title: 'Cliente'),
        const field.TitleWidget(title: 'Contacto'),
        const field.TitleWidget(title: 'Notas'),
        const field.TitleWidget(title: 'Items'),
      ];

  List<Widget> get childrenRight => [
        const input.CustomInput(placeholder: 'Fecha de inicio'),
        const input.CustomInput(placeholder: 'Fecha de finalización'),
        const combo_box.CustomComboBox(
            labelText: 'Seleccionar', isFrequency: true),
        const input.CustomInput(placeholder: 'Nombre del cliente'),
        const input.CustomInput(placeholder: 'Número de teléfono'),
        const input.CustomInput(placeholder: 'Notas'),
        const field.TitleWidget(title: ''),
      ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
      ),
      child: ListView(
        children: [
          const SizedBox(height: 20.0),
          input_grid.InputGrid(
            childrenLeft: childrenLeft,
            childrenRight: childrenRight,
          ),
          const SizedBox(height: 20.0),
          const Row(
            children: <Widget>[
              Expanded(
                  child: Text('Nombre',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic))),
              Expanded(
                  child: Text('Precio',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic))),
              Expanded(
                  child: Text('Total',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic))),
              Expanded(
                  child: Text('Cantidad',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic))),
            ],
          ),
          const Row(
            children: <Widget>[
              Expanded(child: Text('Focos LED')),
              Expanded(child: Text('\$ 1.25')),
              Expanded(child: Text('\$ 2.50')),
              new_product_amount.AvailableAmountWidget(withText: true),
            ],
          ),
          const Row(
            children: <Widget>[
              Expanded(child: Text('Focos LED')),
              Expanded(child: Text('\$ 1.25')),
              Expanded(child: Text('\$ 2.50')),
              new_product_amount.AvailableAmountWidget(withText: true),
            ],
          ),
          const Row(
            children: <Widget>[
              Expanded(
                  child: Text('Total',
                      style: TextStyle(fontWeight: FontWeight.bold))),
              Expanded(child: Text('\$ 5.00')),
            ],
          ),
          const SizedBox(height: 20.0),
          button.Button(text: 'Solicitar producto', onPressed: () {})
        ],
      ),
    );
  }
}
