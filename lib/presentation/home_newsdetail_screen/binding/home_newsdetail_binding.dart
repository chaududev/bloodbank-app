import '../controller/home_newsdetail_controller.dart';
import 'package:get/get.dart';

class HomeNewsdetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeNewsdetailController());
  }
}
