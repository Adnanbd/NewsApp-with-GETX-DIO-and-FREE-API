import 'package:flutter/material.dart';
import 'package:get/get.dart';

getDrwaer() {
  return Drawer(
    child: ListView(
      children: [
        ListTile(
          title: Text("News Headlines"),
          onTap: () {
            Get.toNamed("/news_headline");
          },
          leading: Icon(Icons.newspaper),
        ),
        ListTile(
          title: Text("Search News"),
          leading: Icon(Icons.search),
          onTap: () {
            Get.toNamed("/search_news");
          },
        ),
      ],
    ),
  );
}
