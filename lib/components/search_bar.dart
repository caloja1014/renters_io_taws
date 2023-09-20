import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  const Search({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 335.0, // Adjust the width as needed
      height: 60, // Equal width and height for a squared search bar
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface, // Background color
        borderRadius: BorderRadius.circular(5.0), // Rounded corners
        border: Border.all(color: Colors.black), // Black border
      ),
      child: Center(
        child: TextField(
          decoration: InputDecoration(
            border: InputBorder.none, // Remove border
            prefixIcon: Icon(
              Icons.search, // You can replace this with your desired icon
              color: Colors.black, // Icon color
            ),
            hintText: "Buscar", // Placeholder text
            hintStyle: Theme.of(context).textTheme.labelSmall,
          ),
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
            color: Theme.of(context).colorScheme.onBackground,
          )
        ),
      ),
    );
  }
}