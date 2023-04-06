import 'package:barnameneviss/pages/homeScreen.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class registerController extends GetxController {
 var visibleCode;
  var visibleName;
  var visibleVerify;
  registerController() {
     visibleCode= true;
   visibleName = false;
   visibleVerify = false;
  
  }
  void changeVisibility(var Code, var Name, var Verify) {
    visibleCode = Code;
    visibleName = Name;
    visibleVerify = Verify;
    update(['10']);
  }
}
