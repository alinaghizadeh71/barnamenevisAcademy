import 'package:barnameneviss/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class shimmerCurrentCourse extends StatelessWidget {
  const shimmerCurrentCourse({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Shimmer.fromColors(
        child: Column(
          children: [
             SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: EdgeInsets.all(30.0),
              child: Center(
                child: CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.white,
                ),
              ),
            ),
          
            Container(
              color: Colors.white,
              margin: EdgeInsets.symmetric(horizontal: 80.0),
              height: 30,
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              color: Colors.white,
              margin: EdgeInsets.symmetric(horizontal: 60.0),
              height: 30,
            ),
              SizedBox(
              height: 10.0,
            ),
            Container(
              color: Colors.white,
              margin: EdgeInsets.all(10.0),
              height: 70,
            ),
            Container(
              color: Colors.white,
              margin: EdgeInsets.all(10.0),
              height: 200,
            ),
           
            Container(
              color: Colors.white,
              margin: EdgeInsets.symmetric(horizontal: 40.0),
              height: 30,
            ),
              Container(
              color: Colors.white,
              margin: EdgeInsets.all(10.0),
              height: 200,
            ),
            //  basebody(),
          ],
        ),
        baseColor: kgray,
        highlightColor: kgraylight,
      ),
    );
  }
}
