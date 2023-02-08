import '../controller/blooddonation_register_controller.dart';
import 'package:get/get.dart';

class BlooddonationRegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BlooddonationRegisterController());
  }
}
