import 'package:bloodapp2/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  CustomButton(
      {this.shape,
      this.padding,
      this.variant,
      this.fontStyle,
      this.alignment,
      this.onTap,
      this.width,
      this.margin,
      this.prefixWidget,
      this.suffixWidget,
      this.text});

  ButtonShape? shape;

  ButtonPadding? padding;

  ButtonVariant? variant;

  ButtonFontStyle? fontStyle;

  Alignment? alignment;

  VoidCallback? onTap;

  double? width;

  EdgeInsetsGeometry? margin;

  Widget? prefixWidget;

  Widget? suffixWidget;

  String? text;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: _buildButtonWidget(),
          )
        : _buildButtonWidget();
  }

  _buildButtonWidget() {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: getHorizontalSize(width ?? 0),
        margin: margin,
        padding: _setPadding(),
        decoration: _buildDecoration(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            prefixWidget ?? SizedBox(),
            Text(
              text ?? "",
              textAlign: TextAlign.center,
              style: _setFontStyle(),
            ),
            suffixWidget ?? SizedBox(),
          ],
        ),
      ),
    );
  }

  _buildDecoration() {
    return BoxDecoration(
      color: _setColor(),
      border: _setBorder(),
      borderRadius: _setBorderRadius(),
    );
  }

  _setPadding() {
    switch (padding) {
      case ButtonPadding.PaddingAll3:
        return getPadding(
          all: 3,
        );
      default:
        return getPadding(
          all: 11,
        );
    }
  }

  _setColor() {
    switch (variant) {
      case ButtonVariant.FillRedA200:
        return ColorConstant.redA200;
      case ButtonVariant.OutlineRedA400:
        return ColorConstant.redA200;
      case ButtonVariant.OutlineRedA200:
        return null;
      default:
        return null;
    }
  }

  _setBorder() {
    switch (variant) {
      case ButtonVariant.OutlineRedA400:
        return Border.all(
          color: ColorConstant.redA400,
          width: getHorizontalSize(
            1.00,
          ),
        );
      case ButtonVariant.FillRedA200:
        return null;
      default:
        return Border.all(
          color: ColorConstant.redA200,
          width: getHorizontalSize(
            1.00,
          ),
        );
    }
  }

  _setBorderRadius() {
    switch (shape) {
      case ButtonShape.Square:
        return BorderRadius.circular(0);
      default:
        return BorderRadius.circular(
          getHorizontalSize(
            4.00,
          ),
        );
    }
  }

  _setFontStyle() {
    switch (fontStyle) {
      case ButtonFontStyle.BeVietnamProRegular10:
        return TextStyle(
          color: ColorConstant.gray50,
          fontSize: getFontSize(
            10,
          ),
          fontFamily: 'Be Vietnam Pro',
          fontWeight: FontWeight.w400,
        );
      case ButtonFontStyle.BeVietnamProRegular12:
        return TextStyle(
          color: ColorConstant.gray50,
          fontSize: getFontSize(
            12,
          ),
          fontFamily: 'Be Vietnam Pro',
          fontWeight: FontWeight.w400,
        );
      default:
        return TextStyle(
          color: ColorConstant.redA400,
          fontSize: getFontSize(
            12,
          ),
          fontFamily: 'Be Vietnam Pro',
          fontWeight: FontWeight.w400,
        );
    }
  }
}

enum ButtonShape {
  Square,
  RoundedBorder4,
}

enum ButtonPadding {
  PaddingAll11,
  PaddingAll3,
}

enum ButtonVariant {
  OutlineRedA200,
  FillRedA200,
  OutlineRedA400,
}

enum ButtonFontStyle {
  BeVietnamProRegular12RedA400,
  BeVietnamProRegular10,
  BeVietnamProRegular12,
}
