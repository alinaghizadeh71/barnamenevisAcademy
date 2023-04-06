import 'package:barnameneviss/models/categoryModel.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class CategoryNetwork {
  static Uri UrlCategory = Uri.parse('https://retoolapi.dev/r4qcRS/data');
  static List<CategoryModel> categoryList = [];

 static bool result=false;
  static Uri urlWithId(String id) {
    Uri url = Uri.parse('https://retoolapi.dev/r4qcRS/data/$id');
    return url;
  }

 static Future<bool> getData() async {
    categoryList.clear();
    await http.get(UrlCategory).then(
      (response) {
        if (response.statusCode == 200) {
          List jsonlistSlideShow = convert.jsonDecode(response.body);
          jsonlistSlideShow.forEach((json) {
            categoryList.add(CategoryModel.fromJson(json));
           // print('categoryList:${categoryList.length}');
              result=true;
             //  Get.find<networkco>().category.value=true;
          });
           return result;
        }
      },
    );
      return result;
  }

  static void changeDate(
      {required String id, required String title}) async {
    CategoryModel newitem = CategoryModel(Id: id, Title: title);
    await http
        .put(urlWithId(id), body: newitem.toJson())
        .then((value) => print(value));
  }

  static void delDate({required String id}) async {
     http
        .delete(urlWithId(id))
        .then((response) => print('deleteeeeeeee${response.body}'));
  }

  static void postData(
      {required String id, required String title}) async {
    CategoryModel newitem = CategoryModel(Id: id, Title: title);
     http
        .post(UrlCategory, body: newitem.toJson())
        .then((response) => print('َAddddddddddddddddddddddddd${response.body}'));
  }
}