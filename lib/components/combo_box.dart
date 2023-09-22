import 'package:flutter/material.dart';

import 'package:renters_io_taws/models/category_enum.dart';
import 'package:renters_io_taws/models/frequency_enum.dart';

class CustomComboBox extends StatefulWidget {
  final String labelText;
  final bool isFrequency;

  const CustomComboBox(
      {super.key, required this.labelText, this.isFrequency = false});

  @override
  _CustomComboBoxState createState() => _CustomComboBoxState();
}

class _CustomComboBoxState extends State<CustomComboBox> {
  Category? _selectedOption;
  Frequency? _selectedOption1;

  List<Category> options = Category.values.toList();
  List<Frequency> options1 = Frequency.values.toList();

  List<String> optionsString = [
    'Plástico',
    'Electricidad',
    'Tornillos',
    'Metal',
    'Madera',
    'Aereosol',
    'Pintura',
    'Tubos',
    'Herramientas'
  ];

  List<String> optionsString1 = ['Diario', 'Mensual', 'Anual'];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).colorScheme.outline,
          width: 2.0,
        ),
        color: Theme.of(context).colorScheme.surface,
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                _selectedOption != null
                    ? widget.isFrequency
                        ? optionsString1[options1.indexOf(_selectedOption1!)]
                        : optionsString[options.indexOf(_selectedOption!)]
                    : widget.labelText,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ),
          VerticalDivider(
            width: 2.0,
            color: Theme.of(context).colorScheme.outline,
          ),
          IconButton(
            icon: Icon(
              Icons.arrow_drop_down,
              color: Theme.of(context).colorScheme.outline,
            ),
            onPressed: () {
              widget.isFrequency
                  ? _showOptions1(context)
                  : _showOptions(context);
            },
          ),
        ],
      ),
    );
  }

  void _showOptions(BuildContext context) async {
    final selectedOption = await showDialog<Category>(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
            title: Text(
              'Selecciona una opción',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            children: options.map((Category option) {
              return SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, option);
                },
                child: Text(
                  optionsString[options.indexOf(option)],
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Lato',
                  ),
                ),
              );
            }).toList());
      },
    );

    if (selectedOption != null) {
      setState(() {
        _selectedOption = selectedOption;
      });
    }
  }

  void _showOptions1(BuildContext context) async {
    final selectedOption1 = await showDialog<Frequency>(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
            title: Text(
              'Selecciona una opción',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            children: options1.map((Frequency option) {
              return SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, option);
                },
                child: Text(
                  optionsString1[options1.indexOf(option)],
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Lato',
                  ),
                ),
              );
            }).toList());
      },
    );

    if (selectedOption1 != null) {
      setState(() {
        _selectedOption1 = selectedOption1;
      });
    }
  }
}
