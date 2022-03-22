//import 'package:dio/dio.dart' as dr;
import 'package:get/get.dart';
import 'package:getx_dio_sample_project/core/models/article.dart';
import 'package:getx_dio_sample_project/core/models/news.dart';
import 'package:getx_dio_sample_project/core/repository/news.dart';
import 'package:getx_dio_sample_project/service/http_service.dart';
import 'package:getx_dio_sample_project/service/http_service_implementation.dart';

class NewsImpl implements NewsRepo {
  late HttpService _httpService;

  NewsImpl() {
    _httpService = Get.put(HttpServiceImpl());
    _httpService.init();
  }

  @override
  Future<List<Article>> getNewsHeadline() async {
    // TODO: implement getNewsHeadline

    try {
      print("Start=>");
      final response =
          await _httpService.getReq("/v2/top-headlines?country=us");
      print("Mid=>");
      final parsedResponse = News.fromJson(response.data);
      print(parsedResponse.articles);
      print("success");

      return parsedResponse.articles;
    } on Exception catch (e) {
      print(e);
      print("ERRORX");
      throw Exception(e);
    }
  }

  @override
  Future<List<Article>> getSearchedNews(String s) async {
    // TODO: implement getSearchedNews
    try {
      print("Main=>");
      final response = await _httpService.getReq("/v2/everything?q=$s");
      final parsedResponse = News.fromJson(response.data);

      return parsedResponse.articles;
    } on Exception catch (e) {
      print(e);
      throw Exception(e);
    }
  }
}
