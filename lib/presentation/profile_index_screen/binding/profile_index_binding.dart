import '../controller/profile_index_controller.dart';
import 'package:get/get.dart';

class ProfileIndexBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileIndexController());
  }
}
