import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:barnameneviss/binding/mybinding.dart';
import 'package:barnameneviss/pages/mainScreen.dart';
import 'package:barnameneviss/routes/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(fontFamily: 'IRANYEKAN'),
      debugShowCheckedModeBanner: false,
      getPages: route.Pages,
      initialBinding: Mybinding(),
      defaultTransition: Transition.fadeIn,
      initialRoute: '/mainscreen',
     
    );
  }

 static changeColor(Color color, Brightness brightness) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: color, statusBarBrightness: brightness));
  } 
}
