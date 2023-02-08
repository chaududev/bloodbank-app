//import 'dart:io';

import 'package:bloodapp2/core/app_export.dart';
import 'package:bloodapp2/presentation/home_index_screen/models/new_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import 'controller/home_newsdetail_controller.dart';

// ignore: must_be_immutable
class HomeNewsdetailScreen extends GetView<HomeNewsdetailController> {
  HomeNewsdetailScreen({Key? key, required this.model}) : super(key: key);
  NewEventModel model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tin tức chi tiết"),
        backgroundColor: ColorConstant.redA200,
      ),
      body: ListView(
        children: [
          Container(
            height: 250,
            child: CommonImageView(url: model.path),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0).copyWith(bottom: 0),
            child: Text(
              model.title,
              style: AppStyle.txtBeVietnamProSemiBold14Black900.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0).copyWith(top: 8),
            child: Text(
              model.lastTimePublic,
              style: AppStyle.txtBeVietnamProRegular10
                  .copyWith(color: Colors.grey.withOpacity(1)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0).copyWith(top: 8),
            child: Text(
              model.decription,
              style: AppStyle.txtBeVietnamProSemiBold14Black900,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0).copyWith(bottom: 0),
            child: Html(
                data: model.content.replaceAll('<img src=\"/uploads',
                    '<img src=\"${AppConstants.APP_BASE_URL}/uploads'),
               // tagsList: Html.tags
               //   ..remove(Platform.isAndroid ? "iframe" : "video"),
                style: {
                  // tables will have the below background color
                  "table": Style(
                    backgroundColor: Color.fromARGB(0x50, 0xee, 0xee, 0xee),
                  ),
                  // some other granular customizations are also possible
                  "img": Style(
                    width: Get.width,
                    height: 300,
                  ),
                  "p": Style(
                    color: ColorConstant.black900,
                    fontSize: FontSize.small,
                    fontFamily: 'Be Vietnam Pro',
                    fontWeight: FontWeight.w400,
                  )
                  // text that renders h1 elements will be red
                }),
          ),
        ],
      ),
    );
  }
}
