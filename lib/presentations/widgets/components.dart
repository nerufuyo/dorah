import 'package:dorah/styles/pallet.dart';
import 'package:dorah/styles/typography.dart';
import 'package:flutter/material.dart';

SizedBox customVerticalSpace({required double height}) =>
    SizedBox(height: height);

SizedBox customHorizontalSpace({required double width}) =>
    SizedBox(width: width);

Text customText({
  required customTextValue,
  customTextStyle,
  customTextAlign,
  customMaxLines,
}) {
  return Text(
    customTextValue,
    style: customTextStyle ?? heading1,
    textAlign: customTextAlign ?? TextAlign.start,
    maxLines: customMaxLines,
  );
}

InkWell customButton(
  context, {
  required customButtonOnTap,
  required customButtonTextValue,
  customButtonPadding,
  customButtonRadius,
  customButtonTextColor,
  customButtonColor,
  customButtonBorderColor,
  customLeftIcon,
  customRightIcon,
}) {
  return InkWell(
    onTap: () => customButtonOnTap(),
    child: Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: customButtonColor ?? primary60,
        border: Border.all(
          color: customButtonBorderColor ?? primary60,
        ),
        borderRadius: customButtonRadius ?? BorderRadius.circular(1000),
      ),
      padding: customButtonPadding ??
          const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 16,
          ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (customLeftIcon != null) customLeftIcon,
          if (customLeftIcon != null) customHorizontalSpace(width: 8),
          customText(
            customTextValue: customButtonTextValue,
            customTextStyle: heading4.copyWith(
              color: customButtonTextColor ?? text0,
            ),
          ),
          if (customRightIcon != null) customHorizontalSpace(width: 8),
          if (customRightIcon != null) customRightIcon,
        ],
      ),
    ),
  );
}
