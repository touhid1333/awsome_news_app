import 'package:awsome_news_app/models/api_response.dart';
import 'package:awsome_news_app/utils/widget_function.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewsItemUI extends StatelessWidget {
  final Article item;

  NewsItemUI(this.item);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: ScreenUtil().screenWidth,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 1),
            color: Colors.grey.withOpacity(0.3),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 70.h,
                      child: ClipRRect(
                        child: Image.network(
                          item.urlToImage.toString(),
                          fit: BoxFit.fill,
                        ),
                        borderRadius:
                            BorderRadius.only(topLeft: Radius.circular(20)),
                      ),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 70.h,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Text(
                                item.title!,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                textAlign: TextAlign.start,
                              ),
                            ),
                            addVerticalSpace(5),
                            Text(
                              item.publishedAt.toString(),
                              style: TextStyle(fontSize: 12.sp),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: ExpandableText(
                  item.description!,
                  expandText: "Read More",
                  collapseText: "Show Less",
                  linkColor: Colors.blue,
                  maxLines: 4,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: RichText(
                    text: TextSpan(children: [
                  new TextSpan(
                    text: 'by ',
                    style: new TextStyle(color: Colors.black),
                  ),
                  new TextSpan(
                    text: item.urlToImage.toString(),
                    style: new TextStyle(color: Colors.blue),
                  )
                ])),
              )
            ],
          ),
        ),
        addVerticalSpace(12),
      ],
    );
  }
}
