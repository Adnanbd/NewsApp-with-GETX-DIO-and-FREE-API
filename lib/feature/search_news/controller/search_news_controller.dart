import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_dio_sample_project/core/models/article.dart';
import 'package:getx_dio_sample_project/core/repository/news.dart';
import 'package:getx_dio_sample_project/core/repository/news_implementation.dart';

class SearchNewsController extends GetxController {
  late NewsRepo _newsRep;

  SearchNewsController() {
    _newsRep = Get.find<NewsImpl>();

    searchTextController.addListener(() {
      if (searchTextController.text.isNotEmpty) {
        print("THrEE PRESSEDDDD");
        loadSearchedNew();
      }
    });
  }

  RxBool isLoading = false.obs;

  late RxList<Article> articles = RxList();

  //final articles = RxList<Article>;
  final searchTextController = TextEditingController();

  loadSearchedNew() async {
    showLoading();
    final result = await _newsRep.getSearchedNews(searchTextController.text);
    hideLoading();

    if (result != null) {
      articles = result.obs;
    } else {
      print("No data Recieved");
    }
  }

  showLoading() {
    isLoading.toggle();
  }

  hideLoading() {
    isLoading.toggle();
  }
}
