import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constant.dart';
import '../controllers/TimerController.dart';
import '../controllers/registerController.dart';
import '../controllers/textFieldController.dart';
import '../pages/currentCourseScreen.dart';
import 'normalTextFieldWidget.dart';
import 'package:http/http.dart' as http;

class SendCodeWidget extends StatelessWidget {
  TextEditingController? txtController = TextEditingController();
  bool visible;
  static int? activecode;
  SendCodeWidget({required this.visible});
 var timerController = Get.find<TimerController>();
  @override
  Widget build(BuildContext context) {
    return  Visibility(
              visible: visible,
               child:Expanded(
                child: Container(
                  width: Get.width,
                  height: Get.height,
                  child: Center(
                    child:  Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                 mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 
                  Container(
                    alignment: Alignment.centerRight,
                    margin: const EdgeInsets.all(20.0),
                    child: Text(
                    
                      'شماره تماس خود را وارد کنید',
                      style: TextStyle(color: kgray,),
                    ),
                  ), SizedBox(height: 20.0,),
                  normalTextFieldWidget(
                     align: TextAlign.left,
                    dir: TextDirection.ltr,
                    controller: Get.find<textFieldController>().MobileController,
                    fun: () {},
                    title:'0913' ,
                    type: TextInputType.phone,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ButtonWidget(
                      enable: true,
                      title: 'ارسال کد',
                      fun: () async {
                        if (Get.find<textFieldController>()
                                .MobileController!
                                .text
                                .length ==
                            11) {
                          activecode = 1000 + Random().nextInt(8999);
                          Uri url = Uri.parse(  'https://api.kavenegar.com/v1/634D31354D6D75794450566C31674B52775163306D77487671364B5561334E73696B41677A7078456E6F343D/verify/lookup.json?receptor=${Get.find<textFieldController>().MobileController!.text}&token=$activecode&template=verifyBarnamenevis');
                          await http.post(url);
                          Get.find<registerController>()
                              .changeVisibility( false, false, true);
                              timerController.resetTimer();
                        } else {
                          Get.snackbar('خطا', 'شماره موبایل را به درستی وارد نمایید',
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
                                'شماره موبایل را به درستی وارد نمایید',
                                textDirection: TextDirection.rtl,
                                textAlign: TextAlign.right,
                                style: TextStyle(color: Colors.white),
                              ));
                        }
                      }),
                      SizedBox(height: 20.0,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      notifTell,
                      style: TextStyle(color: kgray),
                    ),
                  )
                ],
              
                    ),),)
      ),
    );
  }
}
