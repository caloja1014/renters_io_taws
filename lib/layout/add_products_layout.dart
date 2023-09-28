import 'package:flutter/material.dart';

class AddProductsLayout extends StatelessWidget {
  const AddProductsLayout({
    super.key,
    required this.products,
  });

  final List<Widget> products;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final columnCount = (screenWidth / 150).floor();

    return Container(
      height: 300.0,
      child: GridView.count(
        crossAxisCount: columnCount,
        children: products,
      ),
    );
  }
}