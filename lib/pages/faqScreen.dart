import 'package:barnameneviss/constant.dart';
import 'package:barnameneviss/controllers/faqController.dart';
import 'package:barnameneviss/util/FaqNetwork.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/drawerController.dart';
import '../controllers/textFieldController.dart';
import '../models/faqModel.dart';
import '../widget/CustomAppBar.dart';
import '../widget/DrawerWidget.dart';
import '../widget/searchWidget.dart';

class faqScreen extends StatelessWidget {
  faqScreen({super.key});
  final username_controller = TextEditingController();
  final password_controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    getData();

    return Scaffold(
        endDrawer: SafeArea(
            child: Drawer(
          child: drawerWidget(),
        )),
        key: Get.find<drawerController>().scaffoldKey,
        body: Column(
          children: [
            CustomAppbar(),
            SearchWidget(
              controller:
                  Get.find<textFieldController>().searchtextfaqController,
              autofocuss: false,
              hint:  'چه سوالی داری؟',
              iscourse: false,
            ),
            //searchWidget(),
            Expanded(
                child: Obx(
              () => ListView.builder(
                key: Key('builder ${  Get.find<FaqController>().selected.value.toString()}'), //attention
                itemBuilder: (context, index) {
                  return ExpansionTile(
                    
                    key: Key(index.toString()), //attention
                    initiallyExpanded: index ==
                        Get.find<FaqController>().selected.value, //attention
                    expandedCrossAxisAlignment: CrossAxisAlignment.end,
                    expandedAlignment: Alignment.centerRight,
                    backgroundColor: kgraylight,
                    title: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Text(
                        Get.find<FaqController>().resultList[index].question!,
                        textAlign: TextAlign.right,
                        style: TextStyle(color: kgrayverydark),
                      ),
                    ),
                    onExpansionChanged: ((newState) {
                      if (newState) {
                      Duration(seconds: 2);
                        Get.find<FaqController>().selected.value = index;
                      } else {
                        Get.find<FaqController>().selected.value = -1;
                      }
                    }),

                    children: <Widget>[
                      Padding(
                          padding: const EdgeInsets.only(
                              right: 55.0, bottom: 10.0, left: 10.0),
                          child: Text(
                            Get.find<FaqController>().resultList[index].answer!,
                            textAlign: TextAlign.right,
                            style: TextStyle(color: kgraydark),
                          ))
                    ],
                  );
                },
                itemCount: Get.find<FaqController>().resultList.length,
              ),
            ))
          ],
        ));
  }
}

void getData() {
  FaqNetwork.FaqList.forEach((value) {
    Get.find<FaqController>().faqList.add(value);
  });
  //Get.find<FaqController>().filterFaq('');
}
