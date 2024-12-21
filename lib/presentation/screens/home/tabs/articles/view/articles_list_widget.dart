import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/data/api/api_manager/api_manager.dart';
import 'package:news_app/data/api/model/articles_response/Articles.dart';
import 'package:news_app/data/api/model/sources_response/Sources.dart';
import 'package:news_app/presentation/screens/home/tabs/articles/view_model/articles_viewModel.dart';
import 'package:news_app/presentation/screens/home/tabs/articles/widget/articles_item.dart';

import 'package:provider/provider.dart';

class ArticlesListWidget extends StatefulWidget {
  ArticlesListWidget({super.key, required this.sources});

  final Sources sources;

  @override
  State<ArticlesListWidget> createState() => _ArticlesListWidgetState();
}

class _ArticlesListWidgetState extends State<ArticlesListWidget> {
  var viewModel= ArticlesViewModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getNewsBySource(widget.sources.id!);
  }
  void didUpdateWidget(covariant ArticlesListWidget oldWidget){
    super.didUpdateWidget(oldWidget);
    if(oldWidget.sources.id!=widget.sources.id){
      viewModel.getNewsBySource(widget.sources.id!);
    }


  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ArticlesViewModel>.value(
        value: viewModel,
    child: Consumer<ArticlesViewModel>(
      builder: (context, value, child) {
        if(viewModel.isLoading){
          return const Center(child: CircularProgressIndicator());
        }

        if(viewModel.errorMessage !=null){
          return Text(viewModel.errorMessage!);
        }
        List<Articles> articles=viewModel.articles!;
        return SizedBox(
                  height: 721,
                  child: ListView.builder(
                    itemBuilder: (context, index) => ArticlesItemWidget(article: articles[index]),
                    itemCount: articles.length,
                  ),
                );

        //   Expanded(
        //   child: ListView.builder(
        //     itemBuilder: (context, index) => ArticlesItemWidget(article: articles[index]),
        //     itemCount: articles.length,
        //   ),
        // );
      },
    ),
    );
      // FutureBuilder(
      //   future: ApiManager.getArticles(widget.sources.id ?? ""),
      //   builder: (context, snapshot) {
      //     if (snapshot.connectionState == ConnectionState.waiting) {
      //       return const Center(child: CircularProgressIndicator());
      //     }
      //     if (snapshot.data?.status == 'error' || snapshot.hasError) {
      //       return Center(
      //         child: Text(snapshot.data?.message ?? "Please check internet connection"),
      //       );
      //     }
      //     List<Articles> articles = snapshot.data?.articles ?? [];
      //     return SizedBox(
      //       height: 721,
      //       child: ListView.builder(
      //         itemBuilder: (context, index) => ArticlesItemWidget(article: articles[index]),
      //         itemCount: articles.length,
      //       ),
      //     );
      //   },
      // );
  }
}
