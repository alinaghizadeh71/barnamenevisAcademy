import 'package:barnameneviss/controllers/tabFilterController.dart';
import 'package:barnameneviss/pages/corsesScreen.dart';
import 'package:barnameneviss/pages/faqScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constant.dart';
import '../controllers/faqController.dart';
import '../controllers/textFieldController.dart';

class SearchWidget extends StatelessWidget {
  TextEditingController? controller;
  bool? autofocuss;
  String? hint;
  bool? iscourse;
  SearchWidget(
      {required this.controller,
      required this.autofocuss,
      required this.hint,
      required this.iscourse});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10, top: 20),
      child: TextField(
        onChanged: (text) {
          print('page courses${text}');
          iscourse!
              ? {
                  if (Get.find<textFieldController>()
                          .searchtextFieldController!
                          .text
                          .length >=
                      3)
                    {
                      Future.delayed(Duration(seconds: 2)).then((value) {
                        Get.find<tabFilterController>().filterwithtext(
                            Get.find<textFieldController>()
                                .searchtextFieldController!
                                .text);
                        Get.find<tabFilterController>().currentIndex = 0;
                      })
                    }
                }
              : Get.find<FaqController>().filterFaq(text);
        },
        autofocus: autofocuss!,
        controller: controller,
        style: TextStyle(color: Colors.black),
        textDirection: TextDirection.rtl,
        cursorColor: kgray,
        decoration: InputDecoration(
          hintText: hint,
          suffixIcon: Icon(
            Icons.search_rounded,
            color: kgray,
          ),
          hintTextDirection: TextDirection.rtl,
          hintStyle: TextStyle(color: kgray),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: kgraylight),
              borderRadius: BorderRadius.circular(10)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: kgraylight),
              borderRadius: BorderRadius.circular(10)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: kgraylight),
              borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }
}
