import 'package:flutter/material.dart';
import 'package:renters_io_taws/layout/layout_scaffold.dart';

class AddProduct extends StatelessWidget {
  const AddProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutScaffold(body: Content());
  }
}

class Content extends StatelessWidget {
  Content({super.key});

  @override
  Widget build(BuildContext context) {
    return Text('Agregar producto');
  }
}