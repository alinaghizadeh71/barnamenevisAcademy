
import 'package:barnameneviss/controllers/navigatorController.dart';
import 'package:barnameneviss/controllers/tabFilterController.dart';
import 'package:barnameneviss/controllers/textFieldController.dart';
import 'package:get/get.dart';
import '../controllers/CircularProgressController.dart';
import '../controllers/ThemeController.dart';
import '../controllers/TimerController.dart';
import '../controllers/drawerController.dart';
import '../controllers/faqController.dart';

import '../controllers/registerController.dart';
import '../controllers/slideShowController.dart';

class Mybinding implements Bindings {
  @override
  void dependencies() {
   Get.put(textFieldController());
   Get.put(FaqController());
   Get.put( tabFilterController());
   Get.put( registerController());
   Get.put( TimerController());
   Get.lazyPut(() => navigatorController());
   Get.lazyPut(() => drawerController());
   Get.lazyPut(() => slideShowController());
  Get.lazyPut(() => CircularProgressController());
  Get.lazyPut(() => ThemeController());
  // Get.lazyPut(() => registerController());
  }
  
}