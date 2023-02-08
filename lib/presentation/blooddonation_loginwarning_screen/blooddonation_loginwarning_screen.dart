import 'package:bloodapp2/presentation/profile_login_screen/profile_login_screen.dart';

import 'controller/blooddonation_loginwarning_controller.dart';
import 'package:bloodapp2/core/app_export.dart';

import 'package:flutter/material.dart';

class BlooddonationLoginwarningScreen
    extends GetWidget<BlooddonationLoginwarningController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.whiteA700,
        body: Container(
          width: size.width,
          child: Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: getPadding(
                      left: 20,
                      top: 30,
                      right: 20,
                    ),
                    child: Text(
                      "msg_ng_nh_p_c_p".tr,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtBeVietnamProSemiBold14,
                    ),
                  ),
                ),
                Container(
                  width: getHorizontalSize(
                    325.00,
                  ),
                  margin: getMargin(
                    left: 20,
                    top: 20,
                    right: 20,
                  ),
                  child: Text(
                    "msg_nh_n_th_ng_b_o_khi".tr,
                    maxLines: null,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtBeVietnamProLight12Gray800,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.to(LoginScreen());
                  },
                  child: Padding(
                    padding: getPadding(
                      left: 20,
                      top: 34,
                      right: 20,
                    ),
                    child: Text(
                      "lbl_ng_nh_p_ngay".tr,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtBeVietnamProRegular12RedA400,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
