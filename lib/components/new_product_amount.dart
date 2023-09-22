import 'package:flutter/material.dart';

class AvailableAmountWidget extends StatefulWidget {
  final int initialAmount;

  const AvailableAmountWidget({super.key, this.initialAmount = 0});

  @override
  _AvailableAmountWidgetState createState() => _AvailableAmountWidgetState();
}

class _AvailableAmountWidgetState extends State<AvailableAmountWidget> {
  @override
  void initState() {
    super.initState();
    _amount = widget.initialAmount;
  }

  int _amount = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
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
                  setState(() {
                    _amount--;
                  });
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
                    '$_amount',
                    style: Theme.of(context).textTheme.labelLarge,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _amount++;
                  });
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
              setState(() {
                _amount = int.tryParse(value) ?? 0;
              });
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
