import 'package:awsome_news_app/modules/news/elements/news_item_ui.dart';
import 'package:awsome_news_app/utils/sample_data.dart';
import 'package:awsome_news_app/utils/widget_function.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../controllers/news_controller.dart';

class AllNewsUI extends StatelessWidget {
  const AllNewsUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final NewsController controller = Get.find(tag: "NewsController");
    controller.getNews();
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        title: const Text("Awesome News App"),
      ),
      body: SafeArea(
          child: Container(
        height: ScreenUtil().screenHeight,
        width: ScreenUtil().screenWidth,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //top
              Row(
                children: [
                  Obx(() => Text(
                        controller.total.value.toString(),
                        style:
                            const TextStyle(color: Colors.blue, fontSize: 16),
                      )),
                  addHorizontalSpace(5.w),
                  const Text(
                    "Articles fetched",
                    style: TextStyle(color: Colors.black, fontSize: 12),
                  )
                ],
              ),
              addVerticalSpace(20),
              //list
              Expanded(
                child: Obx(() => ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: controller.newsList.value.length,
                    itemBuilder: (context, index) {
                      return NewsItemUI(controller.newsList.value[index]);
                    })),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
