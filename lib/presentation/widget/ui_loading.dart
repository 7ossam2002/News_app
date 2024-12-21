import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/utils/colors_manager.dart';

class UiLoading extends StatelessWidget {
  const UiLoading({super.key,this.loadingMessage});

final String?loadingMessage;

  @override
  Widget build(BuildContext context) {
    return Center(

      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if(loadingMessage!=null)
          Text(loadingMessage!),

          SizedBox(width: 10.w,),
          Center(child: CircularProgressIndicator(color: ColorsManager.black,)),
        ],
      ),
     );
  }
}
