import 'package:calc/controller/hive_controller.dart';
import 'package:flutter/material.dart';

class ThemeController extends ChangeNotifier {
  IconData toggleicon = Icons.wb_sunny_outlined;
  int bgcolor = 0xFFE5EAED;
  int togglebuttoncolor = 0xFFE5EAED;
  int buttoncolor = 0xFFE5EAED;
  int shadowcolor = 0xFFE5EAED;
  int textcolor = 0xff000000;
  int specialtextcolor = 0xFFF05454;
  String font = 'Montserrat';
  void changeFont(String fontName) {
    font = fontName;
    HiveController.saveFont(fontName: fontName);
    notifyListeners();
  }

  initialiseTheme() {
    if (HiveController.getSavedColors() == 0xFFE5EAED) {
      bgcolor = 0xFFE5EAED;
      toggleicon = Icons.wb_sunny_outlined;
      togglebuttoncolor = 0xFFE5EAED;
      buttoncolor = 0xFFE5EAED;
      shadowcolor = 0xFFE5EAED;
      textcolor = 0xFF000000;
      specialtextcolor = 0xFFF05454;
    } else if (HiveController.getSavedColors() == 0xff111111) {
      bgcolor = 0xff111111;
      toggleicon = Icons.bedtime;
      togglebuttoncolor = 0xff141518;
      buttoncolor = 0xff111111;
      shadowcolor = 0xff151515;
      textcolor = 0xff0affee;
      specialtextcolor = 0xfffa6901;
    } else if (HiveController.getSavedColors() == 0xFF243441) {
      bgcolor = 0xFF243441;
      toggleicon = Icons.terrain_rounded;
      togglebuttoncolor = 0xff243441;
      buttoncolor = 0xFF243441;
      shadowcolor = 0xFF243441;
      textcolor = 0xff0affee;
      specialtextcolor = 0xfffa6901;
    }
  }

  void toggletheme() {
    if (HiveController.getSavedColors() == 0xFFE5EAED) {
      //change from white to black
      HiveController.saveColors(
        bgcolor: 0xff111111,
        // buttoncolor: 0xff111111,
        // shadowcolor: 0xff151515,
        // specialtextcolor: 0xfffa6901,
        // textcolor: 0xfffa6901,
        // togglebuttoncolor: 0xff141518,
        //toggleIcon: Icons.bedtime,
      );
      bgcolor = 0xff111111;
      toggleicon = Icons.bedtime;
      togglebuttoncolor = 0xff141518;
      buttoncolor = 0xff111111;
      shadowcolor = 0xff151515;
      textcolor = 0xff0affee;
      specialtextcolor = 0xfffa6901;
      //data.write('themecolor', l[0]);

    } else if (HiveController.getSavedColors() == 0xff111111) {
      //change from black to bluegreen
      HiveController.saveColors(
        bgcolor: 0xFF243441,
        // buttoncolor: 0xFF243441,
        // shadowcolor: 0xFF243441,
        // specialtextcolor: 0xfffa6901,
        // textcolor: 0xff0affee,
        // togglebuttoncolor: 0xff243441,
        //toggleIcon: Icons.terrain_rounded,
      );
      bgcolor = 0xFF243441;
      toggleicon = Icons.terrain_rounded;
      togglebuttoncolor = 0xff243441;
      buttoncolor = 0xFF243441;
      shadowcolor = 0xFF243441;
      textcolor = 0xff0affee;
      specialtextcolor = 0xfffa6901;
      //data.write('themecolor', l[1]);
    } else if (HiveController.getSavedColors() == 0xFF243441) {
      //change from bluegreen to white
      HiveController.saveColors(
        bgcolor: 0xFFE5EAED,
        // buttoncolor: 0xFFE5EAED,
        // shadowcolor: 0xFFE5EAED,
        // specialtextcolor: 0xfffa6901,
        // textcolor: 0xff000000,
        // togglebuttoncolor: 0xFFE5EAED,
        //toggleIcon: Icons.wb_sunny_outlined,
      );
      bgcolor = 0xFFE5EAED;
      toggleicon = Icons.wb_sunny_outlined;
      togglebuttoncolor = 0xFFE5EAED;
      buttoncolor = 0xFFE5EAED;
      shadowcolor = 0xFFE5EAED;
      textcolor = 0xFF000000;
      specialtextcolor = 0xFFF05454;
      // data.write('themecolor', l[2]);
    }
    notifyListeners();
  }
}
