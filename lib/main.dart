import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renters_io_taws/app_binding.dart';
import 'package:renters_io_taws/routes/app_pages.dart';
import '/global/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Renters.io',
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      initialBinding: AppBinding(),
    );
  }
}
