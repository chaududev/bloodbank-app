import 'package:bloodapp2/presentation/profile_login_screen/controller/profile_login_controller.dart';

import 'package:bloodapp2/core/app_export.dart';

import 'package:flutter/material.dart';

import '../scan_qr/scan_qr_screen.dart';

class BlooddonationRegisterOneScreen extends GetWidget<ProfileLoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    "msg_l_u_khi_ng_k".tr,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtBeVietnamProSemiBold14,
                  ),
                ),
              ),
              Container(
                width: getHorizontalSize(
                  316.00,
                ),
                margin: getMargin(
                  left: 20,
                  top: 21,
                  right: 20,
                ),
                child: Text(
                  "msg_c_c_th_ng_tin_c".tr,
                  maxLines: null,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtBeVietnamProLight12Gray800,
                ),
              ),
              Padding(
                padding: getPadding(
                  left: 20,
                  top: 31,
                  right: 20,
                ),
                child: InkWell(
                  onTap: () {
                    Get.toNamed(AppRoutes.blooddonationRegisterScreen);
                  },
                  child: Text(
                    "lbl_t_i_hi_u".tr,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtBeVietnamProRegular12RedA400,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  controller.logout();
                  // Get.to(QRScanScreen());
                },
                child: Text('Đăng xuất'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
