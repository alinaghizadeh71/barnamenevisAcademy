
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import '../models/teacherModel.dart';

class TeacherNetwork {
  static Uri UrlTeacher = Uri.parse('https://retoolapi.dev/PEyYMV/teacher');
  static List<TeacherModel> teacherList = [];
 static bool result=false;
  static Uri urlWithId(String id) {
    Uri url = Uri.parse('https://retoolapi.dev/PEyYMV/teacher/$id');
    return url;
  }

  static Future<bool> getData() async {
    teacherList.clear();
    await http.get(UrlTeacher).then(
      (response) {
        if (response.statusCode == 200) {
          List jsonlistSlideShow = convert.jsonDecode(response.body);
          jsonlistSlideShow.forEach((json) {
            teacherList.add(TeacherModel.fromJson(json));
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
    TeacherModel newitem = TeacherModel(Id: id, Title: title);
    await http
        .put(urlWithId(id), body: newitem.toJson())
        .then((value) => print(value));
  } */

  static void delDate({required String id}) async {
     http
        .delete(urlWithId(id))
        .then((response) => print('deleteeeeeeee${response.body}'));
  }

/*   static void postData(
      {required String id, required String title}) async {
    TeacherModel newitem = TeacherModel(Id: id, Title: title);
     http
        .post(UrlTeacher, body: newitem.toJson())
        .then((response) => print('َAddddddddddddddddddddddddd${response.body}'));
  } */
}