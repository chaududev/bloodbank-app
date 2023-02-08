import 'package:bloodapp2/presentation/update_account_info/controller/update_account_info_controller.dart';
import 'package:get/get.dart';

class UpdateAccountInfoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UpdateAccountInfoController());
  }
}
