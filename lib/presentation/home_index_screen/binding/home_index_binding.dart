import '../controller/home_index_controller.dart';
import 'package:get/get.dart';

class HomeIndexBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeIndexController());
  }
}
