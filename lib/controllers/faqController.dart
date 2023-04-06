import 'package:barnameneviss/models/faqModel.dart';
import 'package:get/get.dart';
class FaqController extends GetxController {
  RxList<FaqModel> faqList=<FaqModel>[].obs;
  RxList<FaqModel> resultList=<FaqModel>[].obs;
 var selected=0.obs;
   @override
  void onInit() {
  super.onInit();
  resultList.value = faqList;
 }
void filterFaq(String item) {
  List<FaqModel> results = [];
  if (item.isEmpty || item=='') {
    results = faqList;
  } else {
    results = faqList
        .where((element) => element.question
            .contains(item)
            ||
            element.answer
            .contains(item))
        .toList();  }
  resultList.value=results;
}
}