import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_dio_sample_project/core/widgets/cDrawer.dart';
import 'package:getx_dio_sample_project/core/widgets/news_preview_tile.dart';
import 'package:getx_dio_sample_project/feature/news_headline/controller/news_headline_controller.dart';
import 'package:loading_animations/loading_animations.dart';

class NewsHeadlineView extends StatelessWidget {
  const NewsHeadlineView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<NewsHeadlineController>();
    return Scaffold(
      appBar: AppBar(
        title: Text("News Headlines"),
        centerTitle: true,
        backgroundColor: Colors.indigo,
      ),
      drawer: getDrwaer(),
      body: Obx(() {
        return controller.isLoading.isTrue
            ? Center(
                child: LoadingBouncingGrid.square(
                  borderColor: Colors.indigo,
                  size: 40.0,
                ),
              )
            : newsPreviewTile(controller);
      }),
    );
  }
}
