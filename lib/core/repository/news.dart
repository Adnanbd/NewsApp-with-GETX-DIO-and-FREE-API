import 'package:getx_dio_sample_project/core/models/article.dart';

abstract class NewsRepo {
  Future<List<Article>> getNewsHeadline();
  Future<List<Article>> getSearchedNews(String s);
}
