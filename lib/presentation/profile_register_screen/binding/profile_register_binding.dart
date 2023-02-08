import '../controller/profile_register_controller.dart';
import 'package:get/get.dart';

class ProfileRegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileRegisterController());
  }
}
