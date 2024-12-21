import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/data/api/model/sources_response/Sources.dart';
import 'package:news_app/presentation/screens/home/tabs/articles/view/articles_list_widget.dart';
import 'package:news_app/presentation/screens/home/tabs/categories_details/widgets/sources_widget/source_item_widget.dart';


class SourcesWidget extends StatefulWidget {
  const SourcesWidget({super.key, required this.sources});

  final List<Sources> sources;

  @override
  State<SourcesWidget> createState() => _SourcesWidgetState();
}

class _SourcesWidgetState extends State<SourcesWidget> {
  int _selectedIndex = 0; // Keeps track of the selected tab

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // TabBar
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: widget.sources.asMap().entries.map((entry) {
              int index = entry.key;
              Sources source = entry.value;

              return GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedIndex = index; // Update the selected index
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: SourceItemWidget(
                    source: source,
                    isSelected: _selectedIndex == index, // Check if this tab is selected
                  ),
                ),
              );
            }).toList(),
          ),
        ),
        // Display content for the selected tab
        SizedBox(height: 20.h,),
        Center(
           child:ArticlesListWidget(sources: widget.sources[_selectedIndex])
          // Text(
          //   "Content for ${widget.sources[_selectedIndex].name}",
          //   style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          // ),
        ),
        
      ],
    );
  }
}
