import 'package:flutter/rendering.dart';
import 'package:news_app/core/utils/colors_manager.dart';
import 'package:news_app/core/utils/const_manager.dart';
import 'package:news_app/core/utils/images_manager.dart';
import 'package:news_app/core/utils/strings_manager.dart';

class CategoryDm{
  String id;
  String title;
  Color bgColor;
  String imagePath;

  CategoryDm({required this.id,required this.title,required this.bgColor,required this.imagePath});

  static List<CategoryDm>getAllCategories()=>[
    CategoryDm(id: ConstManager.sportsBackEndId, title: StringsManager.sports, bgColor: ColorsManager.red, imagePath: ImagesManager.sports),
    CategoryDm(id: ConstManager.businessBackEndId, title: StringsManager.business, bgColor: ColorsManager.darkBlue, imagePath: ImagesManager.business),
    CategoryDm(id: ConstManager.healthBackEndId, title: StringsManager.health, bgColor: ColorsManager.pink, imagePath: ImagesManager.health),
    CategoryDm(id: ConstManager.entertainmentBackEndId, title: StringsManager.entertainment, bgColor: ColorsManager.brown, imagePath: ImagesManager.entertainment),
    CategoryDm(id: ConstManager.scienceBackEndId, title: StringsManager.science, bgColor: ColorsManager.green, imagePath: ImagesManager.science),
    CategoryDm(id: ConstManager.generalBackEndId, title: StringsManager.general, bgColor: ColorsManager.blue, imagePath: ImagesManager.general),
    CategoryDm(id: ConstManager.techBackEndId, title: StringsManager.tech, bgColor: ColorsManager.yellow, imagePath: ImagesManager.tech),
  ];
}