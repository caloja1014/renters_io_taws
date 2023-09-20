import 'package:flutter/material.dart';

AppBar buildAppBar(BuildContext context) {
  return AppBar(
    leading: const Image(
      image: NetworkImage(
          'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
    ),
    title: Row(
      children: <Widget>[
        Text('Emprendimiento 1', style: TextStyle(color: Colors.white)),
        IconButton(
          icon: const Icon(Icons.expand_more),
          tooltip: 'Seleccione su emprendimiento',
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Seleccione su emprendimiento')));
          },
        ),
      ],
    ),
    backgroundColor: Color.fromARGB(255, 1, 69, 124),
    actions: <Widget>[
      IconButton(
        icon: const Icon(Icons.question_mark),
        tooltip: 'Ayuda',
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Visite la página de Renters.io')));
        },
      ),
    ],
  );
}
