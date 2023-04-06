import 'dart:math';
import 'package:barnameneviss/constant.dart';
import 'package:barnameneviss/controllers/CircularProgressController.dart';
import 'package:barnameneviss/models/RegisterModel.dart';
import 'package:barnameneviss/models/coursesModel.dart';
import 'package:barnameneviss/pages/faqScreen.dart';
import 'package:barnameneviss/pages/shimmerCurrentCourse.dart';
import 'package:barnameneviss/util/CoursesNetwork.dart';
import 'package:barnameneviss/util/RegisterNetwork.dart';
import 'package:barnameneviss/widget/videoPlayerScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../util/CourseNetwork.dart';
import '../util/TeacherNetwork.dart';
import 'package:barnameneviss/pages/mainScreen.dart';
import '../widget/DialogWidget.dart';

CoursesModel? thisCourse;
String? TeacherName;
String? TeacherPath;
String? id;
String? idTeacher;

class currentCourseScreen extends StatelessWidget {
  currentCourseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    id = Get.arguments['IdCurrentCourse'];
    idTeacher = Get.arguments['IdTeacher'];

    TeacherNetwork.teacherList.forEach(
      (value) {
        if (value.Id == idTeacher) {
          TeacherName = value.Title;
          TeacherPath = value.Path;
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
    );
  }
}

class basebody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CoursesNetwork.coursesList.forEach((element) {
      if (element.Id == id) {
        thisCourse = element;
      }
    });

    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  HeaderWidget(),
                  DetailsCourseWidget(),
                  bottomWidget()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailsCourseWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Visibility(
      child: Column(
        children: [
          SizedBox(
            height: 220,
          ),
          bodyWidget(),
          SizedBox(
            height: 10.0,
          ),
          videoWidget(),
          HeadlineWidget(),
          SizedBox(
            height: 10.0,
          ),
        ],
      ),
    );
  }
}

class bottomWidget extends StatelessWidget {
  Future<bool> isRegistered() async {
    pref = await SharedPreferences.getInstance();
    return pref!.getBool('isRegister') ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      child: Container(
        padding: EdgeInsets.only(top: 5.0),
        decoration: BoxDecoration(
            color: Colors.white,
            //borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0),topRight: Radius.circular(10.0)),
            boxShadow: [
              BoxShadow(
                blurStyle: BlurStyle.solid,
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 5,
                blurRadius: 7.0,
                offset: Offset(0, 3),
              )
            ]),
        //color: Colors.white,
        height: 105,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ButtonWidget(
                enable: true,
                title: 'ثبت نام',
                fun: () {
                  return Stack(
                    children: [
                      const Opacity(
                        opacity: 0.8,
                        child: ModalBarrier(
                            dismissible: false, color: Colors.black),
                      ),
                      const Center(
                        child: CircularProgressIndicator(),
                      ),
                    ],
                  );
                  //post
                  if (mainScreen.Registered ?? false) {
                    /*   showDialog(
                              // The user CANNOT close this dialog  by pressing outsite it
                              barrierDismissible: false,
                              context: context,
                              builder: (_) {
                                return Dialog(
                                  // The background color
                                  backgroundColor: Colors.white,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 20),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: const [
                                        // The loading indicator
                                        CircularProgressIndicator(),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        // Some text
                                        Text('Loading...')
                                      ],
                                    ),
                                  ),
                                );
                              }); */
                    /*   FutureBuilder(
                      future: Future.wait([RegisterNetwork.getData()]),
                      builder:
                          (context, AsyncSnapshot<List<dynamic>> snapshot) {
                        if (snapshot.data == null) {
                          return  CircularProgressIndicator();
                        }

                        if (snapshot.data![0] == true) {
                           //create new item
                    RegisterModel newItem = RegisterModel(
                        idUser: mainScreen.pref!.getString('Id').toString(),
                        idCourse: id.toString(),
                        id: Random().nextInt(6000).toString());

                          if (RegisterNetwork.checkRepeat(newitem: newItem)) {
                            //send data to server
                            RegisterNetwork.postData(newitem: newItem);
                            DialogWidget('درخواست شما با موفقیت ثبت شد!');
                          } else {
                            Get.snackbar(
                                'توجه', 'این درس رو قبلا ثبت نام کردید');
                          }
                          return Container();
                        } else if (snapshot.hasError) {
                          return Text("${snapshot.error}");
                        }
                        return  CircularProgressIndicator();
                      },
                    ); */
                  } else {
                    Get.toNamed('/profilescreen');
                  }
                }),
            TextButton(
              onPressed: () {},
              child: Text('نیاز به مشاوره دارم'),
            )
          ],
        ),
      ),
    );
  }
}

class ButtonWidget extends StatelessWidget {
  String? title;
  Function()? fun;
  bool? enable;
  ButtonWidget({required this.title, required this.fun, required this.enable});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30.0),
      width: Get.width,
      height: 50,
      child: ElevatedButton(
        onPressed: enable! ? fun : null,
        child: Text(title!),
        style: TextButton.styleFrom(
            backgroundColor: kblue,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0))),
      ),
    );
  }
}

