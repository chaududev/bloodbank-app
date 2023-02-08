import '../controller/home_urgent_controller.dart';
import 'package:get/get.dart';

class HomeUrgentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeUrgentController());
  }
}
