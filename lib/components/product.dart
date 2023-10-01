import 'dart:io';

import 'package:renters_io_taws/models/category_enum.dart';
import 'package:flutter/material.dart';

class Product extends StatelessWidget {
  final String id;
  final String name;
  final Category category;
  final double price;
  final String imageRoute;
  final int availableAmount;
  final Widget widget;

  const Product(
      {super.key,
      required this.id,
      required this.name,
      required this.category,
      required this.price,
      required this.availableAmount,
      this.imageRoute = '',
      this.widget = const SizedBox(width: 0, height: 0)});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360,
      height: 140,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.tertiary, // Background color
        border: Border.all(
          color: Theme.of(context).colorScheme.outline, // Border color
          width: 1.0, // Border width
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(5.0), // Rounded corners
        ),
      ),
      margin: const EdgeInsets.all(10.0), // Margin for spacing
      padding: const EdgeInsets.all(10.0), // Padding for spacing
      child: Row(
        children: [
          // Left side (75% width)
          Expanded(
            flex: 3, // Takes 3/4 of the available space
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                Text(
                  name,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Lato',
                  ),
                ),
                const SizedBox(height: 8.0), // Spacer
                availableAmount != -1
                    ?
                    // Available amount
                    Text(
                        'Disponible: $availableAmount unidades',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onBackground,
                          fontSize: 15.0,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Lato',
                        ),
                      )
                    : const SizedBox(width: 0, height: 0),
                const SizedBox(height: 8.0), // Spacer
                price != -1
                    ?
                    // Price
                    Text(
                        'Precio unitario: \$${price.toStringAsFixed(2)}',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onBackground,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Lato',
                        ),
                      )
                    : const SizedBox(width: 0, height: 0),
                Container(width: 75, child: widget)
              ],
            ),
          ),
          // Right side (25% width)
          Expanded(
            flex: 1, // Takes 1/4 of the available space
            child: Image.file(
              File(imageRoute),
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
