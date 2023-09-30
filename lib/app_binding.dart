import 'package:get/get.dart';
import 'package:renters_io_taws/controllers/bottom_bar_controller.dart';
import 'package:renters_io_taws/controllers/entrepreneurship_controller.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(BottomController(), permanent: true);
    Get.put(EntrepreneurshipController(), permanent: true);
  }
}
