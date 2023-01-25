// ignore_for_file: must_be_immutable

import 'package:calc/controller/controller.dart';
import 'package:calc/controller/themecontroller.dart';
import 'package:flutter/material.dart';

import '../model/button.dart';

class ButtonGrid extends StatelessWidget {
  BuildContext context;
  double height;
  double width;
  ThemeController tc;
  CalculaterController calculaterController;

  ButtonGrid(
      {Key? key,
      required this.context,
      required this.height,
      required this.tc,
      required this.calculaterController,
      required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: EdgeInsets.all(height / 200),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Neubutton(
                symbol: 'AC',
                color: Color(tc.specialtextcolor),
                fontsize: MediaQuery.of(context).size.width * 0.045,
                buttononclick: calculaterController.allClear,
                buttoncolor: Color(tc.buttoncolor),
                shadowcolor: Color(tc.shadowcolor),
                isNum: false,
                ctx: context,
              ),
              Neubutton(
                symbol: 'C',
                fontsize: MediaQuery.of(context).size.width * 0.045,
                color: Color(tc.specialtextcolor),
                buttononclick: calculaterController.clear,
                buttoncolor: Color(tc.buttoncolor),
                shadowcolor: Color(tc.shadowcolor),
                ctx: context,
                isNum: false,
              ),
              Neubutton(
                symbol: 'mod',
                fontsize: MediaQuery.of(context).size.width * 0.045,
                color: Color(tc.specialtextcolor),
                buttononclick: calculaterController.numClick,
                buttoncolor: Color(tc.buttoncolor),
                shadowcolor: Color(tc.shadowcolor),
                isNum: false,
                ctx: context,
              ),
              Neubutton(
                symbol: '/',
                fontsize: MediaQuery.of(context).size.width * 0.045,
                color: Color(tc.specialtextcolor),
                buttononclick: calculaterController.numClick,
                buttoncolor: Color(tc.buttoncolor),
                shadowcolor: Color(tc.shadowcolor),
                isNum: false,
                ctx: context,
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
                fontsize: MediaQuery.of(context).size.width * 0.045,
                color: Color(tc.textcolor),
                buttononclick: calculaterController.numClick,
                buttoncolor: Color(tc.buttoncolor),
                shadowcolor: Color(tc.shadowcolor),
                isNum: true,
                ctx: context,
              ),
              Neubutton(
                symbol: '8',
                fontsize: MediaQuery.of(context).size.width * 0.045,
                color: Color(tc.textcolor),
                buttononclick: calculaterController.numClick,
                buttoncolor: Color(tc.buttoncolor),
                shadowcolor: Color(tc.shadowcolor),
                isNum: true,
                ctx: context,
              ),
              Neubutton(
                symbol: '9',
                fontsize: MediaQuery.of(context).size.width * 0.045,
                color: Color(tc.textcolor),
                buttononclick: calculaterController.numClick,
                buttoncolor: Color(tc.buttoncolor),
                isNum: true,
                shadowcolor: Color(tc.shadowcolor),
                ctx: context,
              ),
              Neubutton(
                symbol: 'x',
                fontsize: MediaQuery.of(context).size.width * 0.045,
                color: Color(tc.specialtextcolor),
                buttononclick: calculaterController.numClick,
                buttoncolor: Color(tc.buttoncolor),
                shadowcolor: Color(tc.shadowcolor),
                ctx: context,
                isNum: false,
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
                fontsize: MediaQuery.of(context).size.width * 0.045,
                color: Color(tc.textcolor),
                buttononclick: calculaterController.numClick,
                buttoncolor: Color(tc.buttoncolor),
                shadowcolor: Color(tc.shadowcolor),
                ctx: context,
                isNum: true,
              ),
              Neubutton(
                symbol: '5',
                fontsize: MediaQuery.of(context).size.width * 0.045,
                color: Color(tc.textcolor),
                buttononclick: calculaterController.numClick,
                buttoncolor: Color(tc.buttoncolor),
                shadowcolor: Color(tc.shadowcolor),
                ctx: context,
                isNum: true,
              ),
              Neubutton(
                symbol: '6',
                fontsize: MediaQuery.of(context).size.width * 0.045,
                color: Color(tc.textcolor),
                buttononclick: calculaterController.numClick,
                buttoncolor: Color(tc.buttoncolor),
                shadowcolor: Color(tc.shadowcolor),
                ctx: context,
                isNum: true,
              ),
              Neubutton(
                symbol: '_',
                fontsize: MediaQuery.of(context).size.width * 0.08,
                color: Color(tc.specialtextcolor),
                buttononclick: calculaterController.numClick,
                buttoncolor: Color(tc.buttoncolor),
                shadowcolor: Color(tc.shadowcolor),
                ctx: context,
                isNum: false,
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
                fontsize: MediaQuery.of(context).size.width * 0.045,
                color: Color(tc.textcolor),
                buttononclick: calculaterController.numClick,
                buttoncolor: Color(tc.buttoncolor),
                shadowcolor: Color(tc.shadowcolor),
                ctx: context,
                isNum: true,
              ),
              Neubutton(
                symbol: '2',
                fontsize: MediaQuery.of(context).size.width * 0.045,
                color: Color(tc.textcolor),
                buttononclick: calculaterController.numClick,
                buttoncolor: Color(tc.buttoncolor),
                shadowcolor: Color(tc.shadowcolor),
                ctx: context,
                isNum: true,
              ),
              Neubutton(
                symbol: '3',
                fontsize: MediaQuery.of(context).size.width * 0.045,
                color: Color(tc.textcolor),
                buttononclick: calculaterController.numClick,
                buttoncolor: Color(tc.buttoncolor),
                shadowcolor: Color(tc.shadowcolor),
                ctx: context,
                isNum: true,
              ),
              Neubutton(
                symbol: '+',
                fontsize: MediaQuery.of(context).size.width * 0.07,
                color: Color(tc.specialtextcolor),
                buttononclick: calculaterController.numClick,
                buttoncolor: Color(tc.buttoncolor),
                shadowcolor: Color(tc.shadowcolor),
                ctx: context,
                isNum: false,
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
                fontsize: MediaQuery.of(context).size.width * 0.045,
                color: Color(tc.textcolor),
                buttononclick: calculaterController.numClick,
                buttoncolor: Color(tc.buttoncolor),
                shadowcolor: Color(tc.shadowcolor),
                ctx: context,
                isNum: false,
              ),
              Neubutton(
                symbol: '0',
                fontsize: MediaQuery.of(context).size.width * 0.045,
                color: Color(tc.textcolor),
                buttononclick: calculaterController.numClick,
                buttoncolor: Color(tc.buttoncolor),
                shadowcolor: Color(tc.shadowcolor),
                ctx: context,
                isNum: true,
              ),
              Neubutton(
                symbol: 'del',
                fontsize: MediaQuery.of(context).size.width * 0.045,
                color: Color(tc.specialtextcolor),
                buttononclick: calculaterController.del,
                buttoncolor: Color(tc.buttoncolor),
                ctx: context,
                shadowcolor: Color(tc.shadowcolor),
                isNum: false,
              ),
              Neubutton(
                symbol: '=',
                fontsize: MediaQuery.of(context).size.width * 0.07,
                color: Color(tc.specialtextcolor),
                buttononclick: calculaterController.evaluate,
                buttoncolor: Color(tc.buttoncolor),
                shadowcolor: Color(tc.shadowcolor),
                ctx: context,
                isNum: false,
              ),
            ],
          ),
        ),
        SizedBox(
          height: height / 81.6,
        ),
      ],
    );
  }
}
