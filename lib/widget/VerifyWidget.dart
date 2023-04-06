import 'dart:math';
import '../controllers/ThemeController.dart';
import '../controllers/TimerController.dart';
import '../controllers/registerController.dart';
import 'package:barnameneviss/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:get/get.dart';
import '../controllers/textFieldController.dart';
import '../widget/SendCodeWidget.dart';
import 'package:http/http.dart' as http;

class VerifyWidget extends StatelessWidget {
  bool visible;
  VerifyWidget({required this.visible});
  var timerController = Get.find<TimerController>();
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
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.all(20.0),
                  child: Text(
                    'کد به شماره ${Get.find<textFieldController>().MobileController!.text} پیامک شد',
                    style: TextStyle(color: kgraydark, fontSize: 18.0),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                GetBuilder<TimerController>(
                    id: '5',
                    builder: ((controller) {
                      return VerifyCodeWidget(
                        visible: (timerController.seconds == 0) ? false : true,
                      );
                    })),
                SizedBox(
                  height: 20.0,
                ),
                TimerWidget(),
                SizedBox(
                  height: 20.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TimerWidget extends StatelessWidget {
  const TimerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var timerController = Get.find<TimerController>();
    var themeController = Get.find<ThemeController>();
    timerController.startTimer(rest: false);
    return Container(
      margin: const EdgeInsets.all(10),
      child: GetBuilder<TimerController>(
          id: '6',
          init: TimerController(),
          builder: (context) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                /// Center Circle
                GetBuilder<ThemeController>(
                    id: 7,
                    builder: (context) {
                      return Container(
                        decoration: BoxDecoration(
                          color: themeController.isDarkMode
                              ? const Color.fromARGB(255, 21, 21, 21)
                              : Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 10.0,
                                offset: const Offset(5, 5),
                                color: themeController.isDarkMode
                                    ? Colors.black
                                    : const Color.fromARGB(109, 144, 144, 144)),
                            BoxShadow(
                                blurRadius: 10.0,
                                offset: const Offset(-5, -5),
                                color: themeController.isDarkMode
                                    ? const Color.fromARGB(255, 27, 27, 27)
                                    : const Color.fromARGB(255, 243, 243, 243))
                          ],
                        ),
                        width: 100,
                        height: 100,
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: CircularProgressIndicator(
                                strokeWidth: 5,
                                valueColor: AlwaysStoppedAnimation(
                                    timerController.seconds == 180
                                        ? Colors.green
                                        : Colors.red),
                                backgroundColor: themeController.isDarkMode
                                    ? const Color.fromARGB(255, 34, 34, 34)
                                    : const Color.fromARGB(255, 237, 237, 237),
                                value: timerController.seconds /
                                    TimerController.maxSeconds,
                              ),
                            ),
                            Center(
                              child: Text(
                                timerController.seconds.toString(),
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: timerController.isCompleted()
                                      ? const Color.fromARGB(255, 8, 123, 12)
                                      : const Color.fromARGB(255, 178, 14, 2),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }),

                SizedBox(
                  height: 40.0,
                ),
                GetBuilder<TimerController>(
                    id: '4',
                    builder: ((controller) {
                      return changeNumber(
                        visible: (timerController.seconds == 0) ? true : false,
                      );
                    })),
                SizedBox(
                  height: 20.0,
                ),
                GetBuilder<TimerController>(
                    id: '8',
                    builder: ((controller) {
                      return againSendCode(
                        visible: (timerController.seconds == 0) ? true : false,
                      );
                    }))
              ],
            );
          }),
    );
  }
}

class changeNumber extends StatelessWidget {
  bool? visible;
  changeNumber({required this.visible});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.find<registerController>().changeVisibility(true, false, false);
      },
      child: Visibility(
        visible: visible!,
        child: Text(
          'تعییر شماره',
          style: TextStyle(fontSize: 16, color: kblue),
        ),
      ),
    );
  }
}

class againSendCode extends StatelessWidget {
  bool? visible;
  static int? activecode;
  var timerController = Get.find<TimerController>();
  againSendCode({required this.visible});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        activecode = 1000 + Random().nextInt(8999);
        Uri url = Uri.parse(
            'https://api.kavenegar.com/v1/634D31354D6D75794450566C31674B52775163306D77487671364B5561334E73696B41677A7078456E6F343D/verify/lookup.json?receptor=${Get.find<textFieldController>().MobileController!.text}&token=$activecode&template=verifyBarnamenevis');
        await http.post(url);
        timerController.resetTimer();
      },
      child: Visibility(
        visible: visible!,
        child: Text(
          'ارسال مجدد  کد',
          style: TextStyle(fontSize: 16, color: kblue),
        ),
      ),
    );
  }
}

class VerifyCodeWidget extends StatelessWidget {
  bool? visible;
  VerifyCodeWidget({required this.visible});
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visible!,
      child: VerificationCode(
        textStyle: TextStyle(fontSize: 20.0, color: Colors.red[900]),
        keyboardType: TextInputType.number,
        underlineColor: kblue,
        length: 4,
        cursorColor: Colors.blue,
        clearAll: Padding(
            padding: const EdgeInsets.all(8.0),
            child:
                Container() /* Text(
                                'حذف همه',
                                style: TextStyle(
                                    fontSize: 14.0,
                                    decoration: TextDecoration.underline,
                                    color: Colors.blue[700]),
                              ), */

            ),
        onCompleted: (String value) {
          if (SendCodeWidget.activecode.toString() == value) {
            Get.find<registerController>().changeVisibility(false, true, false);
          } else {
            Get.snackbar('خطا', 'کد وارد شده صحیح نمی باشد',
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
                  'کد وارد شده صحیح نمی باشد',
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.right,
                  style: TextStyle(color: Colors.white),
                ));
          }
        },
        onEditing: (bool value) {},
      ),
    );
  }
}
