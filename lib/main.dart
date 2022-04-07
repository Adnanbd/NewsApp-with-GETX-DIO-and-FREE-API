import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_dio_sample_project/feature/news_headline/binding/news_headline_binding.dart';
import 'package:getx_dio_sample_project/feature/news_headline/view/news_headline_view.dart';
import 'package:getx_dio_sample_project/feature/search_news/binding/search_news_binding.dart';
import 'package:getx_dio_sample_project/feature/search_news/view/search_news_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages: [
        GetPage(name: "/news_headline", page: () => NewsHeadlineView(),binding: NewsHeadlineBinding()),
        GetPage(name: "/search_news", page: () => SearchNewsView(),binding: SearchNewsBinding()),
        
      ],
      initialRoute: "/news_headline",
    );
  }
}
