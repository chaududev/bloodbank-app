import 'dart:convert';

import 'package:bloodapp2/core/app_export.dart';
import 'package:bloodapp2/data/apiClient/api_client.dart';
import 'package:bloodapp2/presentation/profile_login_screen/controller/profile_login_controller.dart';
import 'package:bloodapp2/presentation/profile_register_screen/models/profile_register_model.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileRegisterController extends GetxController with StateMixin<Object> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController repeatPasswordController = TextEditingController();

  Rx<ProfileRegisterModel> profileRegisterModelObj = ProfileRegisterModel().obs;

  valUsername(value) {
    var isEmail = ValidationBuilder().email().maxLength(50).build();
    return isEmail(value);
  }

  valPassword(value) {
    var isPassword = ValidationBuilder()
        .maxLength(20)
        .minLength(8)
        .regExp(
            RegExp(
                r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$'),
            "Should contain at least one upper case and\nShould contain at least one lower case \nShould contain at least one digit \nShould contain at least one Special character \nMust be at least 8 characters in length ")
        .build();
    return isPassword(value);
  }

  valRepeatPassword(value) {
    return passwordController.value.text == value
        ? null
        : "Repeat password is not match";
  }

  valHandleRegister() async {
    var username =
        emailController.text.substring(0, emailController.text.indexOf("@"));
    var data = {
      "username": username,
      "email": emailController.text.trim(),
      "password": passwordController.text
    };
    final prefs = await SharedPreferences.getInstance();
    final userController = Get.put(ProfileLoginController());
    //PrefUtils().init();
    change(null, status: RxStatus.loading());

    //print(data);
    try {
      var response = await ApiClient().register(data);
      userController.userObjs(response);
      change(response, status: RxStatus.success());
      var encode = jsonEncode(response);
      //  print(response.jwt);
      prefs.setString("userInfo", encode);
      userController.getUser();

      userController.auth(true);
      // print(response);
      change(response, status: RxStatus.loading());
      Get.toNamed("/user_update_info");
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    } finally {
      change(null, status: RxStatus.success());
    }
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
    emailController.dispose();
    passwordController.dispose();
    repeatPasswordController.dispose();
  }
}
