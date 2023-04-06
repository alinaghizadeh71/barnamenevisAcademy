import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:barnameneviss/main.dart';
import 'package:barnameneviss/pages/corsesScreen.dart';
import 'package:barnameneviss/pages/faqScreen.dart';
import 'package:barnameneviss/pages/homeScreen.dart';
import 'package:barnameneviss/pages/profileScreen.dart';
import 'package:barnameneviss/util/FaqNetwork.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constant.dart';
import '../controllers/navigatorController.dart';
import '../models/RegisterModel.dart';
import '../util/CategoryNetwork.dart';
import '../util/CourseNetwork.dart';
import '../util/RegisterNetwork.dart';
import '../util/SlideShowNetwork.dart';
import '../util/StudentNetwork.dart';
import '../util/TeacherNetwork.dart';

class mainScreen extends StatelessWidget {
  mainScreen({super.key});
  Widget body = homeScreen();  
  static Future<bool>? FutureSlideShow;
  static Future<bool>? FutureCourse;
  static Future<bool>? FutureCategory;
  static Future<bool>? FutureTeacher;
  static Future<bool>? FutureStudent;
  static Future<bool>? FutureFaq;
  static Future<bool>? registerList;
  static SharedPreferences? pref;
  static bool? Registered;
  static Future<bool> isRegistered() async {
    pref = await SharedPreferences.getInstance();
    Registered=pref!.getBool('isRegister') ?? false;
    return Registered!;
  }
  @override
  Widget build(BuildContext context) {
    isRegistered();
    MyApp.changeColor(kblue, Brightness.dark);
    GetDataFromServer();
    return Obx(
      () => Scaffold(
        bottomNavigationBar: AnimatedBottomNavigationBar.builder(
          itemCount: iconNavigation(false).length,
          tabBuilder: (int index, bool isActive) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: iconNavigation(isActive)[index],
                ),
                const SizedBox(height: 4),
                Padding(
                  padding: const EdgeInsets.only(left: 2, right: 2),
                  child: Text(
                    '${icontitle[index]}',
                    maxLines: 1,
                    style: TextStyle(
                        color: isActive ? kblue : kgray, fontSize: 12),
                    //group: autoSizeGroup,
                  ),
                )
              ],
            );
          },
          backgroundColor: kgraylight,
          activeIndex: Get.find<navigatorController>().currentIndex.value,
          splashColor: kblue,
          // notchAndCornersAnimation: borderRadiusAnimation,
          splashSpeedInMilliseconds: 300,
          notchSmoothness: NotchSmoothness.defaultEdge,
          gapLocation: GapLocation.none,
          leftCornerRadius: 10,
          rightCornerRadius: 10,
          height: 65,
          onTap: (index) {
            Get.find<navigatorController>().currentIndex.value = index;
            if (index == 0) {
              SearchTextFieldWidget.issearch = false;
              body = couresScreen();
            } else if (index == 1) {
              body = homeScreen();
            } else if (index == 2) {
              body = faqScreen();
            } else {
              body = profileScreen();
            }
          },
          //hideAnimationController:hideAnimationController(),
          shadow: BoxShadow(
            offset: Offset(0, 1),
            blurRadius: 12,
            spreadRadius: 0.5,
            color: kgraylight,
          ),
        ),
        body: SafeArea(child: body),
        //body: SafeArea(child: body),
      ),
    );
  }

  List<SvgPicture> iconNavigation(bool active) {
    List<SvgPicture> iconNavigation = [
      SvgPicture.asset(
        active
            ? 'assets/images/category-fill.svg'
            : 'assets/images/category.svg',
        color: active ? kblue : kgray,
        height: 24,
        width: 24,
      ),
      SvgPicture.asset(
        active ? 'assets/images/home-fill.svg' : 'assets/images/home.svg',
        color: active ? kblue : kgray,
        height: 24,
        width: 24,
      ),
      SvgPicture.asset(
        active ? 'assets/images/faq.svg' : 'assets/images/faq-fill.svg',
        color: active ? kblue : kgray,
        height: 24,
        width: 24,
      ),
      SvgPicture.asset(
        active ? 'assets/images/profile-fill.svg' : 'assets/images/profile.svg',
        color: active ? kblue : kgray,
        height: 24,
        width: 24,
      )
    ];
    return iconNavigation;
  }
}

void GetDataFromServer() {
  mainScreen.FutureSlideShow = SlideShowNetwork.getData();
  mainScreen.FutureCategory = CategoryNetwork.getData();
  mainScreen.FutureTeacher = TeacherNetwork.getData();
  mainScreen.FutureStudent = StudentNetwork.getData();
  mainScreen.FutureCourse = CourseNetwork.getData();
  mainScreen.FutureFaq = FaqNetwork.getData();
 mainScreen.registerList= RegisterNetwork.getData();
}
