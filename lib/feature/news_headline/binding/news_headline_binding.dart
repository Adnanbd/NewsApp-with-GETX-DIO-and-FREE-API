import 'package:get/get.dart';
import 'package:getx_dio_sample_project/core/repository/news_implementation.dart';
import 'package:getx_dio_sample_project/feature/news_headline/controller/news_headline_controller.dart';

class NewsHeadlineBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(NewsImpl());
    Get.put(NewsHeadlineController());
  }
}
