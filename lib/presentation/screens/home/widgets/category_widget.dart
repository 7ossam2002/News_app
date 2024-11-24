import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/config/theme/app_style.dart';
import 'package:news_app/data_model/categories/categories_DM.dart';

class CategoryWidget extends StatelessWidget {
  CategoryDm categoryDm;
  int index;
   CategoryWidget({super.key,required this.categoryDm,required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(

      width: double.infinity,
      decoration: BoxDecoration(
        color: categoryDm.bgColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25.r),
          topRight: Radius.circular(25.r),
          bottomLeft: Radius.circular(index.isEven?25:0),
          bottomRight: Radius.circular(index.isEven?0:25),
        )
      ),
      child:Column(
        children: [
          SizedBox(height: 10.h,),
          Image.asset(categoryDm.imagePath,width: 140,height: 140,),
          SizedBox(height: 5.h,),
          Text(categoryDm.title,style: AppStyle.categoryTitle,),
        ],
      ) ,
    );
  }
}
