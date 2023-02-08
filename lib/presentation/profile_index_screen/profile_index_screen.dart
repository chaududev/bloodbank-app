import 'package:bloodapp2/presentation/profile_login_screen/controller/profile_login_controller.dart';

import 'package:bloodapp2/core/app_export.dart';
import 'package:flutter/material.dart';

class ProfileIndexScreen extends GetWidget<ProfileLoginController> {
  @override
  Widget build(BuildContext context) {
    var user = controller.userObjs.value;
    dynamic userImg = controller.user.value;
    // print(userImg["avatar"]["url"]);
    return Scaffold(
        //appBar: AppBar(title: ),
        backgroundColor: ColorConstant.whiteA700,
        body: Container(
            width: size.width,
            child: SingleChildScrollView(
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                  Container(
                      height: getVerticalSize(559.00),
                      width: size.width,
                      child:
                          Stack(alignment: Alignment.bottomCenter, children: [
                        Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                                height: getVerticalSize(77.00),
                                width: size.width,
                                margin: getMargin(bottom: 10),
                                decoration: AppDecoration.fillRedA200,
                                child: Stack(children: [
                                  Align(
                                      alignment: Alignment.centerRight,
                                      child: Padding(
                                          padding: getPadding(
                                              left: 20,
                                              top: 28,
                                              right: 20,
                                              bottom: 28),
                                          child: CommonImageView(
                                              svgPath: ImageConstant.imgMail,
                                              height: getSize(20.00),
                                              width: getSize(20.00))))
                                ]))),
                        Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                                padding:
                                    getPadding(left: 20, top: 10, right: 20),
                                child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                          height: getSize(94.00),
                                          width: getSize(94.00),
                                          margin:
                                              getMargin(left: 10, right: 10),
                                          child: Stack(
                                              alignment: Alignment.bottomRight,
                                              children: [
                                                Align(
                                                  alignment: Alignment.center,
                                                  child: Padding(
                                                    padding:
                                                        getPadding(right: 1),
                                                    child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                getHorizontalSize(
                                                                    47.00)),
                                                        child: CommonImageView(
                                                            url: userImg[
                                                                        "avatar"] !=
                                                                    null
                                                                ? "${AppConstants.APP_BASE_URL}${userImg["avatar"]["url"]}"
                                                                : "https://ps.w.org/user-avatar-reloaded/assets/icon-256x256.png?rev=2540745",
                                                            height:
                                                                getSize(94.00),
                                                            width:
                                                                getSize(94.00),
                                                            fit: BoxFit.cover)),
                                                  ),
                                                ),
                                                Align(
                                                    alignment:
                                                        Alignment.bottomRight,
                                                    child: Padding(
                                                        padding: getPadding(
                                                            left: 10, top: 10),
                                                        child: CommonImageView(
                                                            imagePath:
                                                                ImageConstant
                                                                    .imgImage10,
                                                            height:
                                                                getSize(20.00),
                                                            width: getSize(
                                                                20.00))))
                                              ])),
                                      Padding(
                                          padding: getPadding(
                                              left: 10, top: 9, right: 10),
                                          child: Text(
                                              user.user!.fullName ??
                                                  "Không xác định",
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle
                                                  .txtBeVietnamProSemiBold12Gray800)),
                                      Padding(
                                          padding: getPadding(
                                              left: 10, top: 10, right: 10),
                                          child: Text("msg_th_nh_vi_n_nhi_t".tr,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle
                                                  .txtBeVietnamProRegular10RedA200)),
                                      Padding(
                                          padding: getPadding(
                                              left: 10, top: 39, right: 10),
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    Get.toNamed(
                                                        "/history_sign");
                                                  },
                                                  child: Padding(
                                                      padding: getPadding(
                                                          top: 1, bottom: 2),
                                                      child: Text(
                                                          "msg_nh_t_k_hi_n_m_u"
                                                              .tr,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: AppStyle
                                                              .txtBeVietnamProRegular12Gray800)),
                                                ),
                                                CommonImageView(
                                                    svgPath: ImageConstant
                                                        .imgIconarrowright,
                                                    height: getSize(20.00),
                                                    width: getSize(20.00))
                                              ])),
                                      Align(
                                          alignment: Alignment.centerLeft,
                                          child: Container(
                                              height: getVerticalSize(1.00),
                                              width: getHorizontalSize(335.00),
                                              margin: getMargin(top: 10),
                                              decoration: BoxDecoration(
                                                  color:
                                                      ColorConstant.gray200))),
                                      Padding(
                                          padding: getPadding(
                                              left: 10, top: 10, right: 10),
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                    padding: getPadding(
                                                        top: 2, bottom: 1),
                                                    child: Text(
                                                        "lbl_setting".tr,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: AppStyle
                                                            .txtBeVietnamProRegular12Gray800)),
                                                CommonImageView(
                                                    svgPath: ImageConstant
                                                        .imgIconarrowright,
                                                    height: getSize(20.00),
                                                    width: getSize(20.00))
                                              ])),
                                      Align(
                                          alignment: Alignment.centerLeft,
                                          child: Padding(
                                              padding: getPadding(
                                                  top: 39, right: 10),
                                              child: Text(
                                                  "msg_b_nh_vi_n_th_nh".tr,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle
                                                      .txtBeVietnamProSemiBold12Gray800))),
                                      Padding(
                                          padding: getPadding(
                                              left: 10, top: 20, right: 10),
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                    padding: getPadding(
                                                        top: 1, bottom: 2),
                                                    child: Text(
                                                        "msg_t_o_hi_n_m_u_kh_n"
                                                            .tr,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: AppStyle
                                                            .txtBeVietnamProRegular12Gray800)),
                                                CommonImageView(
                                                    svgPath: ImageConstant
                                                        .imgIconarrowright,
                                                    height: getSize(20.00),
                                                    width: getSize(20.00))
                                              ])),
                                      Align(
                                          alignment: Alignment.centerLeft,
                                          child: Container(
                                              height: getVerticalSize(1.00),
                                              width: getHorizontalSize(335.00),
                                              margin: getMargin(top: 10),
                                              decoration: BoxDecoration(
                                                  color:
                                                      ColorConstant.gray200))),
                                      Padding(
                                          padding: getPadding(
                                              left: 10, top: 10, right: 10),
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                    padding: getPadding(
                                                        top: 1, bottom: 2),
                                                    child: Text(
                                                        "msg_t_o_s_ki_n_hi_n"
                                                            .tr,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: AppStyle
                                                            .txtBeVietnamProRegular12Gray800)),
                                                CommonImageView(
                                                    svgPath: ImageConstant
                                                        .imgIconarrowright,
                                                    height: getSize(20.00),
                                                    width: getSize(20.00))
                                              ])),
                                      Align(
                                          alignment: Alignment.centerLeft,
                                          child: Container(
                                              height: getVerticalSize(1.00),
                                              width: getHorizontalSize(335.00),
                                              margin: getMargin(top: 10),
                                              decoration: BoxDecoration(
                                                  color:
                                                      ColorConstant.gray200))),
                                      Padding(
                                          padding: getPadding(
                                              left: 10, top: 10, right: 10),
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                    padding: getPadding(
                                                        top: 1, bottom: 3),
                                                    child: Text(
                                                        "lbl_vi_t_tin_t_c".tr,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: AppStyle
                                                            .txtBeVietnamProRegular12Gray800)),
                                                CommonImageView(
                                                    svgPath: ImageConstant
                                                        .imgIconarrowright,
                                                    height: getSize(20.00),
                                                    width: getSize(20.00))
                                              ])),
                                      Align(
                                          alignment: Alignment.centerLeft,
                                          child: Container(
                                              height: getVerticalSize(1.00),
                                              width: getHorizontalSize(335.00),
                                              margin: getMargin(top: 10),
                                              decoration: BoxDecoration(
                                                  color:
                                                      ColorConstant.gray200))),
                                      Padding(
                                          padding: getPadding(
                                              left: 10, top: 10, right: 10),
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                    padding: getPadding(
                                                        top: 2, bottom: 1),
                                                    child: Text("lbl_qu_n_l".tr,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: AppStyle
                                                            .txtBeVietnamProRegular12Gray800)),
                                                CommonImageView(
                                                    svgPath: ImageConstant
                                                        .imgIconarrowright,
                                                    height: getSize(20.00),
                                                    width: getSize(20.00))
                                              ])),
                                      InkWell(
                                        onTap: () {
                                          showDialog(
                                              context: context,
                                              builder: ((context) =>
                                                  AlertDialog(
                                                    title: Text("Thông báo"),
                                                    content: Container(
                                                      width: Get.width * 0.8,
                                                      child: Text(
                                                        "Bạn chắc chắn muốn đăng xuất ?",
                                                      ),
                                                    ),
                                                    actions: [
                                                      OutlinedButton(
                                                          style: OutlinedButton
                                                              .styleFrom(
                                                            side: BorderSide(
                                                              width: 1,
                                                              color: Color(
                                                                  0xffFF576E),
                                                            ),
                                                          ),
                                                          onPressed: () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: Text(
                                                            "Đóng",
                                                          )),
                                                      ElevatedButton(
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                          controller.logout();
                                                        },
                                                        child: Text("Đồng ý"),
                                                      )
                                                    ],
                                                  )));
                                          //controller.logout();
                                        },
                                        child: Padding(
                                            padding: getPadding(
                                                left: 10, top: 51, right: 10),
                                            child: Text("lbl_ng_xu_t".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle
                                                    .txtBeVietnamProRegular12RedA400)),
                                      )
                                    ])))
                      ])),
                ]))));
  }

  onTapIconBlood() {
    Get.toNamed(AppRoutes.blooddonationLoginwarningScreen);
  }
}
