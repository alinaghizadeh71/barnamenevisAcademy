import 'package:barnameneviss/pages/corsesScreen.dart';
import 'package:barnameneviss/pages/faqScreen.dart';
import 'package:barnameneviss/pages/homeScreen.dart';
import 'package:barnameneviss/pages/mainScreen.dart';
import 'package:barnameneviss/pages/profileScreen.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:get/get.dart';

import '../pages/currentCourseScreen.dart';
import '../pages/personalScreen.dart';
import '../pages/shimmerCurrentCourse.dart';
import '../widget/BarChart.dart';

class route{
  static List<GetPage> get Pages=>[
    GetPage(name: '/homescreen', page:(() =>  homeScreen())),
    GetPage(name: '/mainscreen', page:(() =>  mainScreen())),
    GetPage(name: '/faqscreen', page:(() =>  faqScreen())),
    GetPage(name: '/coursesscreen', page:(() =>  couresScreen())),
    GetPage(name: '/profilescreen', page:(() =>  profileScreen())),
    GetPage(name: '/currentcoursescreen', page:(() =>  currentCourseScreen())),
    GetPage(name: '/personalscreen', page:(() =>  personalScreen())),
    GetPage(name: '/shimmerCurrentCoursescreen', page:(() =>  shimmerCurrentCourse())),
    GetPage(name: '/BarChart', page:(() =>  Chart())),
  ];
}