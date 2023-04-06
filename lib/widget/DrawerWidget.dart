import 'dart:ui';

import 'package:barnameneviss/constant.dart';
import 'package:barnameneviss/models/drawerModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class drawerWidget extends StatelessWidget {
  drawerWidget({super.key});
  List<drawerModel> listdrawer = [  
    drawerModel(icon:Icon(Icons.person_outline_sharp,color: kgray,), title:  'اساتید'),
    drawerModel(icon:Icon(Icons.person_outline_outlined,color: kgray), title:   'دانشجویان'),
    drawerModel(icon:Icon(Icons.person_outlined,color: kgray), title:  'گیک تاک'),
    drawerModel(icon:Icon(Icons.format_quote_outlined,color: kgray), title: 'درخواست ها'),
    drawerModel(icon:Icon(Icons.charging_station_outlined,color: kgray), title:  'آمار'),
    drawerModel(icon:Icon(Icons.settings_outlined,color: kgray), title:   'تنظیمات'),
    drawerModel(icon:Icon(Icons.email_outlined,color: kgray), title:  'ارتباط باما'),

  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            color: kblue,
            height: 200,
            width: Get.width,
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical:5.0),
                  child: CircleAvatar(
                    child: ClipOval(
                        child: Image.network(
                      'https://barnameneviss.ir/wp-content/uploads/2020/09/badpey-325x340.png',
                      fit: BoxFit.cover,
                    )),
                    backgroundColor: Colors.white,
                    radius: 50,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Text(
                    'احمد بادپی',
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ),
                ),
                Text(
                  '09139616246',
                  style: TextStyle(color: kgray, fontSize: 15),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListView.separated(
              itemBuilder: ((context, index) {
                return GestureDetector(
                  onTap: (){
                    Get.toNamed('/BarChart');
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10.0,top: 10.0),
                        child: Text(
                    listdrawer[index].title!,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, color: kgrayverydark),
                  ),
                      ),
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.only(top: 10.0),
                    child:listdrawer[index].icon!,
                  )
                    ],
                  ),
                );
              }),
              separatorBuilder: (context, index) {
                return Divider(
                  endIndent: 1,
                  color: kgraylight,
                );
              },
              itemCount: listdrawer.length,
              shrinkWrap: true,
            ),
          )
        ],
      ),
    );
  }
}
