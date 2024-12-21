import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/core/utils/routes_manager.dart';
import 'package:news_app/data/api/model/articles_response/Articles.dart';

class ArticlesItemWidget extends StatelessWidget {
   ArticlesItemWidget({super.key,required this.article});
Articles article;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).pushNamed(RoutesManager.articleDetails,
            arguments: article
        );

      },
      child: Container(
        margin: REdgeInsets.symmetric(horizontal: 9,vertical: 6),
        child: Column(
           crossAxisAlignment: CrossAxisAlignment.stretch,
           mainAxisAlignment: MainAxisAlignment.center,

          children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(6.r),
            child: CachedNetworkImage(
            imageUrl: article.urlToImage??'',
            placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => const Center(child: Icon(Icons.error)),
                ),
          ),
            Text(article.source?.name??'',style: GoogleFonts.poppins(fontSize: 12.sp,fontWeight: FontWeight.w400,color: const Color(0xFF79828B)),),
            const SizedBox(height: 3,),
            Text(article.description??'',style: GoogleFonts.poppins(fontSize: 16.sp,fontWeight: FontWeight.w600,color: const Color(0xFF42505C)),),
            const SizedBox(height: 2,),
            Text(article.publishedAt??'',textAlign: TextAlign.end,style: GoogleFonts.inter(fontSize: 13.sp,fontWeight: FontWeight.w400,color: const Color(0xFFA3A3A3)),),
          ],
        ),
      ),
    );
  }
}
