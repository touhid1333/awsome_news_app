import 'package:awsome_news_app/models/api_response.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;

class NewsController extends GetxController {
  RxList<Article> newsList = <Article>[].obs;
  RxInt total = 0.obs;

  getNews() async {
    String url =
        "https://newsapi.org/v2/everything?q=apple&from=2022-07-17&to=2022-07-17&sortBy=popularity&apiKey=39ff752b967043ff93fc2b4dbdc937a7";

    try {
      dio.Dio dioInstance = dio.Dio();
      dio.Response response;
      response = await dioInstance.get(url);
      if (response.statusCode == 200) {
        NewsResponse newsResponse = NewsResponse.fromJson(response.data);
        total.value = newsResponse.totalResults!;
        newsList.value = newsResponse.articles!;
      }
    } on dio.DioError catch (e) {
      print("error");
    }
  }
}
