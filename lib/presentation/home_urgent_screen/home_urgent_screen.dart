import 'controller/home_urgent_controller.dart';
import 'package:bloodapp2/core/app_export.dart';
import 'package:bloodapp2/widgets/app_bar/appbar_image.dart';
import 'package:bloodapp2/widgets/app_bar/appbar_title.dart';
import 'package:bloodapp2/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';

class HomeUrgentScreen extends GetWidget<HomeUrgentController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.whiteA700,
            appBar: CustomAppBar(
                height: getVerticalSize(77.00),
                centerTitle: true,
                title: Container(
                    decoration: AppDecoration.fillRedA200,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          AppbarImage(
                              height: getSize(20.00),
                              width: getSize(20.00),
                              svgPath: ImageConstant.imgArrowleft20x20,
                              margin: getMargin(left: 20, top: 29, bottom: 28),
                              onTap: onTapArrowleft),
                          AppbarTitle(
                              text: "msg_c_n_m_u_kh_n_c_p".tr,
                              margin: getMargin(
                                  left: 73, top: 28, right: 113, bottom: 27))
                        ])),
                styleType: Style.bgFillRedA200),
            body: Container(
                width: size.width,
                child: SingleChildScrollView(
                    child: Padding(
                        padding: getPadding(
                            left: 20, top: 20, right: 20, bottom: 532),
                        child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              GestureDetector(
                                  onTap: () {
                                    onTapNewsItem();
                                  },
                                  child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              getHorizontalSize(4.00))),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            CommonImageView(
                                                imagePath: ImageConstant
                                                    .imgRectangle20,
                                                height: getSize(100.00),
                                                width: getSize(100.00)),
                                            Padding(
                                                padding: getPadding(
                                                    top: 3, bottom: 1),
                                                child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Container(
                                                          width:
                                                              getHorizontalSize(
                                                                  222.00),
                                                          child: Text(
                                                              "msg_c_n_g_p_nh_m_m_u"
                                                                  .tr,
                                                              maxLines: null,
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              style: AppStyle
                                                                  .txtBeVietnamProSemiBold12Gray800)),
                                                      Align(
                                                          alignment:
                                                              Alignment.center,
                                                          child: Container(
                                                              width:
                                                                  getHorizontalSize(
                                                                      221.00),
                                                              margin: getMargin(
                                                                  top: 13,
                                                                  right: 1),
                                                              child: Text(
                                                                  "msg_arcu_nisi_convallis"
                                                                      .tr,
                                                                  maxLines:
                                                                      null,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  style: AppStyle
                                                                      .txtBeVietnamProRegular12Gray800))),
                                                      Padding(
                                                          padding: getPadding(
                                                              top: 14,
                                                              right: 10),
                                                          child: Text(
                                                              "lbl_5_ph_t_tr_c"
                                                                  .tr,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              style: AppStyle
                                                                  .txtBeVietnamProRegular10Gray400))
                                                    ]))
                                          ]))),
                              Align(
                                  alignment: Alignment.center,
                                  child: GestureDetector(
                                      onTap: () {
                                        onTapNewsItem1();
                                      },
                                      child: Container(
                                          margin: getMargin(top: 10, right: 1),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      getHorizontalSize(4.00))),
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                CommonImageView(
                                                    imagePath: ImageConstant
                                                        .imgRectangle20100x100,
                                                    height: getSize(100.00),
                                                    width: getSize(100.00)),
                                                Padding(
                                                    padding: getPadding(
                                                        top: 9, bottom: 9),
                                                    child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Padding(
                                                              padding:
                                                                  getPadding(
                                                                      right:
                                                                          10),
                                                              child: Text(
                                                                  "msg_nh_ng_l_u_tr_c"
                                                                      .tr,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  style: AppStyle
                                                                      .txtBeVietnamProSemiBold12Gray800)),
                                                          Container(
                                                              width:
                                                                  getHorizontalSize(
                                                                      221.00),
                                                              margin: getMargin(
                                                                  top: 12),
                                                              child: Text(
                                                                  "msg_arcu_nisi_convallis"
                                                                      .tr,
                                                                  maxLines:
                                                                      null,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  style: AppStyle
                                                                      .txtBeVietnamProRegular12Gray800)),
                                                          Padding(
                                                              padding:
                                                                  getPadding(
                                                                      top: 14,
                                                                      right:
                                                                          10),
                                                              child: Text(
                                                                  "lbl_5_ph_t_tr_c"
                                                                      .tr,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  style: AppStyle
                                                                      .txtBeVietnamProRegular10Gray400))
                                                        ]))
                                              ]))))
                            ]))))));
  }

  onTapNewsItem() {
    Get.toNamed(AppRoutes.homeUrgentdetailScreen);
  }

  onTapNewsItem1() {
    Get.toNamed(AppRoutes.homeUrgentdetailScreen);
  }

  onTapArrowleft() {
    Get.back();
  }
}
