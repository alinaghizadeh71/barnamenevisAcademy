import 'package:flutter/material.dart';

import '../constant.dart';

class TextFieldWidget extends StatelessWidget {
  late final String hinttext;
  late final String errortext;
  late final TextInputType type;
  late final bool enabled;
  late final TextEditingController controller;
  TextFieldWidget(
      {required this.controller, required this.hinttext, required this.type,required this.errortext,this.enabled=true}) {}
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) 
      {
        if(value==null || value.isEmpty)
        {
          return errortext;
        }
        return null;
      },
      controller: controller,
      keyboardType:type,
      enabled:enabled ,
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
       // hintText:hinttext,
        labelText: hinttext,
        border: UnderlineInputBorder(
            borderSide: BorderSide(color: kgraydark),
            borderRadius: BorderRadius.circular(10)),
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color:kgraydark),
            borderRadius: BorderRadius.circular(10)),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color:kgraydark),
            borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
