import 'package:bloodapp2/presentation/history_sign_screen/controller/history_sign_controller.dart';
import 'package:get/get.dart';

class HistorySignBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HistorySignController());
  }
}
