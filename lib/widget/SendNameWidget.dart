import 'dart:math';

import '../util/UsersNetwork.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constant.dart';
import '../controllers/textFieldController.dart';
import '../models/UsersModel.dart';
import '../pages/currentCourseScreen.dart';
import '../widget/normalTextFieldWidget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SendNameWidget extends StatelessWidget {
  TextEditingController? txtController = TextEditingController();
  bool visible;
  SendNameWidget({required this.visible});
  @override
  Widget build(BuildContext context) {
    return Visibility(
        visible: visible,
        child: Expanded(
          child: Container(
            width: Get.width,
            height: Get.height,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  normalTextFieldWidget(
                    align: TextAlign.right,
                    dir: TextDirection.rtl,
                    type: TextInputType.name,
                    controller: Get.find<textFieldController>().NameController,
                    fun: () {},
                    title: 'نام خود را وارد کنید',
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  normalTextFieldWidget(
                    align: TextAlign.right,
                    dir: TextDirection.rtl,
                    type: TextInputType.name,
                    controller:
                        Get.find<textFieldController>().FamilyController,
                    fun: () {},
                    title: 'نام خانوادگی خودرا وارد کنید',
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: ButtonWidget(
                        enable: true,
                        title: 'ثبت نام',
                        fun: () async {
                          if (Get.find<textFieldController>()
                                      .NameController!
                                      .text
                                      .length >
                                  0 &&
                              Get.find<textFieldController>()
                                      .FamilyController!
                                      .text
                                      .length >
                                  0) {
                            //saved
                            String id = Random().nextInt(6000).toString();
                            SharedPreferences pref =
                                await SharedPreferences.getInstance();
                            await pref.setString(
                                'Name',
                                Get.find<textFieldController>()
                                    .NameController!
                                    .text);
                            await pref.setString(
                                'Family',
                                Get.find<textFieldController>()
                                    .FamilyController!
                                    .text);
                            await pref.setString(
                                'Mobile',
                                Get.find<textFieldController>()
                                    .MobileController!
                                    .text);
                            await pref.setString('Id', id);
                            await pref.setBool('isRegister', true);

                            //post
                            UsersModel newUser = UsersModel(
                                id: id,
                                name: Get.find<textFieldController>()
                                    .NameController!
                                    .text,
                                family: Get.find<textFieldController>()
                                    .FamilyController!
                                    .text,
                                mobile: Get.find<textFieldController>()
                                    .MobileController!
                                    .text);
                            UsersNetwork.postData(newitem: newUser);
                            //show dialog
                               Get.defaultDialog(
                                textConfirm: 'باشه',
                                confirmTextColor: kblue,
                                confirm: GestureDetector(
                                  child: Text('باشه'),
                                  onTap: (() => Get.toNamed('\mainscreen')),
                                ),
                                onConfirm: () => print('hhhhhhhhhhhhhhhhi'),
                                buttonColor: kblue,
                                barrierDismissible: false,
                                custom: Icon(Icons.home),
                                title: '',
                                radius: 10.0,
                                backgroundColor: Colors.white,
                                content: ListBody(
                                  children: [
                                    Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 20.0),
                                        child: Image.asset(
                                          'assets/images/ok.png',
                                          height: 150,
                                          width: 150,
                                        )),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 20.0),
                                      child: Center(
                                          child: Text(
                                        'درخواست شما با موفقیت ثبت شد!',
                                        style: TextStyle(
                                            color: kgraydark,
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold),
                                        textDirection: TextDirection.rtl,
                                      )),
                                    ),
                                    Center(
                                        child: Text('با شما تماس میگیریم"',
                                            style: TextStyle(
                                                color: kgray, fontSize: 14.0),
                                            textDirection: TextDirection.rtl))
                                  ],
                                ));
                            //end dialog
                          } else {
                            Get.snackbar('خطا',
                                'لطفا نام و نام خانودگی خود را وارد نمایید',
                                backgroundColor: kgraydark,
                                barBlur: 50.0,
                                colorText: Colors.white,
                                snackPosition: SnackPosition.BOTTOM,
                                forwardAnimationCurve: Curves.elasticInOut,
                                reverseAnimationCurve: Curves.easeOut,
                                titleText: Text(
                                  'خطا',
                                  textDirection: TextDirection.rtl,
                                  textAlign: TextAlign.right,
                                  style: TextStyle(color: Colors.white),
                                ),
                                messageText: Text(
                                  'لطفا نام و نام خانودگی خود را وارد نمایید',
                                  textDirection: TextDirection.rtl,
                                  textAlign: TextAlign.right,
                                  style: TextStyle(color: Colors.white),
                                ));
                          }
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      notifTell,
                      style: TextStyle(color: kgray),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
