import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/core/utils/colors_manager.dart';

class AppStyle{
  static TextStyle appBar=  GoogleFonts.aboreto(fontWeight: FontWeight.w700,fontSize: 24.sp,color: ColorsManager.white);
  static TextStyle drawerTitle=  GoogleFonts.aboreto(fontWeight: FontWeight.w700,fontSize: 35.sp,color: ColorsManager.white);
  static TextStyle drawerItem=  GoogleFonts.aBeeZee(fontWeight: FontWeight.w700,fontSize: 22.sp,color: ColorsManager.black);
  static TextStyle pickCategory=  GoogleFonts.aBeeZee(fontWeight: FontWeight.w700,fontSize: 25.sp,color: ColorsManager.black);
}