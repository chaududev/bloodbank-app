import 'package:bloodapp2/widgets/text_field.dart';

import 'controller/blooddonation_register_controller.dart';
import 'package:bloodapp2/core/app_export.dart';

import 'package:flutter/material.dart';

final List<Map<String, String>> items = [
  {"name": "Cho tôi", "value": "FORME"},
  {"name": "Cho người khác", "value": "FORANYONE"}
];

// ignore: must_be_immutable
class BlooddonationRegisterScreen
    extends GetView<BlooddonationRegisterController> {
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
    _handleRegister() {
      showDialog(
          context: context,
          builder: (_) => AlertDialog(
                title: Text('Thông báo'),
                content: Text('Bạn đã chắc chắc muốn đăng ký hiến máu ?'),
                actions: [
                  OutlinedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Đóng"),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(
                        width: 1,
                        color: Color(0xffFF576E),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      Navigator.pop(context);
                      var result = await controller.register();
                      if (result) {
                        Get.toNamed(AppRoutes.blooddonationRegisteredScreen);
                      } else {
                        showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                                    title: Text('Thông báo'),
                                    content: Text(
                                        'Đăng ký thất bại, vui lòng thử lại sau ?'),
                                    actions: [
                                      OutlinedButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text("Đóng"),
                                        style: OutlinedButton.styleFrom(
                                          side: BorderSide(
                                            width: 1,
                                            color: Color(0xffFF576E),
                                          ),
                                        ),
                                      ),
                                    ]));
                      }
                    },
                    child: Text("Đồng ý"),
                  ),
                ],
              ));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Đăng ký hiến máu"),
      ),
      body: controller.obx(
        (state) {
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
                    onPressed: _handleRegister, child: Text("Đăng ký"))
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
