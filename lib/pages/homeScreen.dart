import 'package:barnameneviss/models/teacherModel.dart';
import 'package:barnameneviss/pages/mainScreen.dart';
import 'package:barnameneviss/pages/shimmerhome.dart';
import 'package:barnameneviss/util/CategoryNetwork.dart';
import 'package:barnameneviss/util/CourseNetwork.dart';
import 'package:barnameneviss/util/SlideShowNetwork.dart';
import 'package:barnameneviss/util/StudentNetwork.dart';
import 'package:barnameneviss/util/TeacherNetwork.dart';
import 'package:barnameneviss/widget/DrawerWidget.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:barnameneviss/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../controllers/drawerController.dart';
import '../controllers/slideShowController.dart';
import '../controllers/tabFilterController.dart';
import '../controllers/textFieldController.dart';
import '../models/courseModel.dart';
import '../widget/CustomAppBar.dart';
import '../widget/FilterWidget.dart';
import '../widget/GridWidget.dart';

class homeScreen extends StatelessWidget {
 static String? route;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.wait([
        mainScreen.FutureSlideShow!,
        mainScreen.FutureCourse!,
        mainScreen.FutureCategory!,
        mainScreen.FutureTeacher!,
        mainScreen.FutureStudent!,
        mainScreen.registerList!
      ]),
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        if (snapshot.data == null) {
          return shimmerHome();
        }

        if (snapshot.data![0] == true &&
            snapshot.data![1] == true &&
            snapshot.data![2] == true &&
            snapshot.data![3] == true &&
            snapshot.data![4] == true) {
          return baseBody();
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return shimmerHome();
      },
    );
  }
}

class baseBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   SearchTextFieldWidget.issearch=false;
    return Scaffold(
      endDrawer: SafeArea(
          child: Drawer(
        child: drawerWidget(),
      )),
      key: Get.find<drawerController>().scaffoldKey,
      body: SafeArea(
          child: SingleChildScrollView(
              child: Column(
        children: [
          CustomAppbar(),
          SlideShowWidget(),
          indicatorSlideShow(),
          SearchTextFieldWidget(),
          FilterWidget(
              list: CategoryNetwork.categoryList, symmetrichorizontal: 15),
          GetBuilder<tabFilterController>(
              id: '1',
              builder: (builder) {
                return GridWidget(route: 'home',);
              }),
          TextButton(
            onPressed: () {
              Get.toNamed('/coursesscreen');
            },
            child: Center(
              child: Text(
                'همه دوره ها',
                style: TextStyle(
                  color: kblue,
                  fontSize: 15,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          TeacherWidget(),
          StudentWidget()
        ],
      ))),
    );
  }
}

class StudentWidget extends StatelessWidget {
  const StudentWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.only(right: 10, top: 10),
          child: Text(
            'دانشجویان',
            style: TextStyle(color: kgraydark, fontSize: 15),
            textAlign: TextAlign.end,
          ),
        ),
        Container(
          padding: EdgeInsets.all(10.0),
          height: 150,
          child: ListView.builder(
              itemBuilder: ((context, index) {
                return itemListHorizontalWidget(
                  isteacher: false,
                  index: index,
                );
              }),
              itemCount: StudentNetwork.StudentList.length,
              shrinkWrap: true,
              reverse: true,
              scrollDirection: Axis.horizontal),
        ),
      ],
    );
  }
}

class TeacherWidget extends StatelessWidget {
  const TeacherWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(right: 10, top: 10),
          child: Text(
            'اساتید',
            style: TextStyle(color: kgraydark, fontSize: 15),
            textAlign: TextAlign.end,
          ),
        ),
        Container(
          padding: EdgeInsets.only(
            left: 10,
            right: 10,
            top: 20,
          ),
          height: 150,
          child: ListView.builder(
              itemBuilder: ((context, index) {
                return itemListHorizontalWidget(
                  isteacher: true,
                  index: index,
                );
              }),
              itemCount: TeacherNetwork.teacherList.length,
              shrinkWrap: true,
              reverse: true,
              scrollDirection: Axis.horizontal),
        ),
      ],
    );
  }
}

