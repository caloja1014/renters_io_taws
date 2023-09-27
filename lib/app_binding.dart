import 'package:get/get.dart';
import 'package:renters_io_taws/controllers/bottom_bar_controller.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(BottomController());
  }
}
