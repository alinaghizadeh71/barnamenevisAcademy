
import 'package:barnameneviss/util/CourseNetwork.dart';
import 'package:get/get.dart';
import '../models/courseModel.dart';
import '../pages/homeScreen.dart';
class tabFilterController extends GetxController {
  var currentIndex;
  var textsearch = '';
  List<CourseModel>? resultList = [];
  List<CourseModel>? AllCourse = CourseNetwork.courseList!;
  int filterId = 0;
  @override
  void onInit() {
    currentIndex = 0; 
    super.onInit();
  }

  void setfilter(int id) {
    SearchTextFieldWidget.issearch = true;
    filterId = id;  
    if (filterId.toString() == '1001') {
      resultList =AllCourse;
    } else if (filterId != '0') {
      resultList = AllCourse!
          .where((item) =>
              item.IdCategory ==
              Get.find<tabFilterController>().filterId.toString())
          .toList();
    }

   update(['1','2']);
  }

  void filterwithtext(String item) {
     currentIndex = 0; 
    resultList = AllCourse;
    textsearch = item;
    List<CourseModel> results = [];
    results.clear();
    if (item.isEmpty || item == '') {
      results = resultList!;
    } else {
      resultList!.forEach((element) {
        if (element.Title.toLowerCase().contains(item.toLowerCase())) {
          results.add(element);
        }
      });
    }
    resultList = results;
    update(['1','2']);
  }
}
