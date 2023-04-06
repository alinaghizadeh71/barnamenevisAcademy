import 'dart:ffi';

import 'package:barnameneviss/models/categoryModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant.dart';
import '../controllers/tabFilterController.dart';
import '../controllers/textFieldController.dart';
import '../models/courseModel.dart';
import '../util/CourseNetwork.dart';

class FilterWidget extends StatelessWidget {
  List<CategoryModel>? list = [];
  List<CourseModel> v_courseList = [];
  double symmetrichorizontal;
  FilterWidget({required this.list, required this.symmetrichorizontal});
  @override
  Widget build(BuildContext context) {
    Get.find<tabFilterController>().currentIndex = 0;
    return Container(
      alignment: Alignment.center,
      height: 50,
      padding: EdgeInsets.only(bottom: 10),
      width: Get.width,
      child: ListView.builder(
          itemBuilder: (value, index) {
            return GetBuilder<tabFilterController>(
                id: '2',
                builder: (builder) {
                  return GestureDetector(
                    onTap: () {
                      // print(list![index].Id);
                      Get.find<textFieldController>()
                          .searchtextFieldController!
                          .clear();
                      Get.find<tabFilterController>().currentIndex =
                          index;
                      Get.find<tabFilterController>()
                          .setfilter(int.parse(list![index].Id));
                      ;
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: symmetrichorizontal),
                      child: Column(
                        children: [
                          Expanded(
                              child: Text(list![index].Title,
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Get.find<tabFilterController>()
                                                  .currentIndex
                                                   ==
                                              index
                                          ? kgraydark
                                          : kgray))),
                          CircleAvatar(
                              radius: 4.0,
                              backgroundColor: Get.find<tabFilterController>()
                                          .currentIndex
                                           ==
                                      index
                                  ? kblue
                                  : Colors.transparent)
                        ],
                      ),
                    ),
                  );
                });
          },
          reverse: true,
          itemCount: list!.length,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal),
    );
  }
}
