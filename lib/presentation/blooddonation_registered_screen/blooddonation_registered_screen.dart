import 'package:bloodapp2/presentation/home_index_screen/home_index_screen.dart';
import 'package:bloodapp2/presentation/profile_login_screen/controller/profile_login_controller.dart';

import 'controller/blooddonation_registered_controller.dart';
import 'package:bloodapp2/core/app_export.dart';
import 'package:bloodapp2/widgets/custom_switch.dart';
import 'package:flutter/material.dart';

class BlooddonationRegisteredScreen
    extends GetView<BlooddonationRegisteredController> {
  var userController = Get.find<ProfileLoginController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.whiteA700,
      appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Đồng ý hiến máu",
          )
          //   styleType: Style.bgFillRedA200,
          ),
      body: Container(
        width: size.width,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: getPadding(
                    left: 20,
                    top: 29,
                    right: 20,
                  ),
                  child: Obx(() {
                    return Text(
                      userController.userObjs.value.user!.fullName ?? "",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtBeVietnamProSemiBold14,
                    );
                  }),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: double.infinity,
                  margin: getMargin(
                    left: 20,
                    top: 20,
                    right: 20,
                  ),
                  decoration: AppDecoration.outlineGray200.copyWith(
                    borderRadius: BorderRadiusStyle.roundedBorder6,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: getPadding(
                          left: 20,
                          top: 9,
                          right: 20,
                        ),
                        child: Obx(() {
                          return Text(
                            "SĐT:${userController.userObjs.value.user!.phoneNumber ?? ""}",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtBeVietnamProRegular12Gray800,
                          );
                        }),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          margin: getMargin(
                            left: 20,
                            top: 10,
                            right: 20,
                            bottom: 13,
                          ),
                          child: Text(
                            "msg_auctor_tincidunt".tr,
                            maxLines: null,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtBeVietnamProRegular12Gray800,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: getPadding(
                    left: 20,
                    top: 20,
                    right: 20,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CommonImageView(
                        imagePath: ImageConstant.imgImage5,
                        height: getSize(
                          50.00,
                        ),
                        width: getSize(
                          50.00,
                        ),
                      ),
                      Padding(
                        padding: getPadding(
                          left: 10,
                        ),
                        child: CommonImageView(
                          imagePath: ImageConstant.imgImage7,
                          height: getSize(
                            50.00,
                          ),
                          width: getSize(
                            50.00,
                          ),
                        ),
                      ),
                      Padding(
                        padding: getPadding(
                          left: 10,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(
                            getHorizontalSize(
                              6.00,
                            ),
                          ),
                          child: CommonImageView(
                            svgPath: ImageConstant.imgClose,
                            height: getSize(
                              50.00,
                            ),
                            width: getSize(
                              50.00,
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: getPadding(
                    left: 20,
                    top: 20,
                    right: 20,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Obx(
                        () => CustomSwitch(
                          value: controller.isSelectedSwitch.value,
                          onChanged: (value) {
                            controller.isSelectedSwitch.value = value;
                          },
                        ),
                      ),
                      Padding(
                        padding: getPadding(
                          left: 14,
                          top: 7,
                          bottom: 8,
                        ),
                        child: Text(
                          "msg_nh_n_th_ng_b_o_hi_n".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtBeVietnamProRegular12Black900,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: getPadding(
                    left: 20,
                    top: 20,
                    right: 20,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Obx(
                        () => CustomSwitch(
                          value: controller.isSelectedSwitch1.value,
                          onChanged: (value) {
                            controller.isSelectedSwitch1.value = value;
                          },
                        ),
                      ),
                      Padding(
                        padding: getPadding(
                          left: 14,
                          top: 7,
                          bottom: 8,
                        ),
                        child: Text(
                          "msg_nh_n_th_ng_b_o_s".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtBeVietnamProRegular12Black900,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              controller.obx(
                  (state) => ElevatedButton(
                        child: Text(
                            "Huỷ đăng ký thành công, về trang chủ để tiếp tục"),
                        onPressed: () {
                          Get.offAll(HomeIndexScreen());
                        },
                      ),
                  onLoading: ElevatedButton(
                    onPressed: () {},
                    child: CircularProgressIndicator(),
                  ),
                  onEmpty: ElevatedButton(
                    onPressed: () {
                      // controller.cancelRegister();
                      Get.off(HomeIndexScreen());
                    },
                    child: Text(
                      "Trở về",
                      //  overflow: TextOverflow.ellipsis,
                      //  textAlign: TextAlign.left,
                      // style: AppStyle.txtBeVietnamProRegular12RedA400,
                    ),
                  ),
                  onError: ((error) => Text(
                        error.toString(),
                        style: AppStyle.txtBeVietnamProRegular12RedA400,
                      )))
            ],
          ),
        ),
      ),
    );
  }
}
