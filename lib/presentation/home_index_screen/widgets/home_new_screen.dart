import 'package:bloodapp2/core/utils/size_utils.dart';
import 'package:bloodapp2/presentation/home_index_screen/models/new_model.dart';
import 'package:bloodapp2/presentation/home_newsdetail_screen/home_newsdetail_screen.dart';
import 'package:bloodapp2/routes/app_routes.dart';
import 'package:bloodapp2/theme/app_style.dart';
import 'package:bloodapp2/widgets/common_image_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class HomeEventNew extends StatelessWidget {
  HomeEventNew({Key? key, required this.newEventModel}) : super(key: key);
  NewEventModel newEventModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          //  onTapNewsItem();
          Get.to(HomeNewsdetailScreen(
            model: newEventModel,
          ));
        },
        child: Container(
            margin: getMargin(top: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(getHorizontalSize(4.00))),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  CommonImageView(
                    url: newEventModel.path,
                    fit: BoxFit.cover,
                    height: getSize(100.00),
                    width: getSize(105.00),
                  ),
                  Container(
                      padding: getPadding(top: 3, bottom: 1),
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                                width: getHorizontalSize(225.00),
                                child: Text(newEventModel.title,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle
                                        .txtBeVietnamProSemiBold12Gray800)),
                            Align(
                                alignment: Alignment.center,
                                child: Container(
                                    width: getHorizontalSize(221.00),
                                    margin: getMargin(top: 8, right: 3),
                                    child: Text(newEventModel.decription,
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle
                                            .txtBeVietnamProRegular12Gray800))),
                            Padding(
                              padding: getPadding(top: 8, right: 10),
                              child: Text(
                                newEventModel.lastTimePublic,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtBeVietnamProRegular10Gray400,
                              ),
                            )
                          ]))
                ])));
  }

  onTapNewsItem() {
    Get.toNamed(AppRoutes.homeNewsdetailScreen);
  }

  onTapNewsItem1() {
    Get.toNamed(AppRoutes.homeNewsdetailScreen);
  }
}
