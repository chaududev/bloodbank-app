import 'dart:convert';

import 'package:bloodapp2/core/app_export.dart';
import 'package:bloodapp2/data/apiClient/api_client.dart';
import 'package:bloodapp2/presentation/home_index_screen/home_index_screen.dart';
import 'package:bloodapp2/presentation/scan_qr/scan_qr_screen.dart';
import 'package:find_dropdown/find_dropdown.dart';
import 'package:flutter/material.dart';

class UpdateScanUser extends StatefulWidget {
  UpdateScanUser({Key? key, required this.base64}) : super(key: key);
  String base64;

  @override
  State<UpdateScanUser> createState() => _UpdateScanUserState();
}

class _UpdateScanUserState extends State<UpdateScanUser> {
  String json = "";
  dynamic data = null;
  bool isLoading = true;
  dynamic hospitals = null;
  String hospitalItem = "";
  var id = "1";
  var controllerCapacity = TextEditingController();
  getInfo(id) async {
    var response = await ApiClient().getInfoFormSignByID(id);
    var responseHos = await ApiClient().getAllHospital();
    //  print('response: $response');
    setState(() {
      data = response;
      hospitals = responseHos;
      isLoading = false;
    });
  }

  handleUpdate() async {
    try {
      var response = await ApiClient()
          .updateFormSign(controllerCapacity.text, hospitalItem, id);
      showDialog(
          context: context,
          builder: (context) => Scaffold(
                body: AlertDialog(
                  title: Text("Thông báo"),
                  content: Text("Cập nhật thông tin hiến máu thành công"),
                  actions: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Get.off(HomeIndexScreen());
                      },
                      child: Text("Đóng"),
                    )
                  ],
                ),
              ));
    } catch (ex) {
      showDialog(
          context: context,
          builder: (context) => Scaffold(
                body: AlertDialog(
                  title: Text("Thông báo"),
                  content: Text("Cập nhật thông tin hiến máu thất bại $ex"),
                  actions: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("Đóng"),
                    )
                  ],
                ),
              ));
    }
  }

  @override
  void initState() {
    super.initState();
    var base64 = base64Decode(widget.base64);
    //base64.encode(base64);
    json = utf8.decode(base64);
    var obj = jsonDecode(json);
    id = (obj["formId"]).toString();
    getInfo(id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.gray200,
      appBar: AppBar(
        title: Text("Cập nhật đăng ký"),
        centerTitle: true,
      ),
      body: isLoading == true
          ? Center(child: CircularProgressIndicator())
          : Container(
              width: Get.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    offset: Offset(0, 0),
                    blurRadius: 0.8,
                  )
                ],
              ),
              margin: EdgeInsets.all(16).copyWith(top: 20),
              padding: EdgeInsets.all(20).copyWith(top: 20),
              child: Builder(builder: (context) {
                var userRegister = data["data"]["attributes"]["register"]
                        ["data"]["attributes"]["users_permissions_user"]["data"]
                    ["attributes"];
                var bloodGroup = data["data"]["attributes"]["register"]["data"]
                    ["attributes"]["blood_group"]["data"]["attributes"];
                print(userRegister);
                return ListView(
                  //  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      child: Text(
                        "Thông tin người đăng ký",
                        textAlign: TextAlign.center,
                        style: AppStyle.txtRobotoRegular20.copyWith(
                          color: ColorConstant.black900,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CommonImageView(
                              width: 250,
                              height: 200,
                              fit: BoxFit.cover,
                              url: userRegister["avatar"]["data"] != null
                                  ? "${AppConstants.APP_BASE_URL}${userRegister["avatar"]["data"]["attributes"]["url"]}"
                                  : "")
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    InfoUser("Họ và tên", userRegister["FullName"]),
                    InfoUser("Địa chỉ", userRegister["address"]),
                    InfoUser("Số điện thoại", userRegister["PhoneNumber"]),
                    InfoUser("Ngày sinh", userRegister["DateofBirth"]),
                    InfoUser("Nhóm máu đăng ký", bloodGroup["name"]),
                    Container(
                      margin: EdgeInsets.all(10).copyWith(bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [Text("Thông tin đăng ký")],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(8),
                      child: entryField(
                        "Thể tích",
                        controller: controllerCapacity,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(8),
                      child: FindDropdown(
                        items: (hospitals["data"] as List)
                            .map((e) => (e["attributes"]["Name"]).toString())
                            .toList(),
                        label: "Bệnh viện",
                        searchHint: "Tìm kiếm",
                        labelStyle: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                        onChanged: (item) {
                          var id = "";
                          var itemSelect = (hospitals["data"] as List).where(
                              (e) =>
                                  e["attributes"]["Name"] == item.toString());

                          // hospitalItem = itemSelect["id"];
                          hospitalItem =
                              (itemSelect.toList()[0]["id"]).toString();
                        },
                        selectedItem: (hospitals["data"] as List)[0]
                                ["attributes"]["Name"]
                            .toString(),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      child: ElevatedButton(
                        child: Text("Cập nhật"),
                        onPressed: handleUpdate,
                      ),
                    ),
                    SizedBox(
                      height: 100,
                    )
                  ],
                );
              }),
            ),
    );
  }

  Container InfoUser(String title, String value) {
    return Container(
      margin: EdgeInsets.all(8),
      child: Row(
        children: [
          SizedBox(
            child: Text("$title :"),
          ),
          SizedBox(
            width: 10,
          ),
          Flexible(
            child: Text(
              value,
              style: AppStyle.txtBeVietnamProSemiBold14,
            ),
          )
        ],
      ),
    );
  }
}

Widget entryField(
  String title, {
  bool isPassword = false,
  bool allowNull = false,
  String hintText = "Nhập...",
  TextEditingController? controller,
  bool readOnly = false,
  Widget? suffixIcon,
  GestureTapCallback? onTap,
}) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 5),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          transform: Matrix4.translationValues(-2, 10, 0),
          child: RichText(
            text: TextSpan(
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
              children: [
                TextSpan(
                  text: title,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                !allowNull == true
                    ? const TextSpan(
                        text: " *",
                        style: TextStyle(
                          color: Color(0xffFF0000),
                        ),
                      )
                    : const TextSpan()
              ],
            ),
          ),
        ),
        TextField(
          keyboardType: TextInputType.number,
          onTap: onTap,
          readOnly: readOnly,
          controller: controller,
          obscureText: isPassword,
          decoration: InputDecoration(
            suffixIcon: suffixIcon,
            hintText: hintText,
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xffE2E8F8),
              ),
            ),
          ),
        )
      ],
    ),
  );
}
