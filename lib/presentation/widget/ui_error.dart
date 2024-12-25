import 'dart:io';

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
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(extractError(),textAlign: TextAlign.center,),

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
     String? message= "Something went wrong";
     if(serverError?.message!=null){
       return serverError!.message;
     }
     if(error?.exception!=null){
       var ex= error!.exception;

       switch(ex){
         case SocketException():
           {
             message = "No Internet connection";
             break;
           }
         case  HttpException():
           {
             message= "Couldn't find the post ";
             break;
           }
         case  FormatException():
           {
             message="Bad response format";
             break;
           }

       }
     }
     return message;
   }

}
