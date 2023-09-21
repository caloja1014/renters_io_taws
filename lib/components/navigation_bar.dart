import 'package:flutter/material.dart';

class NavigationBar extends StatelessWidget {
  const NavigationBar({
    super.key,
    this.transactionButtonLocation = FloatingActionButtonLocation.endDocked,
    this.shape = const CircularNotchedRectangle(),
  });

  final FloatingActionButtonLocation transactionButtonLocation;
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
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            // if (centerLocations.contains(transactionButtonLocation))
            //  const Spacer(),
            IconButton(
              iconSize: 30,
              tooltip: 'Inventario',
              icon: const Icon(Icons.inventory),
              onPressed: () {
                Navigator.pushNamed(context, '/stock');
              },
            ),
            IconButton(
              iconSize: 30,
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
