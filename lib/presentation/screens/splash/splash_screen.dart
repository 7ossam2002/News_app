import 'dart:async'; // Correct async import
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/core/utils/images_manager.dart';
import 'package:news_app/core/utils/routes_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Use WidgetsBinding to ensure context is available
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Timer(const Duration(seconds: 3), () {
        if (mounted) { // Check if widget is still in the tree
          Navigator.of(context).pushReplacementNamed(RoutesManager.home);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
            children: [
              // Background pattern image
              Container(
                color: Colors.white,
                child: Image.asset(
                  ImagesManager.pattern,
                  fit: BoxFit.cover,
                  height: double.infinity,
                  width: double.infinity,
                ),
              ),
              // Logo and Text
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset(
                    ImagesManager.logo,
                    width: 230.w,
                    height: 220.h,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "explore the world",
                    style: GoogleFonts.aboreto(
                      fontSize: 28.sp, // Use `sp` for text scaling with `ScreenUtil`
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ],

        ),
      ),
    );
  }
}
