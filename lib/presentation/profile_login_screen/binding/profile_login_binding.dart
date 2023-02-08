import '../controller/profile_login_controller.dart';
import 'package:get/get.dart';

class ProfileLoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileLoginController());
  }
}
