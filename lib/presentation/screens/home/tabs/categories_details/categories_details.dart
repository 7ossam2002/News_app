import 'package:flutter/material.dart';
import 'package:news_app/data/api/api_manager/api_manager.dart';
import 'package:news_app/data/api/model/sources_response/Sources.dart';
import 'package:news_app/presentation/screens/home/tabs/categories_details/category_details_viewModel.dart';
import 'package:news_app/presentation/screens/home/tabs/categories_details/widgets/sources_widget/sources_widget.dart';
import 'package:news_app/data_model/categories/categories_DM.dart';
import 'package:news_app/presentation/widget/ui_error.dart';
import 'package:news_app/presentation/widget/ui_loading.dart';
import 'package:provider/provider.dart';

class CategoriesDetails extends StatefulWidget {
  CategoriesDetails({super.key,required this.categoryDm});
  CategoryDm categoryDm;


  @override
  State<CategoriesDetails> createState() => _CategoriesDetailsState();
}

class _CategoriesDetailsState extends State<CategoriesDetails> {
  var viewModel=CategoryDetailsViewmodel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getSourcesByCategoryId(widget.categoryDm.id);
  }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CategoryDetailsViewmodel>.value(
      value: viewModel,
      child: Consumer<CategoryDetailsViewmodel>(
        builder: (context,value,child){
          var state=viewModel.state;
          switch(state){

            case SourcesSuccessState():
              return SourcesWidget(sources: state.sources);

            case SourcesLoadingState():
              return const UiLoading(loadingMessage: 'Loading...',);

            case SourcesErrorState():
              return UiError(error: state.error,serverError: state.serverError,);
          }
        //   if(viewModel.isLoading){
        //     return const Center(child: CircularProgressIndicator(),);
        //   }
        //   if(viewModel.errorMessage!=null){
        //     return Text(viewModel.errorMessage!);
        //   }
        //   List<Sources>sources=viewModel.sources!;
        //   return SourcesWidget(sources: sources);
         },
      ),
    );

  //     FutureBuilder(
  //     future: ApiManager.getSources(categoryDm.id),
  //     builder: (context, snapshot) {
  //       if (snapshot.connectionState == ConnectionState.waiting) {
  //         return const Center(
  //           child: CircularProgressIndicator(),
  //         );
  //       }
  //       if (snapshot.data?.status == 'error' || snapshot.hasError) {
  //         return Center(
  //           child: Text(snapshot.data?.message ?? "Check Internet Connection"),
  //         );
  //       }
  //
  //       // Get the list of sources
  //       List<Sources> sources = snapshot.data?.sources ?? [];
  //
  //       if (sources.isEmpty) {
  //         return const Center(
  //           child: Text(
  //             "No Sources Available",
  //             style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
  //           ),
  //         );
  //       }
  //
  //       return SourcesWidget(sources: sources); // Pass sources to widget
  //     },
  //   );
  // }
}
}