class SearchTextFieldWidget extends StatelessWidget {
  static bool issearch = false;
  @override
  Widget build(BuildContext context) {
    Get.find<textFieldController>().searchtextFieldController!.clear();
    return Container(
      height: 100,
      alignment: Alignment.centerRight,
      padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 20),
      child: TextField(
        //enabled: false,
        autofocus: false,
        onTap: () {
          issearch = true;
          Get.toNamed('/coursesscreen');
        },
        onChanged: (value) {
          issearch = true;
          Get.toNamed('/coursesscreen');
        },
        readOnly: true,
        controller: Get.find<textFieldController>().searchtextFieldController,
        style: TextStyle(
          color: Colors.black,
        ),
        textDirection: TextDirection.rtl,
        cursorColor: kgray,
        decoration: InputDecoration(
          hintText: 'دنبال چه دوره ای میگردی؟',
          suffixIcon: Container(
            padding: EdgeInsets.all(10.0),
            child: SvgPicture.asset(
              ('assets/images/search.svg'),
              color: kgray,
            ),
          ),
          hintTextDirection: TextDirection.rtl,
          hintStyle: TextStyle(color: kgray),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: kgraylight),
              borderRadius: BorderRadius.circular(10)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: kgraylight),
              borderRadius: BorderRadius.circular(10)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: kgraylight),
              borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }
}
class itemListHorizontalWidget extends StatelessWidget {
  int index;
  bool isteacher;
  itemListHorizontalWidget({required this.isteacher, required this.index});
  @override
  Widget build(BuildContext context) {
    List<TeacherModel> itemlist =
        (isteacher ? TeacherNetwork.teacherList : StudentNetwork.StudentList);

    return GestureDetector(
      onTap: () => Get.toNamed('/personalscreen'),
      child: Container(
        width: 150,
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              child: ClipOval(
                child: Image.network(
                  height: 100,
                  width: 100,
                  '${itemlist[index].Path.trim()}',
                  fit: BoxFit.cover,
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    );
                  },
                ),
              ),
              backgroundColor: kgraylight,
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              '${itemlist == [] ? '' : itemlist[index].Title}',
              style: TextStyle(fontSize: 12),
              maxLines: 1,
            )
          ],
        ),
      ),
    );
  }
}

class SlideShowWidget extends StatelessWidget {
  const SlideShowWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10, top: 5),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0)),
      child: ImageSlideshow(
          indicatorColor: Colors.transparent,
          indicatorBackgroundColor: Colors.transparent,
          onPageChanged: (value) {
            Get.find<slideShowController>().indexActive.value = value;
            debugPrint(
                'slide index: ${Get.find<slideShowController>().indexActive.value}  ');
          },
          autoPlayInterval: 3000,
          isLoop: true,
          children: ImageSlide()),
    );
  }
}

List<Widget> ImageSlide() {
  List<Widget> list = [];
  SlideShowNetwork.slideShowList.forEach((value) {
    list.add(Container(
        padding: EdgeInsets.symmetric(horizontal: 5.0),
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0)),
        child: GestureDetector(
          child: Image.network(
            value.Path,
            fit: BoxFit.cover,
          ),
        )));
  });
  return list;
}

class indicatorSlideShow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.all(10.0),
        alignment: Alignment.center,
        width: 15 * 3,
        height: 25,
        child: ListView.builder(
            itemBuilder: (context, index) {
              return Obx(() => Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: CircleAvatar(
                      maxRadius: 4.0,
                      backgroundColor:
                          Get.find<slideShowController>().indexActive.value ==
                                  index
                              ? kblue
                              : kgray,
                    ),
                  ));
            },
            itemCount: 3,
            scrollDirection: Axis.horizontal,
            controller: PageController(viewportFraction: 1.0)),
      ),
    );
  }
}
