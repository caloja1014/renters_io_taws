import 'package:flutter/material.dart';
// import '/global/theme/app_theme.dart';

import 'package:renters_io_taws/pages/home.dart';
import 'package:renters_io_taws/pages/stock.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Renters.io',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromRGBO(240, 240, 240, 0.719)
        )
      ),
      initialRoute: '/home',
      routes: {
        '/home': (context) => const Home(),
        '/stock': (context) => const Stock(),
      },
    );
  }
}
