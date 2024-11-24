import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/config/theme/app_style.dart';
import 'package:news_app/data_model/categories/categories_DM.dart';
import 'package:news_app/presentation/screens/home/widgets/category_widget.dart';

typedef OnCategoryItemClicked=void Function(CategoryDm);
class CategoriesTab extends StatelessWidget {
   CategoriesTab({super.key,required this.onCategoryItemClicked});
   OnCategoryItemClicked onCategoryItemClicked;
  List<CategoryDm> categoriesList= CategoryDm.getAllCategories();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  REdgeInsets.all(12),
      child: Container(
        child: Column(
          children: [
            Text(
              "pick your category\n of interests",style: AppStyle.pickCategory,
            ),
            Expanded(child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 15.w,
                  mainAxisSpacing: 15.h

                ),
                itemCount: categoriesList.length,
                itemBuilder: (context, index) => InkWell(
                  onTap: (){
                    onCategoryItemClicked(categoriesList[index]);
                  },
                  child: CategoryWidget(
                      categoryDm: categoriesList[index],
                      index: index),
                ),
            ))
          ],
        ),
      ),
    );
  }
}
