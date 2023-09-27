import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renters_io_taws/layout/layout_scaffold.dart';
import 'package:renters_io_taws/pages/home/home_controller.dart';
import 'package:renters_io_taws/routes/app_pages.dart';

class Home extends GetView<HomeController> {
  const Home({Key? key}) : super(key: key);

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
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
              Get.toNamed(Routes.TRANSACTION);
            },
            child: Text('Nueva Transacción'),
          )
        ],
      ),
    );
  }
}
