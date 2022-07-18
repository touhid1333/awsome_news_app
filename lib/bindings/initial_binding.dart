import 'package:awsome_news_app/controllers/news_controller.dart';
import 'package:get/get.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NewsController>(() => NewsController(),
        fenix: true, tag: "NewsController");
  }
}
