import 'package:flutter/material.dart';
import 'package:news_app/data/api/api_manager/api_manager.dart';
import 'package:news_app/data/api/model/sources_response/Sources.dart';
import 'package:news_app/result.dart';

class CategoryDetailsViewmodel extends ChangeNotifier {
  // bool isLoading = false;
  // String? errorMessage;
  // List<Sources>? sources;
  SourcesState state= SourcesLoadingState();

  void emit(SourcesState newState){
    state=newState;
    notifyListeners();
  }

  void getSourcesByCategoryId(String categoryId) async {

     emit(SourcesLoadingState());
      var result = await ApiManager.getSources(categoryId);
      switch(result){

        case Success<List<Sources>>():
        emit(SourcesSuccessState(sources: result.data));

        case ServerError<List<Sources>>():
       emit(SourcesErrorState(serverError: result));

        case Error<List<Sources>>():
          emit(SourcesErrorState(error: result));
      }

  }



// Fetch data
//  final response = await ApiManager.getSources(categoryId);
//
//  if (response.status == 'ok') {
//   sources = response.sources; // Set data if successful
//  } else {
//   errorMessage = response.message ?? "Unknown error occurred";
//  }
// } catch (error) {
//  errorMessage = "An error occurred: $error";
// } finally {
//  isLoading = false; // Stop loading
//  notifyListeners(); // Notify UI to update
// }

}
sealed class SourcesState{

}
class SourcesSuccessState extends SourcesState{
  List<Sources> sources;
  SourcesSuccessState({required this.sources});
}

class SourcesLoadingState extends SourcesState{
  String?loadingMessage;
  SourcesLoadingState({this.loadingMessage});
}
class SourcesErrorState extends SourcesState {
  ServerError?serverError;
  Error?error;

  SourcesErrorState({this.serverError, this.error});
}