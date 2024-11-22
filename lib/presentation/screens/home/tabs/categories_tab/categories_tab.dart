import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/config/theme/app_style.dart';


class CategoriesTab extends StatelessWidget {
  const CategoriesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  REdgeInsets.all(12),
      child: Container(
        child: Text(
          "pick your category\n of interests",style: AppStyle.pickCategory,
        ),
      ),
    );
  }
}
