import 'package:flutter/material.dart';

import 'package:renters_io_taws/components/field.dart' as field;

class InputGrid extends StatelessWidget {
  const InputGrid({
    super.key,
    required this.childrenLeft,
    required this.childrenRight,
  });

  final List<Widget> childrenLeft;
  final List<Widget> childrenRight;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        childrenLeft.length,
        (index) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            children: [
              Expanded(child: childrenLeft[index]),
              const SizedBox(width: 16.0),
              Expanded(child: childrenRight[index]),
            ],
          ),
        ),
      ),
    );
  }
}