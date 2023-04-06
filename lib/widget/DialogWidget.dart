import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant.dart';

Future DialogWidget(String msg) async {
  Get.defaultDialog(
      textConfirm: 'باشه',
      confirmTextColor: kblue,
      confirm: GestureDetector(
        child: Text('باشه'),
        onTap: (() => Get.back()),
      ),
      onConfirm: () => Get.back(),
      buttonColor: kblue,
      barrierDismissible: false,
      custom: Icon(Icons.home),
      title: '',
      radius: 10.0,
      backgroundColor: Colors.white,
      content: ListBody(
        children: [
          Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Image.asset(
                'assets/images/ok.png',
                height: 150,
                width: 150,
              )),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
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
                  style: TextStyle(color: kgray, fontSize: 14.0),
                  textDirection: TextDirection.rtl))
        ],
      ));
}
