import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/config/theme/app_style.dart';
import 'package:news_app/core/utils/colors_manager.dart';

class AppTheme{

  static final ThemeData light=ThemeData(
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(
        color: ColorsManager.white
      ),
      toolbarHeight: 50,
      backgroundColor: ColorsManager.black,
    titleTextStyle: AppStyle.appBar,
      centerTitle: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(47.r)),

      )
    ),


  );
}