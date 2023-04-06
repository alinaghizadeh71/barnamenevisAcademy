import 'package:barnameneviss/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class shimmerHome extends StatelessWidget {
  const shimmerHome({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: SingleChildScrollView(
            child: Shimmer.fromColors(
                baseColor: kgray,
                highlightColor: kgraylight,
                child: Column(
                   mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      height: Get.height*0.25,
                      width: Get.width,
                      color: Colors.white,
                    ),
                     SizedBox(height: 10.0,),
                    Container(
                      height:  Get.height*0.1,
                      width: Get.width,
                      color: Colors.red,
                    ),
                    SizedBox(height: 10.0,),
                    GridView.count(
                      physics: ScrollPhysics(),
                      mainAxisSpacing: 10.0,
                      crossAxisSpacing: 10.0,
                      shrinkWrap: true,
                      crossAxisCount: 2,
                      childAspectRatio: (Get.width / (Get.height) + 0.3),
                      children: [
                        Container(
                          color: Colors.white,
                          height: 100,
                          width: 150,
                        ),
                        Container(
                          color: Colors.white,
                          height: 100,
                          width: 150,
                        ),
                        Container(
                          color: Colors.white,
                          height: 100,
                          width: 150,
                        ),
                        Container(
                          color: Colors.white,
                          height: 100,
                          width: 150,
                        )
                      ],
                    ),
                 SizedBox(height: 10.0,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.white,
                        ),
                        CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.white,
                        ),
                        CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.white,
                        ),
                      ],
                    )
                  ],
                ) /* ListView.builder(
                      itemBuilder: (_, __) => Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: 48.0,
                              height: 48.0,
                              color: Colors.white,
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    width: double.infinity,
                                    height: 8.0,
                                    color: Colors.white,
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.symmetric(vertical: 2.0),
                                  ),
                                  Container(
                                    width: double.infinity,
                                    height: 8.0,
                                    color: Colors.white,
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.symmetric(vertical: 2.0),
                                  ),
                                  Container(
                                    width: 40.0,
                                    height: 8.0,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      itemCount: 6,
                    ) */
                )),
      ),
    );
  }
}
