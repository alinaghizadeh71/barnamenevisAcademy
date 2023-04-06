import '../models/slideShowModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class SlideShowNetwork {
  static Uri UrlSlideShow = Uri.parse('https://retoolapi.dev/dGDySO/data');
  static List<SlideShowModel> slideShowList = [];
 static bool result=false;
  static Uri urlWithId(String id) {
    Uri url = Uri.parse('https://retoolapi.dev/dGDySO/data/$id');
    return url;
  }

static Future<bool> getData() async {
    slideShowList.clear();
    await http.get(UrlSlideShow).then(
      (response) {
        if (response.statusCode == 200) {
          List jsonlistSlideShow = convert.jsonDecode(response.body);
          jsonlistSlideShow.forEach((json) {
            slideShowList.add(SlideShowModel.fromJson(json));
               result=true;
          });
          return result;
        }
      
      },
    );
       return result;
  }

  static void changeDate(
      {required String name, required String path, required String id}) async {
    SlideShowModel newitem = SlideShowModel(Id: id, Name: name, Path: path);
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
      {required String name, required String path, required String id}) async {
    SlideShowModel newitem = SlideShowModel(Id: id, Name: name, Path: path);
     http
        .post(UrlSlideShow, body: newitem.toJson())
        .then((response) => print('updattttttttttttttte${response.body}'));
  }
}
