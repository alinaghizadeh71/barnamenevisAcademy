
import 'package:barnameneviss/pages/homeScreen.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import '../models/courseModel.dart';

class CourseNetwork {
  static Uri UrlCourse = Uri.parse('https://retoolapi.dev/N5PKND/course');
  static List<CourseModel> courseList = [];
 static bool result=false;
  static Uri urlWithId(String id) {
   Uri url = Uri.parse('https://retoolapi.dev/N5PKND/course/$id');
    return url;
  }
static Future<bool> getData() async {
  
    courseList.clear();
    await http.get(UrlCourse).then(
      (response) {
        if (response.statusCode == 200) {
          List jsonlistSlideShow = convert.jsonDecode(response.body);
          jsonlistSlideShow.forEach((json) {
            courseList.add(CourseModel.fromJson(json));
               //print('courseList:$courseList');
               result=true;
              // Get.find<networkco>().course.value=true;
          });
          return result;
        }
      },
    );
      return result;
  }
 static Future<bool> getDataa() async {
  
    courseList.clear();
    await http.get(UrlCourse).then(
      (response) {
        if (response.statusCode == 200) {
          List jsonlistSlideShow = convert.jsonDecode(response.body);
          jsonlistSlideShow.forEach((json) {
            courseList.add(CourseModel.fromJson(json));
               print('courseList:$courseList');
               result=true;
              
          });
           return result;
        }
      },
      
    );
     return result;
  }
/*   static void changeDate(
      {required String id, required String title}) async {
    CourseModel newitem = CourseModel(Id: id, Title: title);
    await http
        .put(urlWithId(id), body: newitem.toJson())
        .then((value) => print(value));
  } */

  static void delDate({required String id}) async {
     http
        .delete(urlWithId(id))
        .then((response) => print('deleteeeeeeee${response.body}'));
  }

 /*  static void postData(
      {required String id, required String title}) async {
    CourseModel newitem = CourseModel(Id: id, Title: title);
     http
        .post(UrlCourse, body: newitem.toJson())
        .then((response) => print('َAddddddddddddddddddddddddd${response.body}'));
  } */
}