import 'package:flutter/material.dart';
import 'package:renters_io_taws/layout/layout_scaffold.dart';

class Home extends StatelessWidget {
  const Home({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutScaffold(body: const Content());
  }
}

class Content extends StatelessWidget {
  const Content({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              print("Botón 1");
            },
            child: Text('Notificaciones'),
          ),
          ElevatedButton(
            onPressed: () {
              print("Botón 2");
            },
            child: Text('Transacciones activas'),
          ),
          ElevatedButton(
            onPressed: () {
              print("Botón 3");
            },
            child: Text('Transacciones pasadas'),
          ),
          ElevatedButton(
            onPressed: () {
              print("Botón 4");
            },
            child: Text('Nueva Transacción'),
          )
        ],
      ),
    );
  }
}
