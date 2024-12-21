import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/presentation/widget/ui_error.dart';
import 'package:news_app/result.dart';

class UiError extends StatelessWidget {
   UiError({super.key,this.serverError,this.error,this.retryButtonAction,this.retryButtonText});

   ServerError? serverError;
   Error?error;
   String?retryButtonText;
   VoidCallback? retryButtonAction;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(extractError()),

        SizedBox(height: 4.h,),

        ElevatedButton(onPressed: (){
          retryButtonAction?.call();
        },

            child: Text(retryButtonText!),
        )
      ],
    );

  }

   String extractError(){
     if(serverError?.message!=null){
       return serverError!.message;
     }
     if(error?.exception!=null){
       return error!.exception.toString();
     }
     return 'Something went wrong';
   }
}
