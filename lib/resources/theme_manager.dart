import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'color_manager.dart';
import 'font_manager.dart';
import 'styles_manager.dart';
import 'values_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,

    dividerColor: Colors.transparent,
    fontFamily: FontConstants.fontFamily,
    primaryColor: ColorManager.primary,
    scaffoldBackgroundColor: ColorManager.backgroundColor,
    //TextTheme

    textTheme: TextTheme(
      headline1: getMediumStyle(color: ColorManager.black, fontSize: 34.sp),
      headline2: getMediumStyle(color: ColorManager.black, fontSize: 22.sp),
      headline3: getMediumStyle(color: ColorManager.black, fontSize: 17.sp),
      headline4: getMediumStyle(color: ColorManager.black, fontSize: 15.sp),
      headline5: getMediumStyle(color: ColorManager.black, fontSize: 15.sp),
      headline6: getMediumStyle(color: ColorManager.black, fontSize: 13.sp),
      bodyText1: getMediumStyle(color: ColorManager.black, fontSize: 14.sp),
      bodyText2: getMediumStyle(color: ColorManager.black, fontSize: 13.sp),
      subtitle1: getMediumStyle(color: ColorManager.black, fontSize: 11.sp),
      subtitle2: getMediumStyle(color: ColorManager.black, fontSize: 16.sp),
      button: getMediumStyle(color: ColorManager.black, fontSize: 17.sp),
      caption: getMediumStyle(color: ColorManager.black, fontSize: 12.sp),
    ),
    inputDecorationTheme: InputDecorationTheme(

      filled: true,
      errorStyle: const TextStyle(height: 0, color: ColorManager.parent),
      hintStyle: getRegularStyle(
          color: ColorManager.black.withOpacity(0.4),
          fontSize: FontSize.s16.sp),
      fillColor: ColorManager.white,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(7),
          topRight: Radius.circular(7),
          bottomRight: Radius.circular(7),
          bottomLeft: Radius.circular(7),
        ),
        borderSide: BorderSide(color: ColorManager.borderWhite, width: 1),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(7),
          topRight: Radius.circular(7),
          bottomRight: Radius.circular(7),
          bottomLeft: Radius.circular(7),
        ),
        borderSide: BorderSide(color: Colors.red),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(7),
          topRight: Radius.circular(7),
          bottomRight: Radius.circular(7),
          bottomLeft: Radius.circular(7),
        ),
        borderSide: BorderSide(color: Colors.red),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(7),
          topRight: Radius.circular(7),
          bottomRight: Radius.circular(7),
          bottomLeft: Radius.circular(7),
        ),
        borderSide: BorderSide(
          color: ColorManager.borderBlue,
        ),
      ),
    ),
    cardTheme: CardTheme(
        color: ColorManager.darkGrey,
        shadowColor: Colors.grey,
        elevation: AppSize.s4),
    // app bar theme

    appBarTheme: AppBarTheme(
        iconTheme: const IconThemeData(
          color: ColorManager.black, //change your color here
        ),
        // ac
        actionsIconTheme: IconThemeData(color: ColorManager.black),
        centerTitle: true,
        color: ColorManager.backgroundColor,
        elevation: 0,
        titleTextStyle:
            getBoldStyle(fontSize: FontSize.s20, color: ColorManager.black)),
    // button theme
    buttonTheme: const ButtonThemeData(
      shape: StadiumBorder(),
      disabledColor: Colors.grey,
      buttonColor: ColorManager.primary,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
      textStyle: getSemiBoldStyle(
          color: ColorManager.darkGrey, fontSize: FontSize.s16),
      primary: ColorManager.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(7.r),
      ),
    )),
  );
}
