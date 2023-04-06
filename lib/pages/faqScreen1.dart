/* import 'package:accordion/accordion.dart';
import 'package:accordion/controllers.dart'; */
import 'package:barnameneviss/constant.dart';
import 'package:barnameneviss/widget/CustomAppBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/drawerController.dart';
import '../controllers/textFieldController.dart';
import '../widget/DrawerWidget.dart';
import '../widget/searchWidget.dart';

final _headerStyle = const TextStyle(
    color: kgraydark, fontSize: 15, fontWeight: FontWeight.bold);
final _contentStyleHeader = const TextStyle(
    color: kgraylight, fontSize: 14, fontWeight: FontWeight.w700);
final _contentStyle = const TextStyle(
    color: kgraydark, fontSize: 14, fontWeight: FontWeight.normal);

class faqScreen1 extends StatelessWidget {
  faqScreen1({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: SafeArea(
          child: Drawer(
        child: drawerWidget(),
      )),
      key: Get.find<drawerController>().scaffoldKey,
      body: Column(
        children: [
          CustomAppbar(),
          SearchWidget(
              controller:
                  Get.find<textFieldController>().searchtextfaqController,
              autofocuss: false,
              hint:  'چه سوالی داری؟',
              iscourse: false),
          Expanded(
            child:Container() /* Accordion(
              maxOpenSections: 1,
              contentBorderColor: kgraylight,
              contentBackgroundColor: kgraylight,
              scaleWhenAnimating: true,
              openAndCloseAnimation: true,
              flipRightIconIfOpen: true,
              headerPadding:
                  const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
              sectionOpeningHapticFeedback: SectionHapticFeedback.heavy,
              sectionClosingHapticFeedback: SectionHapticFeedback.light,
              children: getAccordionList(),
            ), */
          ),
        ],
      ),
    );
  }
}
/* 
List<AccordionSection> getAccordionList() {
  List<AccordionSection> listAccordion = [];
  List listfaq = getData();
  listfaq.forEach((value) {
    listAccordion.add(AccordionSection(
      isOpen: value.isopen!,
      rightIcon: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset(
          'assets/images/arrow.png',
          height: 16,
          width: 16,
        ),
      ),
      headerBackgroundColor: kgrayverylight,
      headerBackgroundColorOpened: kgraylight,
      header: Text(
        value.title!,
        style: _headerStyle,
        textAlign: TextAlign.right,
      ),
      content: Text(
        value.res!,
        style: _contentStyle,
        textAlign: TextAlign.right,
        textDirection: TextDirection.rtl,
      ),
      contentHorizontalPadding: 5,
      contentBorderWidth: 1,
      onOpenSection: () {},
      onCloseSection: () {
        // accordionController item= Get.find<accordionController>().listAccordion.firstWhere((value) => value.header==lis)
      },
    ));
  });
  return listAccordion;
}
 */

