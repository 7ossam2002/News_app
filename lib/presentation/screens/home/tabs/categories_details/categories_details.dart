import 'package:flutter/material.dart';
import 'package:news_app/data_model/categories/categories_DM.dart';

class CategoriesDetails extends StatelessWidget {
   CategoriesDetails({super.key,required this.categoryDm});
CategoryDm categoryDm;
  @override
  Widget build(BuildContext context) {

    return Container(
      color: Colors.yellow,
      child: Text(categoryDm.id),
    );
  }
}
