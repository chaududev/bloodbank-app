import '../controller/blooddonation_register_one_controller.dart';
import 'package:get/get.dart';

class BlooddonationRegisterOneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BlooddonationRegisterOneController());
  }
}
