import '../controller/home_urgentdetail_controller.dart';
import 'package:get/get.dart';

class HomeUrgentdetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeUrgentdetailController());
  }
}
