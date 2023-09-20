import 'package:flutter/material.dart';
import 'package:renters_io_taws/components/app_bar.dart';
import 'package:renters_io_taws/components/navigation_bar.dart' as navigation_bar;

class LayoutScaffold extends StatelessWidget {
  final Widget body;

  LayoutScaffold({super.key, required this.body});

  FloatingActionButtonLocation transactionButtonLocation = FloatingActionButtonLocation.endDocked;
  // final ButtonStyle style = TextButton.styleFrom(foregroundColor: Colors.white);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: body,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Create',
        child: const Icon(Icons.home),
      ),
      floatingActionButtonLocation: transactionButtonLocation,
      bottomNavigationBar: navigation_bar.NavigationBar(
        transactionButtonLocation: transactionButtonLocation,
        shape: const CircularNotchedRectangle(),
      ),
    );
  }
}
