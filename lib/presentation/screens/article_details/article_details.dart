import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/core/utils/colors_manager.dart';
import 'package:news_app/core/utils/images_manager.dart';
import 'package:news_app/data/api/model/articles_response/Articles.dart';

class ArticleDetails extends StatelessWidget {
  const ArticleDetails({super.key});

  @override
  Widget build(BuildContext context) {

    final article = ModalRoute.of(context)?.settings.arguments as Articles;

    return Container(
      decoration: const BoxDecoration(
        color: ColorsManager.white,
        image: DecorationImage(image: AssetImage(ImagesManager.pattern)),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            article.title ?? '',
            style: GoogleFonts.poppins(fontSize: 16.sp, fontWeight: FontWeight.w600),
          ),
        ),
        body: Container(
          margin: REdgeInsets.symmetric(horizontal: 9.w, vertical: 12.h),
          child: Padding(
            padding: REdgeInsets.symmetric(vertical: 20.h, horizontal: 4.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(6.r),
                  child: Image.network(
                    article.urlToImage ?? '',
                    fit: BoxFit.cover,
                    height: 200.h,
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  article.source?.name ?? '',
                  style: GoogleFonts.poppins(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF79828B),
                  ),
                ),
                SizedBox(height: 3.h),
                Text(
                  article.description ?? '',
                  style: GoogleFonts.poppins(
                    fontSize: 19.sp,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF42505C),
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  article.publishedAt ?? '',
                  textAlign: TextAlign.end,
                  style: GoogleFonts.inter(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFFA3A3A3),
                  ),
                ),
                SizedBox(height: 4.h),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    article.content ?? '',
                    textAlign: TextAlign.start,
                    style: GoogleFonts.inter(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFFA3A3A3),
                    ),
                  ),
                ),
                SizedBox(height: 40.h,),
                Container(
                  alignment: Alignment.bottomRight,
                  child: TextButton(
                    onPressed: () {
                      //url_launcher

                    },
                    child: Text(
                      article.url ?? '',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF42505C),
                      ),
                      textAlign: TextAlign.end,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
