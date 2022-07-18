import 'package:awsome_news_app/bindings/initial_binding.dart';
import 'package:awsome_news_app/modules/news/all_news.dart';
import 'package:awsome_news_app/utils/app_pages.dart';
import 'package:awsome_news_app/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(393, 830),
        builder: (context, child) {
          return GetMaterialApp(
            title: 'Awesome News App',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            initialRoute: AppRoutes.allNews,
            getPages: AppPages.pages,
            initialBinding: InitialBinding(),
          );
        });
  }
}
