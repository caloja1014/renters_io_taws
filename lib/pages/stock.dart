import 'package:flutter/material.dart';
import 'package:renters_io_taws/layout/layout_scaffold.dart';

class Stock extends StatelessWidget {
  const Stock({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutScaffold(
      body: const Content(),
    );
  }
}

class Content extends StatelessWidget {
  const Content({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text('Hola');
  }
}