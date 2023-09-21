import 'package:flutter/material.dart';

class CustomInput extends StatefulWidget {
  final String placeholder;
  final bool isPrice;

  const CustomInput({super.key, required this.placeholder, this.isPrice = false});

  @override
  _CustomInputState createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      width: 200.0,
      height: 50.0,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        border: Border.all(
          color: Theme.of(context).colorScheme.outline,
          width: 2.0,
        ),
      ),
      child: Row(
        children: [
          if (widget.isPrice)
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Icon(Icons.attach_money),
            ),
          Expanded(
            child: TextFormField(
              controller: _controller,
              keyboardType: widget.isPrice ? TextInputType.number : TextInputType.text,
              decoration: InputDecoration(
                hintText: widget.placeholder,
                border: InputBorder.none,
              ),
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}