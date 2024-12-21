import 'package:flutter/material.dart';
import 'package:news_app/data/api/api_manager/api_manager.dart';
import 'package:news_app/data/api/model/articles_response/Articles.dart';

class ArticlesViewModel extends ChangeNotifier{
  List<Articles>? articles;
  bool isLoading=false;
  String? errorMessage;
  void getNewsBySource(String sourceId)async{
    try{
      isLoading=true;
      notifyListeners();
      var response=await ApiManager.getArticles(sourceId);
      isLoading=false;
      if(response.status=='ok'){
        articles=response.articles;
      }else{
        errorMessage=response.message;
      }
      notifyListeners();
    }catch(e){
      isLoading=false;
      errorMessage=e.toString();
      notifyListeners();
    }
  }
}