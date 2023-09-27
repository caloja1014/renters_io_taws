import 'package:flutter/material.dart';
import 'package:renters_io_taws/components/app_bar.dart';
import 'package:renters_io_taws/components/navigation_bar.dart'
    as navigation_bar;

class LayoutScaffold extends StatelessWidget {
  final Widget body;
  final bool isHome;
  LayoutScaffold({super.key, required this.body, this.isHome = false});
  
  FloatingActionButtonLocation transactionButtonLocation =
      FloatingActionButtonLocation.centerDocked;
  // final ButtonStyle style = TextButton.styleFrom(foregroundColor: Colors.white);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: body,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/home');
        },
        tooltip: 'Página principal',
        child: Icon(Icons.home),
      ),
      floatingActionButtonLocation: transactionButtonLocation,
      bottomNavigationBar: navigation_bar.NavigationBar(
        transactionButtonLocation: transactionButtonLocation,
        shape: const CircularNotchedRectangle(),
      ),
    );
  }
}
