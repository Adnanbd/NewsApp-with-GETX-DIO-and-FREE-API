import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_dio_sample_project/core/widgets/cDrawer.dart';
import 'package:getx_dio_sample_project/core/widgets/news_preview_tile.dart';
import 'package:getx_dio_sample_project/feature/search_news/controller/search_news_controller.dart';
import 'package:loading_animations/loading_animations.dart';

class SearchNewsView extends StatelessWidget {
  const SearchNewsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SearchNewsController>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Search News"),
        centerTitle: true,
        backgroundColor: Colors.indigo,
      ),
      drawer: getDrwaer(),
      body: Container(
        child: Column(
          children: [
            TextField(
              controller: controller.searchTextController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
              ),
            ),
            Expanded(child: Obx(
              () {
                return controller.isLoading.isTrue
                    ? Center(
                        child: LoadingBouncingGrid.square(
                          borderColor: Colors.indigo,
                          size: 40.0,
                        ),
                      )
                    : controller.articles.isEmpty
                        ? Center(
                            child: Text("No News Available"),
                          )
                        : newsPreviewTile(controller);
              },
            )),
          ],
        ),
      ),
    );
  }
}
