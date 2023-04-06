import 'package:barnameneviss/controllers/drawerController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant.dart';

class CustomAppbar extends StatelessWidget {
 CustomAppbar({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 10, left: 10, top: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.white,
            child: Image.asset(
              'assets/images/mainlogo.png',
            ),
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: const [
                Text(
                  titleAppbar,
                  style: TextStyle(fontSize: 18, color: kgrayverydark,fontWeight: FontWeight.bold),
                  textAlign: TextAlign.right,
                ),
                Text(
                  subtitleAppbar,
                  style: TextStyle(fontSize: 12, color: kgraydark),
                  textAlign: TextAlign.right,
                ),
              ],
            ),
          ),         
          IconButton(onPressed: (){
            //Scaffold.of(context).openDrawer();
           Get.find<drawerController>().closeDrawer();
          }, icon:Image.asset(
            'assets/images/menu.png',
            width: 35,
            height: 35,
            alignment: Alignment.centerRight,
          ),)
        ],
      ),
    );
  }
}

