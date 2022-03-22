import 'package:flutter/material.dart';
import 'package:getx_dio_sample_project/feature/news_headline/controller/news_headline_controller.dart';

newsPreviewTile(final controller){
  return ListView.separated(
                itemCount: controller.articles.length,
                separatorBuilder: (c, index) {
                  return Divider();
                },
                itemBuilder: (ctx, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              controller.articles[index].urlToImage,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            controller.articles[index].title,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            controller.articles[index].publishedAt.toString(),
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(controller.articles[index].content),
                        ),
                      ],
                    ),
                  );
                },
              );
}