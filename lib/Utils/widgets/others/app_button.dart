
import 'package:flutter/material.dart';
import 'package:quran_home_schooling/Utils/resources/res/app_theme.dart';
import 'package:quran_home_schooling/Utils/widgets/others/app_text.dart';

class AppButton {
  static Widget appButton(String text,
      {double? height,
      double? width,
      Color? backgroundColor,
      EdgeInsetsGeometry? padding,
      TextAlign? textAlign,
      Color? textColor,
      double? fontSize,
      GestureTapCallback? onTap,
      FontWeight? fontWeight,
      FontStyle? fontStyle,
      TextBaseline? textBaseline,
      TextOverflow? overflow,
      double? letterSpacing,
      bool underLine = false,
      bool fontFamily = false,
      bool? border,
      bool? blurContainer}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        padding: padding,
        width: width,
        height: height,
        decoration: BoxDecoration(
            boxShadow: [
              blurContainer == true
                  ? BoxShadow(
                      color: Colors.black26,
                      blurRadius: 2,
                      offset: Offset(0.0, 4))
                  : BoxShadow()
            ],
            color: backgroundColor,
            borderRadius: BorderRadius.circular(50),
            border: border == false
                ? null
                : Border.all(color: AppTheme.appColor, width: 1)),
        child: AppText.appText(text,
            fontFamily: fontFamily,
            fontSize: fontSize,
            textAlign: textAlign,
            fontWeight: fontWeight,
            textColor: textColor,
            overflow: overflow,
            letterSpacing: letterSpacing,
            textBaseline: textBaseline,
            fontStyle: fontStyle,
            underLine: underLine),
      ),
    );
  }

//this AppButton is for the GoogleSignup/AppleSignup Button will only be used once in the app
  static Widget appButtonWithLeadingIcon(String text,
      {double? height,
      double? width,
      Color? backgroundColor,
      EdgeInsetsGeometry? padding,
      TextAlign? textAlign,
      Color? textColor,
      double? fontSize,
      FontWeight? fontWeight,
      FontStyle? fontStyle,
      TextBaseline? textBaseline,
      TextOverflow? overflow,
      double? letterSpacing,
      Function()? onTap,
      IconData? icons,
      bool underLine = false,
      bool fontFamily = false,
      bool? border}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: padding,
        width: width,
        height: height,
        decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(50),
            border: border == false
                ? null
                : Border.all(
                    color: AppTheme.appColor,
                    width: 2,
                  )),
        child: Row(
          children: [
            const SizedBox(
              width: 20,
            ),
            Icon(icons, size: 35),
            const SizedBox(
              width: 20,
            ),
            AppText.appText(text,
                fontFamily: fontFamily,
                fontSize: fontSize,
                textAlign: textAlign,
                fontWeight: fontWeight,
                textColor: textColor,
                overflow: overflow,
                letterSpacing: letterSpacing,
                textBaseline: textBaseline,
                fontStyle: fontStyle,
                underLine: underLine),
          ],
        ),
      ),
    );
  }

  static Widget appButtonWithLeadingImage(String text,
      {double? height,
      double? width,
      Color? backgroundColor,
      EdgeInsetsGeometry? padding,
      TextAlign? textAlign,
      Color? textColor,
      double? fontSize,
      FontWeight? fontWeight,
      FontStyle? fontStyle,
      TextBaseline? textBaseline,
      TextOverflow? overflow,
      double? letterSpacing,
      IconData? icons,
      Function()? onTap,
      String? imagePath,
      bool underLine = false,
      bool fontFamily = false,
      bool? border}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: padding,
        width: width,
        height: height,
        decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(50),
            border: border == false
                ? null
                : Border.all(
                    color: AppTheme.appColor,
                    width: 2,
                  )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Image(
            //   // image: AssetImage(imagePath!),
            //   image:
              // SvgPicture.asset(
              //   imagePath!,
              //   height: 25,),
            //   height: 25,
            // ),
            AppText.appText(text,
                fontFamily: fontFamily,
                fontSize: fontSize,
                textAlign: textAlign,
                fontWeight: fontWeight,
                textColor: textColor,
                overflow: overflow,
                letterSpacing: letterSpacing,
                textBaseline: textBaseline,
                fontStyle: fontStyle,
                underLine: underLine),
            SizedBox(
              width: 20,
            ),
          ],
        ),
      ),
    );
  }
}
