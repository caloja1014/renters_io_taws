import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renters_io_taws/app_binding.dart';
import 'package:renters_io_taws/data/sqlite_service.dart';
import 'package:renters_io_taws/routes/app_pages.dart';
import '/global/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SqliteService().getDatabase();

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
      defaultTransition: Transition.fadeIn,
      initialBinding: AppBinding(),
    );
  }
}
