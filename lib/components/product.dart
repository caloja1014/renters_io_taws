import 'package:flutter/material.dart';

class Product extends StatelessWidget {
  final String name;
  final int availableAmount;
  final double price;
  final String imageRoute;

  const Product({
    super.key,
    required this.name,
    required this.availableAmount,
    required this.price,
    required this.imageRoute,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360.0,
      height: 140, // Adjust the width as needed
      color: Color(0xFFD9D9D9), // Background color
      padding: EdgeInsets.all(10.0), // Padding for spacing
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
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                SizedBox(height: 8.0), // Spacer
                // Available amount
                Text(
                  'Available: $availableAmount',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(height: 8.0), // Spacer
                // Price
                Text(
                  'Price: \$${price.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.green, // Price text color
                  ),
                ),
              ],
            ),
          ),
          // Right side (25% width)
          Expanded(
            flex: 1, // Takes 1/4 of the available space
            child: Image.asset(
              imageRoute,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}