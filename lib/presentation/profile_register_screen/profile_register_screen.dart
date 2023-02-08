import 'controller/profile_register_controller.dart';
import 'package:bloodapp2/core/app_export.dart';
import 'package:bloodapp2/widgets/custom_button.dart';
import 'package:bloodapp2/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class ProfileRegisterScreen extends GetView<ProfileRegisterController> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Đăng ký"),
      ),
      backgroundColor: ColorConstant.whiteA700,
      body: Container(
        width: size.width,
        child: controller.obx(
          (state) {
            return Form(
                key: _formKey,
                child: ListView(
                    // mainAxisSize: MainAxisSize.min,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: getPadding(left: 20, top: 39, right: 20),
                          child: Text("lbl_email".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtBeVietnamProSemiBold12Gray800),
                        ),
                      ),
                      CustomTextFormField(
                          validator: (value) => controller.valUsername(value),
                          width: 335,
                          focusNode: FocusNode(),
                          controller: controller.emailController,
                          hintText: "lbl_placeholer".tr,
                          margin: getMargin(left: 20, top: 6, right: 20)),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                              padding: getPadding(left: 20, top: 29, right: 20),
                              child: Text("lbl_m_t_kh_u".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle
                                      .txtBeVietnamProSemiBold12Gray800))),
                      CustomTextFormField(
                          width: 335,
                          focusNode: FocusNode(),
                          controller: controller.passwordController,
                          validator: (value) => controller.valPassword(value),
                          hintText: "lbl_placeholer".tr,
                          margin: getMargin(left: 20, top: 6, right: 20)),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                              padding: getPadding(left: 20, top: 29, right: 20),
                              child: Text("msg_nh_p_l_i_m_t_kh_u".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle
                                      .txtBeVietnamProSemiBold12Gray800))),
                      CustomTextFormField(
                        width: 335,
                        focusNode: FocusNode(),
                        controller: controller.repeatPasswordController,
                        hintText: "lbl_placeholer".tr,
                        margin: getMargin(left: 20, top: 6, right: 20),
                        textInputAction: TextInputAction.done,
                        validator: (value) =>
                            controller.valRepeatPassword(value),
                      ),
                      CustomButton(
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              // If the form is valid, display a snackbar. In the real world,
                              // you'd often call a server or save the information in a database.
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Processing Data'),
                                ),
                              );
                              controller.valHandleRegister();
                            }
                          },
                          width: 335,
                          text: "lbl_ng_k".tr,
                          margin: getMargin(left: 20, top: 30, right: 20)),
                      Padding(
                          padding: getPadding(left: 20, top: 42, right: 20),
                          child: Text("msg_c_t_i_kho_n".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtBeVietnamProRegular12RedA400)),
                    ]));
          },
          onLoading: Center(
            child: CircularProgressIndicator(),
          ),
          onEmpty: Form(
              key: _formKey,
              child: ListView(
                  // mainAxisSize: MainAxisSize.min,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: getPadding(left: 20, top: 39, right: 20),
                        child: Text("lbl_email".tr,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtBeVietnamProSemiBold12Gray800),
                      ),
                    ),
                    CustomTextFormField(
                        validator: (value) => controller.valUsername(value),
                        width: 335,
                        focusNode: FocusNode(),
                        controller: controller.emailController,
                        hintText: "lbl_placeholer".tr,
                        margin: getMargin(left: 20, top: 6, right: 20)),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                            padding: getPadding(left: 20, top: 29, right: 20),
                            child: Text("lbl_m_t_kh_u".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle
                                    .txtBeVietnamProSemiBold12Gray800))),
                    CustomTextFormField(
                        width: 335,
                        focusNode: FocusNode(),
                        controller: controller.passwordController,
                        validator: (value) => controller.valPassword(value),
                        hintText: "lbl_placeholer".tr,
                        margin: getMargin(left: 20, top: 6, right: 20)),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                            padding: getPadding(left: 20, top: 29, right: 20),
                            child: Text("msg_nh_p_l_i_m_t_kh_u".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle
                                    .txtBeVietnamProSemiBold12Gray800))),
                    CustomTextFormField(
                      width: 335,
                      focusNode: FocusNode(),
                      controller: controller.repeatPasswordController,
                      hintText: "lbl_placeholer".tr,
                      margin: getMargin(left: 20, top: 6, right: 20),
                      textInputAction: TextInputAction.done,
                      validator: (value) => controller.valRepeatPassword(value),
                    ),
                    CustomButton(
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            // If the form is valid, display a snackbar. In the real world,
                            // you'd often call a server or save the information in a database.
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Processing Data'),
                              ),
                            );
                            controller.valHandleRegister();
                          }
                        },
                        width: 335,
                        text: "lbl_ng_k".tr,
                        margin: getMargin(left: 20, top: 30, right: 20)),
                    Padding(
                      padding: getPadding(left: 20, top: 42, right: 20),
                      child: Text("msg_c_t_i_kho_n".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtBeVietnamProRegular12RedA400),
                    ),
                  ])),
          onError: (error) => Text(
            error.toString(),
          ),
        ),
      ),
    );
  }

  onTapIconBlood() {
    Get.toNamed(AppRoutes.blooddonationLoginwarningScreen);
  }
}