class HeadlineWidget extends StatelessWidget {
  const HeadlineWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
              padding: EdgeInsets.only(bottom: 10.0),
              child: Text(
                'سرفصل',
                textAlign: TextAlign.right,
                style: TextStyle(
                    color: kgraydark,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              )),
          Text(
            thisCourse!.Headline,
            textAlign: TextAlign.right,
            style: TextStyle(color: kgraydark, fontSize: 15),
          ),
        ],
      ),
    );
  }
}

class videoWidget extends StatelessWidget {
  const videoWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: thisCourse!.Video == '' ? false : true,
      child: Container(
        child: VideoPlayerScreen(Path: thisCourse!.Video),
        height: 200,
        width: (Get.width) - 40,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
      ),
    );
  }
}

class bodyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        /*   Padding(
            padding: EdgeInsets.only(right: 20.0, left: 20.0, top: 20.0),
            child: Text(
              'با امگان پرداخت اقساط',
              textAlign: TextAlign.right,
              maxLines: 1,
              style: TextStyle(color: kgray, fontSize: 15),
            )), */
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: Text(
              'همراه با ارائه مدرک معتبر فنی و حرفه ای',
              style: TextStyle(color: kgray, fontSize: 15),
            )),
      ],
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
  var parameters;
  @override
  Widget build(BuildContext context) {
    parameters = <String, String>{
      'IdTeacher': idTeacher!,
    };
    return Transform.translate(
      key: UniqueKey(),
      offset: Offset(0.0, 190),
      child: Container(
        padding: EdgeInsets.all(10.0),
        width: (Get.width) - 40,
        height: 225,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: kgraylight, borderRadius: BorderRadius.circular(10.0)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ///ostad
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: () {
                      Get.toNamed('/personalscreen', arguments: parameters);
                    },
                    child: Text('رزومه'),
                    style: ButtonStyle(alignment: Alignment.centerLeft)),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 5.0),
                  child: Text(TeacherName!),
                ),
                CircleAvatar(
                  child: ClipOval(
                    child: Image.network(TeacherPath!),
                  ),
                  backgroundColor: Colors.white,
                  radius: 20,
                ),
                //****************** */
              ],
            ),

            ///clock
            Padding(
              padding: const EdgeInsets.only(top: 7.0, right: 7.0, bottom: 7.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: Text(
                      thisCourse!.Duration,
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                  SvgPicture.asset(
                    'assets/images/clock.svg',
                    height: 24,
                    width: 24,
                    color: kgray,
                  ),
                  //****************** */
                ],
              ),
            ),

            ///time
            Padding(
              padding: const EdgeInsets.only(top: 7.0, right: 7.0, bottom: 7.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: Text(
                      thisCourse!.Time,
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                  SvgPicture.asset(
                    'assets/images/calendar.svg',
                    height: 24,
                    width: 24,
                    color: kgray,
                  ),
                  //****************** */
                ],
              ),
            ),

            ///price
            Padding(
              padding: const EdgeInsets.only(top: 7.0, right: 7.0, bottom: 7.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: Text(
                      thisCourse!.Price2,
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: Text(thisCourse!.Price1,
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                            decoration: TextDecoration.lineThrough,
                            color: kgraydark)),
                  ),
                  SvgPicture.asset(
                    'assets/images/money.svg',
                    height: 24,
                    width: 24,
                    color: kgray,
                  ),
                  //****************** */
                ],
              ),
            ),
            Padding(
                padding: EdgeInsets.only(top: 7.0, right: 12.0, bottom: 7.0),
                child: Text(
                  'با امکان پرداخت اقساط',
                  textAlign: TextAlign.right,
                  maxLines: 1,
                  style: TextStyle(color: kgray, fontSize: 15),
                )),
          ],
        ),
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
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 60.0,
                    backgroundImage: NetworkImage(
                      thisCourse!.Pic,
                    ),
                    backgroundColor: Colors.transparent,
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      thisCourse!.Title,
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(top: 5.0),
                    child: Text(
                      thisCourse!.Des,
                      style: TextStyle(fontSize: 12, color: kgray),
                    ),
                  )
                ],
              ),
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
    return GestureDetector(
      onTap: (() => Get.toNamed('/currentcoursescreen')),
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
            Image.network('${CourseNetwork.courseList[item].Path}',
                height: 100, fit: BoxFit.cover),
            Padding(
                padding: EdgeInsets.only(top: 10, right: 10, left: 10),
                child: Center(
                  child: Text(
                    '${CourseNetwork.courseList[item].Title}',
                    style: TextStyle(
                      fontSize: 15,
                      color: kgrayverydark,
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

void GetDataFromServer() {
  CoursesNetwork.getData();
}
