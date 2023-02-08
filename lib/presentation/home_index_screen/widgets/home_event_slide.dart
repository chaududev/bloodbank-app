import 'package:bloodapp2/presentation/home_index_screen/models/new_model.dart';
import 'package:bloodapp2/presentation/home_newsdetail_screen/home_newsdetail_screen.dart';

import '../controller/home_index_controller.dart';
import '../models/slide_event_home.dart';
import 'package:bloodapp2/core/app_export.dart';
import 'package:bloodapp2/widgets/custom_button.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SliderNewEvent extends StatelessWidget {
  SliderNewEvent(this.ModelEventSlideObj);

  // ignore: non_constant_identifier_names
  ModelEventSlide ModelEventSlideObj;

  var controller = Get.find<HomeIndexController>();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(HomeNewsdetailScreen(
          model: NewEventModel(
            title: ModelEventSlideObj.title ?? "",
            path: ModelEventSlideObj.path,
            lastTimePublic:
                "${ModelEventSlideObj.time} - ${ModelEventSlideObj.type}",
            content: ModelEventSlideObj.content ?? "",
            decription: ModelEventSlideObj.description ?? "",
          ),
        ));
      },
      child: Container(
        // height: 500,
        decoration: AppDecoration.fillBlack9002b.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder6,
            image: DecorationImage(
              image: NetworkImage(ModelEventSlideObj.path),
              fit: BoxFit.cover,
            )),
        child: Column(
          //  mainAxisSize: MainAxisSize.min,
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomButton(
              width: 80,
              text: ModelEventSlideObj.type,
              margin: getMargin(
                left: 8,
                top: 8,
                right: 10,
              ),
              variant: ButtonVariant.FillRedA200,
              padding: ButtonPadding.PaddingAll3,
              fontStyle: ButtonFontStyle.BeVietnamProRegular10,
              alignment: Alignment.centerLeft,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: getPadding(
                  left: 247,
                  top: 38,
                  right: 8,
                ),
                child: Text(
                  ModelEventSlideObj.time as String,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtBeVietnamProRegular10Gray50,
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: getPadding(
                  left: 65,
                  top: 3,
                  right: 8,
                  bottom: 6,
                ),
                child: Text(
                  ModelEventSlideObj.title as String,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtBeVietnamProSemiBold12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
