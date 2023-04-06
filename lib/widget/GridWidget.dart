import 'package:barnameneviss/routes/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../constant.dart';
import '../controllers/tabFilterController.dart';
import '../models/courseModel.dart';
import '../pages/homeScreen.dart';
import '../util/CourseNetwork.dart';
import '../util/TeacherNetwork.dart';

class GridWidget extends StatelessWidget {
  final List test = [];
  static List<CourseModel>? v_courseList;
  static String searchtext = '';
  static bool? allShow;
  String? route;
  GridWidget({required this.route});
  @override
  Widget build(BuildContext context) {
    route == 'home' ? allShow = false : allShow = true;
    //اگر در صفحه اصلی چیزی سرچ کرده
    if (SearchTextFieldWidget.issearch!) {
      v_courseList = Get.find<tabFilterController>().resultList;
    } else {
      v_courseList = CourseNetwork.courseList;
    }

    return v_courseList!.length == 0
        ? Container(
            width: Get.width,
            height: 300,
            child: Center(
                child: Text(
              'دوره ای موجود نمیباشد',
              style: TextStyle(color: kgray),
            )),
          )
        : Container(
            alignment: Alignment.centerRight,
            width: Get.width,
            margin: EdgeInsets.all(10.0),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: GridView.count(
                physics: ScrollPhysics(),
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                shrinkWrap: true,
                crossAxisCount: 2,
                childAspectRatio: (Get.width / (Get.height) + 0.22),
                children: listItemGrid(),
              ),
            ));
  }
}

List<itemGridWidget> listItemGrid() {
  int i = 0;
  int lengthItem;
 lengthItem = GridWidget.v_courseList!.length;

  if (!GridWidget.allShow! && GridWidget.v_courseList!.length > 4) {
    lengthItem = 4;;
  } 
  
  List<itemGridWidget> list = [];
  for (i; i < lengthItem; i++) {
    list.add(itemGridWidget(item: i));
  }
  return list;
}

class itemGridWidget extends StatelessWidget {
  int item;
  String? TeacherName;
  String? TeacherPath;
  var parameters;
  itemGridWidget({required this.item});
  @override
  Widget build(BuildContext context) {
    if (GridWidget.v_courseList!.length > 0 &&
        !GridWidget.v_courseList!.isEmpty) {
      parameters = <String, String>{
        'IdCurrentCourse': GridWidget.v_courseList![item].Id,
        'IdTeacher': GridWidget.v_courseList![item].IdTeacher,
      };
      TeacherNetwork.teacherList.forEach(
        (value) {
          if (value.Id == GridWidget.v_courseList![item].IdTeacher) {
            TeacherName = value.Title;
            TeacherPath = value.Path;
          }
        },
      );
    }
    return GestureDetector(
      onTap: (() => Get.toNamed('/currentcoursescreen', arguments: parameters)),
      child: Container(
        alignment: Alignment.centerRight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: kgraylight,
        ),
        clipBehavior: Clip.hardEdge,
        width: (Get.width) / 4,
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Image.network(
              height: 125,
              '${GridWidget.v_courseList![item].Path.trim()}',
              fit: BoxFit.cover,
              loadingBuilder: (BuildContext context, Widget child,
                  ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) return child;
                return Container(
                  height: 125,
                  child: Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!
                          : null,
                    ),
                  ),
                );
              },
            ),
            Container(
              width: Get.width,
              alignment: Alignment.centerRight,
              padding: EdgeInsets.only(top: 10, right: 10, left: 10),
              child: Text(
                '${GridWidget.v_courseList![item].Title}',
                textAlign: TextAlign.right,
                textDirection: TextDirection.rtl,
                maxLines: 1,
                style: TextStyle(
                  fontSize: 15,
                  color: kgrayverydark,
                ),
              ),
            ),
            //teacher
            Directionality(
              textDirection: TextDirection.rtl,
              child: Padding(
                padding: EdgeInsets.only(top: 10, right: 10, left: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 18,
                      child: ClipOval(
                          child: Image.network(
                        '${TeacherPath}',
                        fit: BoxFit.cover,
                      )),
                      backgroundColor: Colors.white,
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 2.0),
                      child: Text(
                        '${TeacherName}',
                        overflow: TextOverflow.ellipsis,
                        textDirection: TextDirection.rtl,
                        style: TextStyle(fontSize: 12, color: kgraydark),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            //time
            Directionality(
              textDirection: TextDirection.rtl,
              child: Padding(
                padding: EdgeInsets.only(right: 18, left: 10, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      'assets/images/clock.svg',
                      color: kgray,
                      height: 22,
                      width: 22,
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 6.0),
                      child: Text(
                        '${GridWidget.v_courseList![item].Time}',
                        style: TextStyle(
                          fontSize: 12,
                          color: kgraydark,
                        ),
                        textDirection: TextDirection.rtl,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
