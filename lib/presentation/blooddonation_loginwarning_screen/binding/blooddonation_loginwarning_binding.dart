import '../controller/blooddonation_loginwarning_controller.dart';
import 'package:get/get.dart';

class BlooddonationLoginwarningBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BlooddonationLoginwarningController());
  }
}
