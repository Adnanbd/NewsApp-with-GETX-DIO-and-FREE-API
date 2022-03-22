import 'package:get/get.dart';
import 'package:getx_dio_sample_project/feature/search_news/controller/search_news_controller.dart';

class SearchNewsBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(SearchNewsController());
  }
}
