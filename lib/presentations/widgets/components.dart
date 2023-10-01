import 'package:dorah/styles/pallet.dart';
import 'package:dorah/styles/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconsax/iconsax.dart';

SizedBox customVerticalSpace({required double height}) =>
    SizedBox(height: height);

SizedBox customHorizontalSpace({required double width}) =>
    SizedBox(width: width);

Text customText({
  required customTextValue,
  customTextStyle,
  customTextAlign,
  customMaxLines,
  customTextOverflow,
}) {
  return Text(
    customTextValue,
    style: customTextStyle ?? heading1,
    textAlign: customTextAlign ?? TextAlign.start,
    maxLines: customMaxLines,
    overflow: customTextOverflow,
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

InkWell customSimpleListMenu({
  required onTapped,
  required listImage,
  required listTitle,
}) {
  return InkWell(
    onTap: onTapped,
    child: ListTile(
      leading: SvgPicture.asset(
        listImage,
      ),
      minLeadingWidth: 0,
      title: customText(
        customTextValue: listTitle,
        customTextStyle: body1,
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios_rounded,
        size: 16,
      ),
    ),
  );
}

AppBar customSimpleAppBar({
  required appBarTitle,
  isInfoShow = false,
  ontapped,
}) {
  return AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: Colors.white,
    elevation: 0,
    title: customText(
      customTextValue: appBarTitle,
      customTextStyle: heading3.copyWith(color: text60),
    ),
    actions: [
      Visibility(
        visible: isInfoShow,
        child: InkWell(
          onTap: ontapped,
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Icon(Iconsax.info_circle4, color: text60),
          ),
        ),
      )
    ],
  );
}
