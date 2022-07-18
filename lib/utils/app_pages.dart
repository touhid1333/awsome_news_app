import 'package:awsome_news_app/modules/news/all_news.dart';
import 'package:awsome_news_app/utils/app_routes.dart';
import 'package:get/get.dart';

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.allNews, page: () => const AllNewsUI())
  ];
}
