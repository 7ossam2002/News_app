import 'package:flutter/material.dart';
import 'package:news_app/data/api/api_manager/api_manager.dart';
import 'package:news_app/data/api/model/articles_response/Articles.dart';
import 'package:news_app/result.dart';

class ArticlesViewModel extends ChangeNotifier{
  List<Articles>? articles;
  bool isLoading=false;
  String? errorMessage;

  ArticlesState state =ArticlesLoadingState();
  void emit(ArticlesState newState){
   state=newState;
   notifyListeners();
  }
  void getNewsBySource(String sourceId)async{

   var result=await ApiManager.getArticles(sourceId);

      switch(result){

        case Success():
          emit(ArticlesSuccessState(articles: result.data!));

        case ServerError():
         emit(ArticlesErrorState(serverError: result));

        case Error():
         emit(ArticlesErrorState(error: result));
      }





    }
    }


sealed class ArticlesState{

}
class ArticlesSuccessState extends ArticlesState{
  List<Articles>articles;
  ArticlesSuccessState({required this.articles});
}

class ArticlesErrorState extends ArticlesState{
  ServerError?serverError;
  Error?error;
  ArticlesErrorState({this.serverError,this.error});
}

class ArticlesLoadingState extends ArticlesState{
  String?loadingMessage;
  ArticlesLoadingState({this.loadingMessage});
}