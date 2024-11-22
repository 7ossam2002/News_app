import 'package:flutter/cupertino.dart';
import 'package:news_app/presentation/screens/home/home_screen.dart';
import 'package:news_app/presentation/screens/splash/splash_screen.dart';

class RoutesManager{
  static const String splash="/splash";
  static const String home="/home";

  static Map<String,WidgetBuilder> routes={
    splash :(_)=>const SplashScreen(),
    home:(_)=>const HomeScreen(),
  };

}