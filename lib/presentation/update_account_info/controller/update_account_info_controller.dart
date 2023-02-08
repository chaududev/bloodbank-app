import 'dart:convert';

import 'package:bloodapp2/core/app_export.dart';
import 'package:bloodapp2/data/apiClient/api_client.dart';
import 'package:bloodapp2/presentation/profile_login_screen/controller/profile_login_controller.dart';
import 'package:bloodapp2/presentation/profile_login_screen/models/profile_login_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UpdateAccountInfoController extends GetxController
    with StateMixin<Object> {
  Rx<TextEditingController> birthDateController = TextEditingController().obs;
  Rx<TextEditingController> phoneController = TextEditingController().obs;
  Rx<TextEditingController> fullNameController = TextEditingController().obs;
  Rx<TextEditingController> addressController = TextEditingController().obs;
  Rx<Object> bloodGroup = Object().obs;

  RxString radioGroup = "FORME".obs;

  RxString genderRadio = "MALE".obs;

  RxString typeGroup = "1".obs;
  getBloodByPath() async {
    try {
      var data = await ApiClient()
          .getByPath(AppConstants.APP_BASE_URL + "/api/blood-groups");
      //  dataGroup = data;
      change(data, status: RxStatus.success());
    } catch (e) {
      change(null, status: RxStatus.error());
    }
  }

  login(PayLoadLogin login) async {
    // Obtain shared preferences.
    final prefs = await SharedPreferences.getInstance();
    final userController = Get.put(ProfileLoginController());
    //PrefUtils().init();
    change(null, status: RxStatus.loading());
    try {
      var response = await ApiClient().login(login);
      userController.userObjs(response);
      change(response, status: RxStatus.success());
      var encode = jsonEncode(response);
      //  print(response.jwt);
      prefs.setString("userInfo", encode);
      userController.getUser();

      userController.auth(true);
      //  setMe(response.jwt ?? "");
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  setValueForUser() {
    var userContrcoller = Get.find<ProfileLoginController>();
    var user = userContrcoller.userObjs.value;

    //print(user.user?.username ?? "");
    fullNameController(TextEditingController(text: user.user?.fullName ?? ""));
    try {
      DateTime dateCurrent =
          DateFormat("yyyy-MM-dd").parse(user.user?.dateofBirth ?? "");
      birthDateController(TextEditingController(
          text: DateFormat("dd/MM/yyy").format(dateCurrent)));
    } catch (e) {}
    phoneController(TextEditingController(text: user.user?.phoneNumber ?? ""));
    addressController(TextEditingController(text: user.user?.address ?? ""));
    genderRadio(user.user!.gender == true ? "MALE" : "FEMALE");
    // print(userContrcoller.userInfo);
    //  update();
  }

  handleUpdatAccoutInfo(id) async {
    var data = {
      "fullname": fullNameController.value.text,
      "gender": genderRadio.value == "MALE" ? false : true,
      "address": addressController.value.text,
      "PhoneNumber": phoneController.value.text,
      "DateofBirth": birthDateController.value.text,
      "blood_group": typeGroup.value
      //  "user_register": "",
    };
    var response = await ApiClient().UpdateAccountUser(id.toString(), data);
    return response;
  }

  @override
  void onInit() {
    // getNews();

    super.onInit();
    getBloodByPath();

    setValueForUser();
  }
}
