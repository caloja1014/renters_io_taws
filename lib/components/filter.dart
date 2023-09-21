import 'package:flutter/material.dart';
import 'package:renters_io_taws/models/category_enum.dart';

class Filter extends StatefulWidget {
  const Filter({
    super.key,
    required this.text,
    required this.category
  });

  final Category category;
  final String text;

  @override
  _FilterState createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  bool _isTapped = false;

  void _handleTap() {
    setState(() {
      _isTapped = !_isTapped;
    });
  }

  @override
  Widget build(BuildContext context) {
    final backgroundColor = _isTapped ? Colors.black : Theme.of(context).colorScheme.secondary;

    return GestureDetector(
      onTap: _handleTap,
      child: FittedBox(
        fit: BoxFit.fitWidth,
        child: Container(
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(
              color: Colors.black,
              width: 2.0,
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Center(
            child: Text(
              widget.text,
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: _isTapped ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}