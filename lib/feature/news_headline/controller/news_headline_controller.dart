import 'package:get/get.dart';
import 'package:getx_dio_sample_project/core/models/article.dart';
import 'package:getx_dio_sample_project/core/repository/news.dart';
import 'package:getx_dio_sample_project/core/repository/news_implementation.dart';

class NewsHeadlineController extends GetxController {
  late NewsRepo _newsRep;

  NewsHeadlineController() {
    _newsRep = Get.find<NewsImpl>();
    loadNewsHeadlines();
  }

  RxBool isLoading = false.obs;

  late RxList<Article> articles;

  //final articles = RxList<Article>;

  loadNewsHeadlines() async {
    showLoading();
    final result = await _newsRep.getNewsHeadline();
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
