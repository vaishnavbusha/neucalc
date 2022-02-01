import 'package:calc/controller/themecontroller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controller/controller.dart';
import '../model/button.dart';
import '../controller/themecontroller.dart';

class Calculator extends StatelessWidget {
  final controller = Get.put(CalculaterController());
  final themecontroller = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Obx(
      () => Scaffold(
        backgroundColor: Color(themecontroller.bgcolor.value),
        body: SafeArea(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: height / 40.8), //value is 20
                  child: NeumorphicButton(
                    onPressed: () => themecontroller.toggletheme(),
                    style: NeumorphicStyle(
                      color: themecontroller.togglebuttoncolor.value,
                      shape: NeumorphicShape.concave,
                      boxShape: NeumorphicBoxShape.circle(),
                      lightSource: LightSource.topRight,
                      shadowLightColor: themecontroller.shadowcolor.value,
                      depth: 0,
                    ),
                    child: NeumorphicIcon(
                      themecontroller.toggleicon.value,
                      size: width / 16,
                      style: NeumorphicStyle(
                          color: themecontroller.specialtextcolor.value,
                          depth: 0),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        height: height / 7.16,
                        alignment: Alignment.bottomRight,
                        //color: Colors.red,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Obx(
                            () => Text(
                              controller.history.value,
                              style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                    color: themecontroller.textcolor.value
                                        .withOpacity(0.5),
                                    letterSpacing: .5,
                                    fontSize: height / 24),
                              ),
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ),
                        margin: EdgeInsets.only(
                          left: width / 14.4, // value is 30
                          right: width / 14.4, // value is 30
                        ),
                      ),
                      Container(
                        //color: Colors.blue,
                        child: Container(
                          child: SingleChildScrollView(
                            reverse: true,
                            scrollDirection: Axis.horizontal,
                            child: Obx(
                              () => Text(
                                controller.expression.value,
                                style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(
                                    color: themecontroller.textcolor.value,
                                    letterSpacing: .5,
                                    fontSize: height / 17, // value is 60
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        margin: EdgeInsets.only(
                            left: width / 14.4,
                            right: width / 14.4,
                            bottom: width / 21.6), // value is 30,30,20
                      ),
                    ],
                  ),
                ),
                ///// button codes
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(height / 102),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Neubutton(
                            symbol: 'AC',
                            color: themecontroller.specialtextcolor.value,
                            buttononclick: controller.allClear,
                            buttoncolor: themecontroller.buttoncolor.value,
                            shadowcolor: themecontroller.shadowcolor.value,
                          ),
                          Neubutton(
                            symbol: 'C',
                            color: themecontroller.specialtextcolor.value,
                            buttononclick: controller.clear,
                            buttoncolor: themecontroller.buttoncolor.value,
                            shadowcolor: themecontroller.shadowcolor.value,
                          ),
                          Neubutton(
                            symbol: 'mod',
                            color: themecontroller.specialtextcolor.value,
                            buttononclick: controller.numClick,
                            buttoncolor: themecontroller.buttoncolor.value,
                            shadowcolor: themecontroller.shadowcolor.value,
                          ),
                          Neubutton(
                            symbol: '/',
                            color: themecontroller.specialtextcolor.value,
                            buttononclick: controller.numClick,
                            buttoncolor: themecontroller.buttoncolor.value,
                            shadowcolor: themecontroller.shadowcolor.value,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(width / 54),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Neubutton(
                            symbol: '7',
                            color: themecontroller.textcolor.value,
                            buttononclick: controller.numClick,
                            buttoncolor: themecontroller.buttoncolor.value,
                            shadowcolor: themecontroller.shadowcolor.value,
                          ),
                          Neubutton(
                            symbol: '8',
                            color: themecontroller.textcolor.value,
                            buttononclick: controller.numClick,
                            buttoncolor: themecontroller.buttoncolor.value,
                            shadowcolor: themecontroller.shadowcolor.value,
                          ),
                          Neubutton(
                            symbol: '9',
                            color: themecontroller.textcolor.value,
                            buttononclick: controller.numClick,
                            buttoncolor: themecontroller.buttoncolor.value,
                            shadowcolor: themecontroller.shadowcolor.value,
                          ),
                          Neubutton(
                            symbol: 'x',
                            color: themecontroller.specialtextcolor.value,
                            buttononclick: controller.numClick,
                            buttoncolor: themecontroller.buttoncolor.value,
                            shadowcolor: themecontroller.shadowcolor.value,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(width / 54),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Neubutton(
                            symbol: '4',
                            color: themecontroller.textcolor.value,
                            buttononclick: controller.numClick,
                            buttoncolor: themecontroller.buttoncolor.value,
                            shadowcolor: themecontroller.shadowcolor.value,
                          ),
                          Neubutton(
                            symbol: '5',
                            color: themecontroller.textcolor.value,
                            buttononclick: controller.numClick,
                            buttoncolor: themecontroller.buttoncolor.value,
                            shadowcolor: themecontroller.shadowcolor.value,
                          ),
                          Neubutton(
                            symbol: '6',
                            color: themecontroller.textcolor.value,
                            buttononclick: controller.numClick,
                            buttoncolor: themecontroller.buttoncolor.value,
                            shadowcolor: themecontroller.shadowcolor.value,
                          ),
                          Neubutton(
                            symbol: '_',
                            color: themecontroller.specialtextcolor.value,
                            buttononclick: controller.numClick,
                            buttoncolor: themecontroller.buttoncolor.value,
                            shadowcolor: themecontroller.shadowcolor.value,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(width / 54),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Neubutton(
                            symbol: '1',
                            color: themecontroller.textcolor.value,
                            buttononclick: controller.numClick,
                            buttoncolor: themecontroller.buttoncolor.value,
                            shadowcolor: themecontroller.shadowcolor.value,
                          ),
                          Neubutton(
                            symbol: '2',
                            color: themecontroller.textcolor.value,
                            buttononclick: controller.numClick,
                            buttoncolor: themecontroller.buttoncolor.value,
                            shadowcolor: themecontroller.shadowcolor.value,
                          ),
                          Neubutton(
                            symbol: '3',
                            color: themecontroller.textcolor.value,
                            buttononclick: controller.numClick,
                            buttoncolor: themecontroller.buttoncolor.value,
                            shadowcolor: themecontroller.shadowcolor.value,
                          ),
                          Neubutton(
                            symbol: '+',
                            color: themecontroller.specialtextcolor.value,
                            buttononclick: controller.numClick,
                            buttoncolor: themecontroller.buttoncolor.value,
                            shadowcolor: themecontroller.shadowcolor.value,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(width / 54),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Neubutton(
                            symbol: '.',
                            color: themecontroller.textcolor.value,
                            buttononclick: controller.numClick,
                            buttoncolor: themecontroller.buttoncolor.value,
                            shadowcolor: themecontroller.shadowcolor.value,
                          ),
                          Neubutton(
                            symbol: '0',
                            color: themecontroller.textcolor.value,
                            buttononclick: controller.numClick,
                            buttoncolor: themecontroller.buttoncolor.value,
                            shadowcolor: themecontroller.shadowcolor.value,
                          ),
                          Neubutton(
                            symbol: 'del',
                            color: themecontroller.specialtextcolor.value,
                            buttononclick: controller.del,
                            buttoncolor: themecontroller.buttoncolor.value,
                            shadowcolor: themecontroller.shadowcolor.value,
                          ),
                          Neubutton(
                            symbol: '=',
                            color: themecontroller.specialtextcolor.value,
                            buttononclick: controller.evaluate,
                            buttoncolor: themecontroller.buttoncolor.value,
                            shadowcolor: themecontroller.shadowcolor.value,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height / 81.6,
                    ),
                  ],
                ),
              ]),
        ),
      ),
    );
  }
}
