import 'package:flutter/material.dart';
import 'package:renters_io_taws/layout/layout_scaffold.dart';

import 'package:renters_io_taws/components/search_bar.dart' as search_bar;
import 'package:renters_io_taws/components/filter.dart' as filter;
import 'package:renters_io_taws/components/product.dart' as product;

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
    return const filter.Filter(text: "Filtro");
  }
}