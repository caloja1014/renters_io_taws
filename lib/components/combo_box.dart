import 'package:flutter/material.dart';

class CustomComboBox<T extends dynamic> extends StatefulWidget {
  final String labelText;
  final List<T> options;

  const CustomComboBox({
    Key? key,
    required this.labelText,
    required this.options,
  }) : super(key: key);

  @override
  _CustomComboBoxState<T> createState() => _CustomComboBoxState<T>();
}

class _CustomComboBoxState<T extends dynamic> extends State<CustomComboBox<T>> {
  T? _selectedOption;

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
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: DropdownButton<T>(
          isExpanded: true,
          value: _selectedOption,
          hint: Text(widget.labelText),
          onChanged: (T? newValue) {
            setState(() {
              _selectedOption = newValue;
            });
          },
          items: widget.options.map<DropdownMenuItem<T>>((T value) {
            return DropdownMenuItem<T>(
              value: value,
              child: Text(value.toString().split('.').last),
            );
          }).toList(),
        ),
      ),
    );
  }
}