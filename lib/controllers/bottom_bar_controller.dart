import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renters_io_taws/pages/stock/stock.dart';

class BottomController extends GetxController {
  final selectedIndex = 2.obs;

  final pagingController = PageController(initialPage: 2);
 final pages = [
    const Stock(),
    Container(),
  ];
  void changePage(int index) {
    selectedIndex.value = index;
  }
}
