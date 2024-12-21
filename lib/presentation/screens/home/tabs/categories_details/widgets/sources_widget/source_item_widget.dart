import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/utils/colors_manager.dart';
import 'package:news_app/data/api/model/sources_response/Sources.dart';

class SourceItemWidget extends StatelessWidget {
  const SourceItemWidget({super.key, required this.source, required this.isSelected});

  final Sources source;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(

      padding: const EdgeInsets.symmetric(vertical: 6,horizontal: 9),
      margin: REdgeInsets.only(top: 8.h),
      decoration: BoxDecoration(
        border: Border.all(color: ColorsManager.black, width: 2.w),
        borderRadius: BorderRadius.circular(35.r),
        color: isSelected ? ColorsManager.black : Colors.transparent, // Background color for selected
      ),
      child: Text(
        source.name ?? "",
        style: TextStyle(
          color: isSelected ? ColorsManager.white : ColorsManager.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
