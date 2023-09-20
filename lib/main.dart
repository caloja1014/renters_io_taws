import 'package:flutter/material.dart';
import '/global/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Renters.io',
      theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
              seedColor: Color.fromRGBO(240, 240, 240, 0.719))),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  FloatingActionButtonLocation _TransactionButtonLocation =
      FloatingActionButtonLocation.endDocked;
  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
        TextButton.styleFrom(foregroundColor: Colors.white);
    return Scaffold(
      appBar: AppBar(
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
      ),
      body: Column(
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Create',
        child: const Icon(Icons.home),
      ),
      floatingActionButtonLocation: _TransactionButtonLocation,
      bottomNavigationBar: _DemoBottomAppBar(
        TransactionButtonLocation: _TransactionButtonLocation,
        shape: const CircularNotchedRectangle(),
      ),
    );
  }
}

class _DemoBottomAppBar extends StatelessWidget {
  const _DemoBottomAppBar({
    this.TransactionButtonLocation = FloatingActionButtonLocation.endDocked,
    this.shape = const CircularNotchedRectangle(),
  });

  final FloatingActionButtonLocation TransactionButtonLocation;
  final NotchedShape? shape;

  static final List<FloatingActionButtonLocation> centerLocations =
      <FloatingActionButtonLocation>[
    FloatingActionButtonLocation.centerDocked,
    FloatingActionButtonLocation.centerFloat,
  ];

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: shape,
      color: Color.fromARGB(255, 1, 69, 124),
      child: IconTheme(
        data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
        child: Row(
          children: <Widget>[
            if (centerLocations.contains(TransactionButtonLocation))
              const Spacer(),
            IconButton(
              tooltip: 'Inventario',
              icon: const Icon(Icons.inventory),
              onPressed: () {},
            ),
            IconButton(
              tooltip: 'Transacciones',
              icon: const Icon(Icons.shopping_cart),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
