import 'package:bloodapp2/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomRadioButton extends StatelessWidget {
  CustomRadioButton(
      {this.shape,
      this.padding,
      this.fontStyle,
      this.margin,
      this.onChange,
      this.iconSize,
      this.value,
      this.groupValue,
      this.text});

  RadioShape? shape;

  RadioPadding? padding;

  RadioFontStyle? fontStyle;

  EdgeInsetsGeometry? margin;

  Function(String)? onChange;

  double? iconSize;

  String? value;

  String? groupValue;

  String? text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: InkWell(
        onTap: () {
          onChange!(value!);
        },
        child: Row(
          children: [
            SizedBox(
              height: getHorizontalSize(iconSize ?? 0),
              width: getHorizontalSize(iconSize ?? 0),
              child: Radio<String>(
                value: value ?? "",
                groupValue: groupValue,
                onChanged: (value) {
                  onChange!(value!);
                },
              ),
            ),
            Padding(
              padding: getPadding(
                left: 10,
              ),
              child: Text(
                text ?? "",
                textAlign: TextAlign.center,
                style: _setFontStyle(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _setFontStyle() {
    switch (fontStyle) {
      default:
        return TextStyle(
          color: ColorConstant.gray800,
          fontSize: getFontSize(
            12,
          ),
          fontFamily: 'Be Vietnam Pro',
          fontWeight: FontWeight.w400,
        );
        ;
    }
  }
}

enum RadioShape {
  CircleBorder9,
}

enum RadioPadding {
  PaddingAll1,
}

enum RadioFontStyle {
  BeVietnamProRegular12,
}
