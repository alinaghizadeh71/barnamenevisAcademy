import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import '../models/coursesModel.dart';

class CoursesNetwork {
  static Uri UrlCourses = Uri.parse('https://retoolapi.dev/sb4Enc/courses');
  static List<CoursesModel> coursesList = [];
 static bool result=false;
  static Uri urlWithId(String id) {
    Uri url = Uri.parse('https://retoolapi.dev/sb4Enc/courses/$id');
    return url;
  }
 static Future<bool> getData() async {
  
    coursesList.clear();
    await http.get(UrlCourses).then(
      (response) {
        if (response.statusCode == 200) {
          List jsonlistSlideShow = convert.jsonDecode(response.body);
          jsonlistSlideShow.forEach((json) {
            coursesList.add(CoursesModel.fromJson(json));
               print('courseList:$coursesList');
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