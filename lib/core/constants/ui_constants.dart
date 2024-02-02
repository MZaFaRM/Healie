import 'package:flutter/material.dart';
import 'package:healie/core/config/theme/app_colors.dart';

const kSpacingXxs = 4.0;
const kSpacingXs = 8.0;
const kSpacingSm = 12.0;
const kSpacingMd = 16.0;
const kSpacingLg = 20.0;
const kSpacingXl = 24.0;
const kSpacing2xl = 28.0;
const kSpacing3xl = 32.0;

const kPaddingXxs = EdgeInsets.all(kSpacingXxs);
const kPaddingXs = EdgeInsets.all(kSpacingXs);
const kPaddingSm = EdgeInsets.all(kSpacingSm);
const kPaddingMd = EdgeInsets.all(kSpacingMd);
const kPaddingLg = EdgeInsets.all(kSpacingLg);
const kPaddingXl = EdgeInsets.all(kSpacingXl);
const kPadding2xl = EdgeInsets.all(kSpacing2xl);
const kPadding3xl = EdgeInsets.all(kSpacing3xl);

const kBorderRadiusXsVal = 4.0;
const kBorderRadiusSmVal = 8.0;
const kBorderRadiusMdVal = 12.0;
const kBorderRadiusLgVal = 16.0;
const kBorderRadiusXlVal = 20.0;

const kBorderRadiusXs = BorderRadius.all(Radius.circular(kBorderRadiusXsVal));
const kBorderRadiusSm = BorderRadius.all(Radius.circular(kBorderRadiusSmVal));
const kBorderRadiusMd = BorderRadius.all(Radius.circular(kBorderRadiusMdVal));
const kBorderRadiusLg = BorderRadius.all(Radius.circular(kBorderRadiusLgVal));
const kBorderRadiusXl = BorderRadius.all(Radius.circular(kBorderRadiusXlVal));

const kBoxShadow = [
  BoxShadow(
    color: AppColors.greyOutline,
    offset: Offset(0, 1),
    blurRadius: 2,
  ),
];

const kTextFieldDecoration = InputDecoration(
  isDense: true,
  labelStyle: TextStyle(color: AppColors.darkGrey),
  suffixIconColor: AppColors.grey,
  hintStyle: TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
  ),
  contentPadding: EdgeInsets.symmetric(
    horizontal: kSpacingMd,
    vertical: kSpacingSm,
  ),
  border: OutlineInputBorder(borderRadius: kBorderRadiusSm),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: AppColors.greyOutline),
    borderRadius: kBorderRadiusSm,
  ),
);

const kTextFieldDecoratoinDark = InputDecoration(
  labelStyle: TextStyle(color: AppColors.white),
  contentPadding: EdgeInsets.symmetric(
    horizontal: kSpacingMd,
    vertical: kSpacingSm,
  ),
  prefixIconColor: AppColors.white,
  hintStyle: TextStyle(color: AppColors.white, fontWeight: FontWeight.normal),
  border: OutlineInputBorder(
    borderRadius: kBorderRadiusSm,
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: kBorderRadiusSm,
    borderSide: BorderSide(color: AppColors.darkBorder),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: kBorderRadiusSm,
    borderSide: BorderSide(color: AppColors.darkBorder),
  ),
);
