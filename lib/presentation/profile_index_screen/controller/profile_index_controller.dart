import 'package:bloodapp2/core/app_export.dart';
import 'package:bloodapp2/presentation/profile_index_screen/models/profile_index_model.dart';

class ProfileIndexController extends GetxController {
  Rx<ProfileIndexModel> profileIndexModelObj = ProfileIndexModel().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
