import 'package:barnameneviss/models/RegisterModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class RegisterNetwork {
  static Uri UrlRegister =
      Uri.parse('https://retoolapi.dev/bdbPwE/RegisterList');
  static List<RegisterModel> registerList = [];
  static bool result = false;
  static Uri urlWithId(String id) {
    Uri url = Uri.parse('https://retoolapi.dev/bdbPwE/RegisterList/$id');
    return url;
  }

  static Future<bool> getData() async {
    registerList.clear();
    await http.get(UrlRegister).then(
      (response) {
        if (response.statusCode == 200) {
          List jsonlistSlideShow = convert.jsonDecode(response.body);
          jsonlistSlideShow.forEach((json) {
            registerList.add(RegisterModel.fromJson(json));
            result = true;
          });
          return result;
        }
      },
    );
    return result;
  }

  static void delItem({required String id}) async {
    http
        .delete(urlWithId(id))
        .then((response) => print('deleteeeeeeee${response.body}'));
  }

  static Future<bool?> postData({required RegisterModel newitem}) async {
    http.post(UrlRegister, body: newitem.toJson()).then(
        (response) => print('َAddddddddddddddddddddddddd${response.body}'));
    return true;
  }

  static bool checkRepeat({required RegisterModel newitem}) {
    bool result = true;
        RegisterNetwork.registerList.forEach((item) {
        if (item.idUser == newitem.idUser &&
            item.idCourse == newitem.idCourse) {
         result = false;
        }
      });

  return result!;
  }
}
