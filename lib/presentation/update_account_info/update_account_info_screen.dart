import 'package:bloodapp2/presentation/update_account_info/controller/update_account_info_controller.dart';
import 'package:bloodapp2/widgets/text_field.dart';

import 'package:bloodapp2/core/app_export.dart';

import 'package:flutter/material.dart';

import '../profile_login_screen/controller/profile_login_controller.dart';

final List<Map<String, String>> items = [
  {"name": "Cho tôi", "value": "FORME"},
  {"name": "Cho người khác", "value": "FORANYONE"}
];

// ignore: must_be_immutable
class UpdateInfoAccountScreen extends GetView<UpdateAccountInfoController> {
  Rx<String>? selectedValue;
  // _handleChangeValue(value) async {
  //   controller.radioGroup(value as String);
  //   if (value.toString() == "FORME") {
  //     //     var userContrcoller = Get.find<ProfileLoginController>();
  //     // var user = userContrcoller.userObjs.value;
  //     controller.setValueForUser();
  //   }
  // }

  String? gender;

  @override
  Widget build(BuildContext context) {
    _handleRegister() async {
      ProfileLoginController user = Get.find();
      var response =
          await controller.handleUpdatAccoutInfo(user.userObjs.value.user!.id);
      print(response);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Đăng ký hiến máu"),
      ),
      body: controller.obx(
        (dynamic state) {
          return Container(
            margin: EdgeInsets.all(16),
            child: ListView(
              children: [
                Obx(() {
                  return SizedBox(
                      child: entryField(
                    "Tên người đăng ký",
                    require: true,
                    controller: controller.fullNameController.value,
                  ));
                }),
                Obx(() {
                  return SizedBox(
                      child: entryField(
                    "Số điện thoại ",
                    require: true,
                    controller: controller.phoneController.value,
                  ));
                }),
                Obx(() {
                  return SizedBox(
                      child: entryField(
                    "Địa chỉ ",
                    require: true,
                    controller: controller.addressController.value,
                  ));
                }),
                SizedBox(
                  child: Text("Giới tính"),
                ),
                Obx(() {
                  return SizedBox(
                    height: 50,
                    child: Row(
                      children: [
                        Expanded(
                            child: Row(
                          children: [
                            Transform.scale(
                              scale: 1.3,
                              child: Radio(
                                value: 'MALE',
                                groupValue: controller.genderRadio.value,
                                onChanged: (value) {
                                  print(value);
                                  controller.genderRadio(value.toString());
                                },
                              ),
                            ),
                            Text("Nam")
                          ],
                        )),
                        Expanded(
                            child: Row(
                          children: [
                            Transform.scale(
                              scale: 1.3,
                              child: Radio(
                                value: 'FEMALE',
                                groupValue: controller.genderRadio.value,
                                onChanged: (value) {
                                  print(value);
                                  controller.genderRadio(value.toString());
                                },
                                //  activeColor: Color(0xffFFBD11),
                              ),
                            ),
                            Text("Nữ")
                          ],
                        )),
                      ],
                    ),
                  );
                }),
                Obx(() {
                  return SizedBox(
                      child: entryField(
                    "Ngày sinh ",
                    require: true,
                    isDatePicker: true,
                    controller: controller.birthDateController.value,
                  ));
                }),
                SizedBox(
                  child: Row(
                    children: [
                      Text("Nhóm máu"),
                      Text(
                        "(*)",
                        style: TextStyle(color: Colors.red),
                      )
                    ],
                  ),
                ),
                Obx(() {
                  //  print(state);
                  return SizedBox(
                    height: 150,
                    child: GridView.count(
                      physics: NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      childAspectRatio: 6 / 1.6,
                      children: (state["data"] as List).map((e) {
                        //   print(e);
                        return SizedBox(
                          height: 50,
                          child: Row(
                            children: [
                              Expanded(
                                  child: Row(
                                children: [
                                  Transform.scale(
                                    scale: 1.3,
                                    child: Radio(
                                      value: e["id"].toString(),
                                      groupValue: controller.typeGroup.value,
                                      onChanged: (value) {
                                        var data = value as dynamic;
                                        controller.typeGroup(data.toString());
                                      },
                                    ),
                                  ),
                                  Text(e["attributes"]["code"] ?? "")
                                ],
                              )),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  );
                }),
                SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                  onPressed: _handleRegister,
                  child: Text("Cập nhật thông tin"),
                )
              ],
            ),
          );
        },
        onLoading: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }

  onTapNgk() {
    Get.toNamed(AppRoutes.blooddonationRegisteredScreen);
  }
}
