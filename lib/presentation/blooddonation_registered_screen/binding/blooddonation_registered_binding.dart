import '../controller/blooddonation_registered_controller.dart';
import 'package:get/get.dart';

class BlooddonationRegisteredBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BlooddonationRegisteredController());
  }
}
