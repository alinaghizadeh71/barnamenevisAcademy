
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
   SharedPreferences? pref;
   bool? Registered;
class CircularProgressController extends GetxController {
  Future<void> openAndCloseLoadingDialog() async {
    showDialog(
      context: Get.overlayContext!,
      barrierDismissible: false,
      builder: (_) => WillPopScope(
        onWillPop: () async => false,
        child: Center(
          child: SizedBox(
            width: 60,
            height: 60,
            child: CircularProgressIndicator(
              strokeWidth: 10,
            ),
          ),
        ),
      ),
    ); 
   

    // await Future.delayed(Duration(seconds: 3));
    // Navigator.of(Get.overlayContext).pop();
  }
 //await Future.delayed(Duration(seconds: 3));
 
 
   
  void dialog(bool registered) {
    // Dismiss CircularProgressIndicator
    Navigator.of(Get.overlayContext!).pop();
    Get.dialog(
      AlertDialog(
        title: registered ? Text("register") : Text("login"),
        content:registered ? Text("register") : Text("login"),
        actions: <Widget>[
          ElevatedButton(
            child: Text("CLOSE"),
            onPressed: () {
              Get.back();
            },
          )
        ],
      ),
      barrierDismissible: false,
    );
  }
}
