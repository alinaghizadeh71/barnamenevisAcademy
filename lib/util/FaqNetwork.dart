
import 'package:barnameneviss/models/faqModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class FaqNetwork {
  static Uri  UrlFaq = Uri.parse('https://retoolapi.dev/6qv8HB/faq');
  static List<FaqModel>  FaqList = [];
 static bool result=false;
  static Uri urlWithId(String id) {
    Uri url = Uri.parse('https://retoolapi.dev/6qv8HB/faq/$id');
    return url;
  }

  static Future<bool> getData() async {
    FaqList.clear();
    await http.get(UrlFaq).then(
      (response) {
        if (response.statusCode == 200) {
          List jsonlistSlideShow = convert.jsonDecode(response.body);
          jsonlistSlideShow.forEach((json) {
            FaqList.add(FaqModel.fromJson(json));
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
    CategoryModel newitem = CategoryModel(Id: id, Title: title);
    await http
        .put(urlWithId(id), body: newitem.toJson())
        .then((value) => print(value));
  }
 */
  static void delDate({required String id}) async {
     http
        .delete(urlWithId(id))
        .then((response) => print('deleteeeeeeee${response.body}'));
  }

/*   static void postData(
      {required String id, required String title}) async {
    CategoryModel newitem = CategoryModel(Id: id, Title: title);
     http
        .post(UrlFaq, body: newitem.toJson())
        .then((response) => print('َAddddddddddddddddddddddddd${response.body}'));
  } */
}