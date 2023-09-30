import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renters_io_taws/controllers/entrepreneurship_controller.dart';

AppBar buildAppBar(BuildContext context) {
  return AppBar(
    leading: const Image(
      image: NetworkImage(
          'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
    ),
    title: const Row(
      children: <Widget>[
        DropdownButtonCompany()
        //   Text('Emprendimiento 1', style: TextStyle(color: Colors.white)),
        //   IconButton(
        //     icon: const Icon(Icons.expand_more),
        //     tooltip: 'Seleccione su emprendimiento',
        //     onPressed: () {
        //       ScaffoldMessenger.of(context).showSnackBar(
        //           const SnackBar(content: Text('Seleccione su emprendimiento')));
        //     },
        //   ),
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

class DropdownButtonCompany extends StatefulWidget {
  const DropdownButtonCompany({super.key});

  @override
  State<DropdownButtonCompany> createState() => _DropdownButtonCompanyState();
}

class _DropdownButtonCompanyState extends State<DropdownButtonCompany> {
  final entreController = Get.find<EntrepreneurshipController>();
  String? dropdownValue;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final list = entreController.listEntre.map((e) => e.name).toList();
      final selectedValue = entreController.entrerPreneurSelected.value;
      return DropdownButton<String>(
        value: selectedValue?.name,
        icon: const Icon(Icons.arrow_downward),
        elevation: 16,
        dropdownColor: Color.fromARGB(255, 91, 112, 151),
        style: const TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
        focusColor: Color.fromARGB(0, 0, 0, 0),
        underline: Container(
          height: 2,
          color: Color.fromARGB(255, 255, 255, 255),
        ),
        onChanged: (String? value) {
          entreController.entrerPreneurSelected.value =
              entreController.listEntre.firstWhere((e) => e.name == value);
        },
        items: list.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      );
    });
  }
}
