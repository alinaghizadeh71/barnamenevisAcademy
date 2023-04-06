import 'package:barnameneviss/constant.dart';
import 'package:barnameneviss/models/categoryModel.dart';
import 'package:barnameneviss/models/courseModel.dart';
import 'package:barnameneviss/models/teacherModel.dart';
import 'package:barnameneviss/pages/shimmerCurrentCourse.dart';
import 'package:barnameneviss/widget/videoPlayerScreen.dart';
import 'package:barnameneviss/widget/FilterWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/tabFilterController.dart';
import '../util/CourseNetwork.dart';
import '../util/CoursesNetwork.dart';
import '../util/TeacherNetwork.dart';

String? idTeacher;
TeacherModel? model;
CourseModel? course;
class personalScreen extends StatelessWidget {
  personalScreen({super.key});
  @override
  Widget build(BuildContext context) {
    idTeacher = Get.arguments['IdTeacher'];
    TeacherNetwork.teacherList.forEach(
      (value) {
        if (value.Id == idTeacher) {
          model = value;
        }
      },
    );
    return FutureBuilder(
      future: CoursesNetwork.getData(),
      builder: (context, snapshot) {
        if (snapshot.data == true) {
          return basebody();
        } else {
          return shimmerCurrentCourse();
        }
      },
    ); /*  */
  }
}

class basebody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Stack(
      //alignment: Alignment.bottomCenter,
      children: [
        SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              HeaderWidget(),
              SizedBox(
                height: 50,
              ),
              Obx(
                () => bodyWidget(text: Currenttap()),
              ),
              //  videoWidget(),
            ],
          ),
        ),
        courseWidget(),
      ],
    )));
  }
}

String Currenttap() {
  String? CurrentTextBody;
  switch (Get.find<tabFilterController>().currentIndex.value) {
    case 0:
      CurrentTextBody = model!.historyTeacher;
      break;
    case 1:
      CurrentTextBody = model!.historyEdu;
      break;
    case 2:
      CurrentTextBody = model!.historyPerformance;
      break;
    default:
  }
  return CurrentTextBody!;
}

class videoWidget extends StatelessWidget {
  const videoWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: VideoPlayerScreen(Path: ''),
      height: 200,
      width: (Get.width) - 40,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
    );
  }
}

class bodyWidget extends StatelessWidget {
  const bodyWidget({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Text(
            text,
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.right,
            style: TextStyle(color: kgraydark, fontSize: 15),
          )),
    );
  }
}

class courseWidget extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    
     CourseNetwork.courseList.forEach(
      (value) {
        if (value.Id.toString() == model!.course) {
          course = value;
        }
      },
    );
    return Container(
      width: Get.width,
      alignment: Alignment.centerRight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            
            padding: EdgeInsets.only(top: 10.0, right: 25.0),
            child: Text(
              'دوره ها',
              style: TextStyle(
                  color: kgraydark, fontSize: 15, fontWeight: FontWeight.bold),
              textAlign: TextAlign.right,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
            height: 190,
            child: ListView.builder(
                itemBuilder: ((context, index) {
                  return itemListWidget(
                    item: index,
                  );
                }),
                itemCount: 1,
                shrinkWrap: true,
                reverse: true,
                
                scrollDirection: Axis.horizontal),
          ),
        ],
      ),
    );
  }
}

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: (Get.height) / 3,
      color: Colors.amber,
      child: new Stack(alignment: Alignment.bottomCenter, children: [
        TopHeaderWidget(),
        bottomHeaderWidget(),
      ]),
    );
  }
}

class bottomHeaderWidget extends StatelessWidget {
  const bottomHeaderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<CategoryModel> filterlistteacher = [
      CategoryModel(Id: '0', Title: 'سوابق آموزشی'),
      CategoryModel(Id: '1', Title: 'سوابق تحصیلی'),
      CategoryModel(Id: '3', Title: 'سوابق اجرایی')
    ];
    return Transform.translate(
      key: UniqueKey(),
      offset: Offset(0.0, 30),
      child: Container(
        padding: EdgeInsets.all(10.0),
        width: (Get.width) - 40,
        height: 70,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: kgraylight, borderRadius: BorderRadius.circular(10.0)),
        child: FilterWidget(list: filterlistteacher, symmetrichorizontal: 10),
      ),
    );
  }
}

class TopHeaderWidget extends StatelessWidget {
  const TopHeaderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      key: UniqueKey(),
      offset: Offset(0.0, 0.0),
      child: Container(
        width: Get.width,
        decoration: BoxDecoration(
          color: kblue,
          shape: BoxShape.rectangle,
        ),
        child: Stack(
          children: [
            IconButton(
              alignment: Alignment.topLeft,
              onPressed: () {},
              icon: Icon(Icons.arrow_back_ios_outlined),
              color: Colors.white,
            ),
            Column(
              children: [
                Container(
                  alignment: Alignment.topCenter,
                  margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
                  child: CircleAvatar(
                    radius: 60,
                    backgroundColor: kbackgray,
                    child: ClipOval(
                        child: Image.network(model!.Path, fit: BoxFit.cover)),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    model!.Title,
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(top: 5.0),
                  child: Text(
                    model!.des,
                    style: TextStyle(fontSize: 12, color: kgray),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class itemListWidget extends StatelessWidget {
  int item;
  itemListWidget({required this.item});
  @override
  Widget build(BuildContext context) {
    var parameters=<String,String>{
      'IdCurrentCourse':course!.Id,
      'IdTeacher': model!.Id
    };
    return GestureDetector(
      onTap: (() => Get.toNamed('/currentcoursescreen',arguments: parameters)),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: kgraylight,
        ),
        clipBehavior: Clip.hardEdge,
        width: 150,
        height: 150,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Image.network(course!.Path,
                height: 100, fit: BoxFit.cover),
            Expanded(
              child: Padding(
                  padding: EdgeInsets.only(top: 10, right: 10, left: 10),
                  child: Center(
                    child: Text(
                      '${course!.Title}',
                      textAlign: TextAlign.right,
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                        fontSize: 15,
                        color: kgrayverydark,
                      ),
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
