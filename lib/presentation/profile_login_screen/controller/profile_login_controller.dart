import 'dart:convert';

import 'package:bloodapp2/core/app_export.dart';
import 'package:bloodapp2/data/apiClient/api_client.dart';
import 'package:bloodapp2/data/models/user_info_stored_model.dart';
import 'package:bloodapp2/presentation/profile_login_screen/models/profile_login_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileLoginController extends GetxController
    with StateMixin<UserInfoStored> {
  TextEditingController formController = TextEditingController(text: "");

  TextEditingController formOneController = TextEditingController(text: "");

  Rx<PayLoadLogin> profileLoginModelObj = PayLoadLogin().obs;
  Rx<UserInfoStored> userObjs = UserInfoStored().obs;
  dynamic userInfo;
  Rx<Object> user = Object().obs;
  Rx<String> roles = "public".obs;

  var auth = false.obs;

  login(PayLoadLogin login) async {
    // Obtain shared preferences.
    final prefs = await SharedPreferences.getInstance();
    //PrefUtils().init();
    change(null, status: RxStatus.loading());
    try {
      var response = await ApiClient().login(login);
      userObjs(response);
      change(response, status: RxStatus.success());
      var encode = jsonEncode(response);
      //  print(response.jwt);
      prefs.setString("userInfo", encode);
      getUser();

      auth(true);
      //  setMe(response.jwt ?? "");
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  logout() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getString("userInfo") != null) {
      auth(false);
      prefs.clear();
      user(null);
      roles("public");
    }
  }

  checkAuth() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getString("userInfo") != null) {
      userObjs(UserInfoStored.fromJson(
          jsonDecode(prefs.getString("userInfo").toString())));
      getUser();
      auth(true);
      // getMe();
    } else {
      user(null);
      roles("public");
      auth(false);
    }
  }

  // getMe() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   var user = prefs.getString("Infomation");
  //   if (user != null) {
  //     userInfo = (jsonDecode(user));
  //   }
  // }

  // setMe(String token) async {
  //   final prefs = await SharedPreferences.getInstance();
  //   var response = await ApiClient().getMe(token);
  //   userInfo = (response);
  //   var data = jsonEncode(response);
  //   prefs.setString("Infomation", data);
  // }

  getUser() async {
    // print(userObjs.value.jwt);
    var rsp = await ApiClient().getMe(userObjs.value.jwt ?? "");
    //print(rsp);
    user(rsp);
    roles(rsp["role"]["name"]);
  }

  @override
  void onReady() {
    super.onReady();
    change(null, status: RxStatus.empty());
    checkAuth();
  }

  @override
  void onClose() {
    super.onClose();
    formController.dispose();
    formOneController.dispose();
  }
}
