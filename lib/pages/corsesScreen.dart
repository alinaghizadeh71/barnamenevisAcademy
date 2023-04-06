import 'package:barnameneviss/util/TeacherNetwork.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../constant.dart';
import '../controllers/tabFilterController.dart';
import '../controllers/textFieldController.dart';
import '../models/courseModel.dart';
import '../util/CategoryNetwork.dart';
import '../util/CourseNetwork.dart';
import '../widget/CustomAppBar.dart';
import '../widget/DrawerWidget.dart';
import '../widget/FilterWidget.dart';
import '../widget/GridWidget.dart';
import '../widget/searchWidget.dart';
import 'homeScreen.dart';

late final bool isSearch;

class couresScreen extends StatelessWidget {
  //bool? isDrawer;
  // couresScreen({required this.isDrawer});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: SafeArea(
          child: Drawer(
        child: drawerWidget(),
      )),
      //key:isDrawer! ? Get.find<drawerController>().scaffoldKey : key,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            CustomAppbar(),            
            SearchWidget(
              controller:
                  Get.find<textFieldController>().searchtextFieldController,
              autofocuss: SearchTextFieldWidget.issearch,
              hint: 'دنبال چه دوره ای میگردی؟',
              iscourse: true,
            ),
            SizedBox(
              height: 20,
            ),
            FilterWidget(
                list: CategoryNetwork.categoryList, symmetrichorizontal: 15),
            GetBuilder<tabFilterController>(id: '1', builder: (builder){
              return GridWidget(route: 'course');
            }),
          ],
        ),
      )),
    );
  }
}