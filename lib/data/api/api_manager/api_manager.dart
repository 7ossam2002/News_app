import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/data/api/model/articles_response/Articles.dart';
import 'package:news_app/data/api/model/articles_response/Articles_Response.dart';
import 'package:news_app/data/api/model/sources_response/Sources.dart';
import 'package:news_app/data/api/model/sources_response/Sources_Response.dart';
import 'package:news_app/result.dart';

// https://newsapi.org/v2/top-headlines/sources?apiKey=2ae0b8fb4f6c4f95929dd1642b43b49f
class ApiManager {
  static const String _baseUrl = "newsapi.org";
  static const String _sourcesEndPoint = "/v2/top-headlines/sources";
  static const String _articlesEndPoint = "/v2/everything";
  static const String _apiKey = "2ae0b8fb4f6c4f95929dd1642b43b49f";

  static Future<Result<List<Sources>>>getSources(String categoryId) async {
    Uri url = Uri.https(_baseUrl, _sourcesEndPoint, {
      'apiKey': _apiKey,
      'category': categoryId,
    });
    try {
      http.Response serverResponse = await http.get(url);
      var json = jsonDecode(serverResponse.body);
      SourcesResponse sourcesResponse = SourcesResponse.fromJson(json);
  if(sourcesResponse.status=='ok'){
    return Success(data: sourcesResponse.sources!);
  }
  else{
   return ServerError(message: sourcesResponse.message!, code: sourcesResponse.code!);
  }
      //return sourcesResponse;
    }on Exception catch(e){
      return Error(exception: e);
    }
  }


  static Future<Result<List<Articles>>> getArticles(String sourceId) async {
    Uri url = Uri.https(_baseUrl, _articlesEndPoint, {
      'apiKey': _apiKey,
      'sources': sourceId,
      //'q':searchText,
    });
    try{
      http.Response serverResponse = await http.get(url);
      var json = jsonDecode(serverResponse.body);
      ArticlesResponse articleResponse = ArticlesResponse.fromJson(json);
      if(articleResponse.status=='ok') {
        return Success(data: articleResponse.articles!);
      }else{
        return ServerError(message: articleResponse.message!, code: articleResponse.code!);
      }
    }on Exception catch(e){
       return Error(exception: e);
    }
  }
}