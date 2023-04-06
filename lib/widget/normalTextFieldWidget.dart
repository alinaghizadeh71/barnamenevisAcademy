import 'package:flutter/material.dart';

import '../constant.dart';
import '../controllers/textFieldController.dart';

class normalTextFieldWidget extends StatelessWidget {
  String? title;
  Function()? fun;
  TextEditingController? controller;
  TextInputType? type;
  TextDirection? dir;
  TextAlign? align;
  normalTextFieldWidget({required this.controller,required this.fun,required this.title,required this.type,required this.dir,required this.align});
  @override
  Widget build(BuildContext context) {
  
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child:TextField(   
        textAlign: align!,
        keyboardType: type,
        onTap:fun!,            
        controller: controller,
        style: TextStyle(
          color: Colors.black,
        ),
        textDirection:dir,
        cursorColor: kgray,
        decoration: InputDecoration(
          hintText:title,
        
          hintTextDirection: TextDirection.rtl,
          hintStyle: TextStyle(color: kgray),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: kgraylight),
              borderRadius: BorderRadius.circular(10)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: kgraylight),
              borderRadius: BorderRadius.circular(10)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: kgraylight),
              borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }
}