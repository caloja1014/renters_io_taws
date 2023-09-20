import 'package:flutter/material.dart';

AppBar buildAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: Color.fromARGB(255, 1, 69, 124),
    actions: <Widget>[
      const Image(
        image: NetworkImage(
            'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
      ),
      Text('Emprendimiento 1', style: TextStyle(color: Colors.white)),
      IconButton(
        icon: const Icon(Icons.expand_more),
        tooltip: 'Seleccione su emprendimiento',
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('Seleccione su emprendimiento')));
        },
      ),
    ],
  );
}