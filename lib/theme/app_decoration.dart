import 'package:flutter/material.dart';
import 'package:bloodapp2/core/app_export.dart';

class AppDecoration {
  static BoxDecoration get outlineGray200 => BoxDecoration(
        color: ColorConstant.gray50,
        border: Border.all(
          color: ColorConstant.gray200,
          width: getHorizontalSize(
            1.00,
          ),
        ),
      );
  static BoxDecoration get fillRedA200 => BoxDecoration(
        color: ColorConstant.redA200,
      );
  static BoxDecoration get fillGray50 => BoxDecoration(
        color: ColorConstant.gray50,
      );
  static BoxDecoration get fillBlack9002b => BoxDecoration(
        color: ColorConstant.black9002b,
      );
  static BoxDecoration get outlineGray2001 => BoxDecoration(
        color: ColorConstant.gray50,
        border: Border.all(
          color: ColorConstant.gray200,
          width: getHorizontalSize(
            1.00,
          ),
        ),
      );
  static BoxDecoration get txtFillRedA200 => BoxDecoration(
        color: ColorConstant.redA200,
      );
  static BoxDecoration get outlineWhiteA700 => BoxDecoration(
        color: ColorConstant.redA400,
        border: Border.all(
          color: ColorConstant.whiteA700,
          width: getHorizontalSize(
            3.00,
          ),
        ),
      );
  static BoxDecoration get fillWhiteA700 => BoxDecoration(
        color: ColorConstant.whiteA700,
      );
  static BoxDecoration get outlineWhiteA7001 => BoxDecoration(
        color: ColorConstant.redA200,
        border: Border.all(
          color: ColorConstant.whiteA700,
          width: getHorizontalSize(
            3.00,
          ),
        ),
      );
}

class BorderRadiusStyle {
  static BorderRadius roundedBorder6 = BorderRadius.circular(
    getHorizontalSize(
      6.00,
    ),
  );

  static BorderRadius circleBorder47 = BorderRadius.circular(
    getHorizontalSize(
      47.00,
    ),
  );

  static BorderRadius circleBorder40 = BorderRadius.circular(
    getHorizontalSize(
      40.00,
    ),
  );

  static BorderRadius roundedBorder20 = BorderRadius.circular(
    getHorizontalSize(
      20.00,
    ),
  );
}
