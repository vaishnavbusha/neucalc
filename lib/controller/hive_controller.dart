import 'package:calc/constants.dart';
import 'package:calc/model/historymodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class HiveController {
  static var box = Hive.box(hiveDataVariable);
  static saveFont({required String fontName}) {
    box.put('fontname', fontName);
  }

  static saveHistoryListHIVE(List listData) {
    box.put('historyList', listData);
  }

  static getHistoryListHIVE() {
    return box.get('historyList', defaultValue: []);
  }

  static saveColors({
    required int bgcolor,
    // required int togglebuttoncolor,
    // required int buttoncolor,
    // required int shadowcolor,
    // required int textcolor,
    // required int specialtextcolor,
    // required IconData toggleIcon,
  }) {
    box.put('bgcolor', bgcolor);
    // box.put('togglebuttoncolor', togglebuttoncolor);
    // box.put('buttoncolor', buttoncolor);
    // box.put('shadowcolor', shadowcolor);
    // box.put('textcolor', textcolor);
    // box.put('specialtextcolor', specialtextcolor);
    // box.put('toggleIcon', toggleIcon);
  }

  static getSavedFont() {
    box.put('fontname', box.get('fontname', defaultValue: 'Montserrat'));
  }

  static getSavedColors() {
    box.put('bgcolor', box.get('bgcolor', defaultValue: bgcolor));
    // box.put('togglebuttoncolor',
    //     box.get('togglebuttoncolor', defaultValue: togglebuttoncolor));
    // box.put('buttoncolor', box.get('buttoncolor', defaultValue: buttoncolor));
    // box.put('shadowcolor', box.get('shadowcolor', defaultValue: shadowcolor));
    // box.put('textcolor', box.get('textcolor', defaultValue: textcolor));
    // box.put('specialtextcolor',
    //     box.get('specialtextcolor', defaultValue: specialtextcolor));
    // box.put('toggleIcon',
    //     box.get('toggleIcon', defaultValue: Icons.wb_sunny_outlined));
  }
}
