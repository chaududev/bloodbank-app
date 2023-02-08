import 'package:bloodapp2/presentation/profile_login_screen/models/profile_login_model.dart';
import 'package:bloodapp2/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'controller/profile_login_controller.dart';

class LoginScreen extends GetView<ProfileLoginController> {
  final ProfileLoginController userController =
      Get.put(ProfileLoginController());
  TextEditingController username = new TextEditingController();
  TextEditingController password = new TextEditingController();
  FocusNode _focus = FocusNode();
  FocusNode _focus1 = FocusNode();
  final dataKey = GlobalKey();
  var forcus = false;
  bool showPassword = false;

  final profileLoginController = Get.put(ProfileLoginController());
  _handleLogin(String user, String password) {
    print("login");
    profileLoginController.login(
      PayLoadLogin(identifier: user, password: password),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(color: Colors.white),
      child: ListView(
        children: [
          SizedBox(
            height: 30,
          ),
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(left: 16, right: 16, top: 15, bottom: 16),
            child: SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Blood bank xin chào!",
                    style: GoogleFonts.aBeeZee(
                      color: Color(0xffb20000),
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Hãy đăng nhập để thực hiện thao tác.",
                    style: GoogleFonts.mulish(
                      height: 2,
                      color: Color.fromARGB(255, 107, 106, 106),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
            child: Container(),
          ),
          SizedBox(
            child: Container(
              padding: EdgeInsets.only(
                left: 16,
                right: 16,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextFormField(
                    focusNode: _focus1,
                    key: dataKey,
                    controller: username,
                    onTap: () {},
                    decoration: InputDecoration(
                      label: Text("Tài khoản"),
                      prefixIcon: Icon(Icons.account_box_rounded),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    obscureText: !showPassword,
                    focusNode: _focus,
                    controller: password,
                    onTap: () {},
                    decoration: InputDecoration(
                        label: const Text("Mật khẩu"),
                        prefixIcon: Icon(Icons.lock_outline),
                        suffixIcon: IconButton(
                          icon: Icon(showPassword == true
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () => {

                          },
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        )),
                  ),
                  SizedBox(
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "Quên mật khẩu?",
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: ElevatedButton(
                      onPressed: () {
                        _handleLogin(username.text, password.text);
                      },
                      child: controller.obx(
                        (state) => Text(
                          "Đăng nhập".toUpperCase(),
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        onEmpty: Text(
                          "Đăng nhập".toUpperCase(),
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        onLoading: Container(
                          child: Center(
                              child: CircularProgressIndicator(
                            color: Colors.white,
                          )),
                          //  height: Get.height,
                        ),
                        onError: (error) => Text(error.toString()),
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        minimumSize: const Size.fromHeight(50),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            child: TextButton(
              onPressed: () {
                Get.toNamed(AppRoutes.profileRegisterScreen);
              },
              child: RichText(
                text: TextSpan(
                    style: TextStyle(
                      color: Color(0xffb20000),
                    ),
                    text: "Bạn chưa có tài khoản Blood bank?",
                    children: [
                      TextSpan(
                          text: "  Đăng ký ngay",
                          style: TextStyle(
                            color: Color.fromARGB(255, 21, 130, 218),
                            decoration: TextDecoration.underline,
                          ))
                    ]),
              ),
            ),
          )
        ],
      ),
    ));
  }
}

class ButtonLogin extends StatelessWidget {
  ButtonLogin({Key? key, required this.provider, required this.pathIcon})
      : super(key: key);
  String provider;
  String pathIcon;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        minimumSize: const Size.fromHeight(50),
      ),
      onPressed: () {},
      child: Container(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Image.asset(
              pathIcon,
              fit: BoxFit.contain,
            ),
            SizedBox(width: 8),
            Text(
              provider,
              style: TextStyle(
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
