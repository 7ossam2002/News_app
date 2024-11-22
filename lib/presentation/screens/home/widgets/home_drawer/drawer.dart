import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/config/theme/app_style.dart';
import 'package:news_app/core/utils/colors_manager.dart';
import 'package:news_app/core/utils/strings_manager.dart';
import 'package:news_app/presentation/screens/home/tabs/categories_tab/categories_tab.dart';

typedef OnDrawerItemClicked =void Function(MenuItem);

class HomeDrawer extends StatelessWidget {
  HomeDrawer({super.key,required this.onDrawerItemClicked});
OnDrawerItemClicked onDrawerItemClicked;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 290.w,
      child: Column(
        children: [
          Container(
            width: double.infinity,
              height: 150.h,
              color: ColorsManager.black,
                child: Center(child: Text(StringsManager.drawerTitle,style: AppStyle.drawerTitle,)),
              ),
          SizedBox(height: 25.h,),
       Padding(
         padding:  REdgeInsets.symmetric(horizontal: 8 ),
         child: Column(
           children: [
             InkWell(
               onTap: () {
               onDrawerItemClicked(MenuItem.categories);
               },
               child: Row(
                 children: [
                   Icon(Icons.list,size: 33.sp,),
                   SizedBox(width: 10.w,),
                   Text("Categories",style: AppStyle.drawerItem,)
                 ],
               ),
             ),
             SizedBox(height: 23.h,),
             InkWell(
               onTap: () {
               onDrawerItemClicked(MenuItem.settings);
               },
               child: Row(
                 children: [
                   Icon(Icons.settings,size: 33.sp,),
                   SizedBox(width: 10.w,),
                   Text("Settings",style: AppStyle.drawerItem,)
                 ],
               ),
             )
           ],
         ),
       )
        ],
      ),
    );

  }
}
enum MenuItem{
  categories,
  settings
}