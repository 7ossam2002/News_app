import 'package:flutter/material.dart';
import 'package:news_app/core/utils/colors_manager.dart';
import 'package:news_app/core/utils/images_manager.dart';
import 'package:news_app/core/utils/strings_manager.dart';
import 'package:news_app/data_model/categories/categories_DM.dart';
import 'package:news_app/presentation/screens/home/home_drawer/drawer.dart';
import 'package:news_app/presentation/screens/home/tabs/categories_details/categories_details.dart';
import 'package:news_app/presentation/screens/home/tabs/categories_tab/categories_tab.dart';
import 'package:news_app/presentation/screens/home/tabs/settings_tab/settings_tab.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Tracks the currently selected tab
 late Widget _selectedTab;
 List<CategoryDm> category= CategoryDm.getAllCategories();
@override
  void initState() {
    // TODO: implement initState
    super.initState();
  _selectedTab = CategoriesTab(onCategoryItemClicked: onCategoryClicked);
  }
  void onCategoryClicked(CategoryDm category){
    _selectedTab =CategoriesDetails(categoryDm: category,);
    title =category.title;

    setState(() {

    });
  }
  // Handles drawer item clicks
  void _onDrawerItemClicked(MenuItem item) {
    setState(() {
      switch (item) {
        case MenuItem.categories:
          _selectedTab = CategoriesTab(onCategoryItemClicked: onCategoryClicked,);
          break;
        case MenuItem.settings:
          _selectedTab = SettingsTab();
          break;
      }
    });
    Navigator.pop(context); // Close the drawer after selection
  }
 String title="News App";

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorsManager.white,
        image: DecorationImage(image: AssetImage(ImagesManager.pattern)),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        drawer: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: HomeDrawer(onDrawerItemClicked: _onDrawerItemClicked),
        ),
        body: _selectedTab, // Render the currently selected tab
      ),
    );
  }
}
