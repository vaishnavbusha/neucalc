import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeController extends GetxController {
  List l = [0xFFE5EAED, 0xff141518, 0xFF243441]; //white--black--bluegreen
  var bgcolor = 0xFFE5EAED.obs;
  var toggleicon = Icons.wb_sunny_outlined.obs;
  var togglebuttoncolor = Color(0xFFE5EAED).obs;
  var buttoncolor = Color(0xFFE5EAED).obs;
  var shadowcolor = Color(0xFFE5EAED).obs;
  var textcolor = Colors.black.obs;
  var specialtextcolor = Color(0xFFF05454).obs;
  final data = GetStorage();

  void toggletheme() {
    if (bgcolor.value == 0xFFE5EAED) {
      //change from white to black
      bgcolor.value = 0xff141518;
      toggleicon.value = Icons.bedtime;
      //togglebuttoncolor = Color(0xff202020);
      togglebuttoncolor.value = Color(0xff141518);
      //buttoncolor = Color(0xff393e46);
      buttoncolor.value = Color(0xff1A1B1F);
      //buttoncolor = Color(0xff243441);
      shadowcolor.value = Color(0xff202020);
      //shadowcolor = Color(0xff243441);
      textcolor.value = Color(0xff0affee);
      specialtextcolor.value = Color(0xfffa6901);
      data.write('themecolor', l[0]);
    } else if (bgcolor.value == 0xff141518) {
      //change from black to bluegreen
      bgcolor.value = 0xFF243441;
      toggleicon.value = Icons.terrain_rounded;
      togglebuttoncolor.value = Color(0xff243441);
      buttoncolor.value = Color(0xFF243441);
      shadowcolor.value = Color(0xFF243441);
      textcolor.value = Color(0xff0affee);
      specialtextcolor.value = Color(0xfffa6901);
      data.write('themecolor', l[1]);
    } else if (bgcolor.value == 0xFF243441) {
      //change from bluegreen to white
      bgcolor.value = 0xFFE5EAED;
      toggleicon.value = Icons.wb_sunny_outlined;
      togglebuttoncolor.value = Color(0xFFE5EAED);
      buttoncolor.value = Color(0xFFE5EAED);
      shadowcolor.value = Color(0xFFE5EAED);
      textcolor.value = Colors.black;
      specialtextcolor.value = Color(0xFFF05454);
      data.write('themecolor', l[2]);
    }
  }
}
