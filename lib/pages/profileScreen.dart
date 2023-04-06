
import 'package:barnameneviss/pages/mainScreen.dart';
import 'package:barnameneviss/pages/shimmerCurrentCourse.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/registerController.dart';
import '../widget/SendCodeWidget.dart';
import '../widget/SendNameWidget.dart';
import '../widget/VerifyWidget.dart';

class profileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //homeScreen.route = 'profile';

    return Scaffold(
      body: SafeArea(
          child: FutureBuilder(
        future: mainScreen.isRegistered(),
        builder: ((context, snapshot) {
          if (snapshot.data == null)
          {
            return shimmerCurrentCourse();
          } 
          else if( snapshot.data == true) 
          {
            return LoginWidget();
          }
          else
          {
            return RegisterWidget();
          }
          
        }),
      )),
    );
  }
}

class LoginWidget extends StatelessWidget {
  const LoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
         
          //Text('hiiiiiiiiiiiiii')
          Text(mainScreen.pref!.getString('Name').toString()),
          Text(mainScreen.pref!.getString('Family').toString()),
          Text(mainScreen.pref!.getString('Mobile').toString()),
          
        ],
      ),
    );
  }
}

class RegisterWidget extends StatelessWidget {
  const RegisterWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
     Get.find<registerController>()
                              .changeVisibility(true, false, false, );
                            
    return GetBuilder<registerController>(
      id: '10',
      builder: (builder) {
        return Column(
          children: [
            SendCodeWidget(
              visible: Get.find<registerController>().visibleCode,
            ),
            VerifyWidget(
              visible: Get.find<registerController>().visibleVerify,
            ),
            SendNameWidget(visible: Get.find<registerController>().visibleName),
          ],
        );
      },
    );
  }
}
