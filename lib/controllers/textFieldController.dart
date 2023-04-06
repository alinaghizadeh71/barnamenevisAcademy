import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class textFieldController extends GetxController {
  TextEditingController? searchtextFieldController;
  TextEditingController? searchtextfaqController;
  TextEditingController? sendcodeController;
  TextEditingController? NameController;
  TextEditingController? FamilyController;
  TextEditingController? MobileController;
  @override
  void onInit() {
    searchtextFieldController=TextEditingController();
    searchtextfaqController=TextEditingController();
    sendcodeController=TextEditingController();
    NameController=TextEditingController();
    FamilyController=TextEditingController();
    MobileController=TextEditingController();
    super.onInit();
  }
}