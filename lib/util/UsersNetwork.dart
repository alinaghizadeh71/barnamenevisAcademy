
import 'package:barnameneviss/models/UsersModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class UsersNetwork {
  static Uri UrlUses = Uri.parse('https://retoolapi.dev/yit7do/Users');
  static List<UsersModel> usersList = [];
 static bool result=false;
  static Uri urlWithId(String id) {
    Uri url = Uri.parse('https://retoolapi.dev/yit7do/Users/$id');
    return url;
  }

  static Future<bool> getData() async {
    usersList.clear();
    await http.get(UrlUses).then(
      (response) {
        if (response.statusCode == 200) {
          List jsonlistSlideShow = convert.jsonDecode(response.body);
          jsonlistSlideShow.forEach((json) {
            usersList.add(UsersModel.fromJson(json));
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

  static void delItem({required String id}) async {
     http
        .delete(urlWithId(id))
        .then((response) => print('deleteeeeeeee${response.body}'));
  }

  static void postData(
      {required  UsersModel newitem}) async {
   // UsersModel newitem = UsersModel(id: id,name: name,family: family,mobile: mobile);
     http
        .post(UrlUses, body: newitem.toJson())
        .then((response) => print('َAddddddddddddddddddddddddd${response.body}'));
  }
}