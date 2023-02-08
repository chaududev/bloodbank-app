import 'package:bloodapp2/core/app_export.dart';
import 'package:bloodapp2/data/apiClient/api_client.dart';
import 'package:bloodapp2/data/models/user_info_stored_model.dart';
import 'package:bloodapp2/presentation/blooddonation_register_screen/controller/blooddonation_register_controller.dart';
import 'package:bloodapp2/presentation/blooddonation_registered_screen/models/blooddonation_registered_model.dart';
import 'package:bloodapp2/presentation/profile_login_screen/controller/profile_login_controller.dart';

class BlooddonationRegisteredController extends GetxController
    with StateMixin<dynamic> {
  Rx<BlooddonationRegisteredModel> blooddonationRegisteredModelObj =
      BlooddonationRegisteredModel().obs;

  RxBool isSelectedSwitch = false.obs;

  RxBool isSelectedSwitch1 = false.obs;

  cancelRegister() async {
    BlooddonationRegisterController controller = Get.find();
    var objs = controller.bloodGroup.value;
    var user = Get.put(ProfileLoginController());
    UserInfoStored userInfo = user.userObjs.value;

    try {
      var response = await ApiClient().cancelSign(objs, userInfo.jwt ?? "");
      change(response, status: RxStatus.success());
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
      // throw Exception(e);
    }
    // print(objs);
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    change(null, status: RxStatus.empty());
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
