// ignore_for_file: must_be_immutable

import 'package:calc/controller/themecontroller.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class Neubutton extends StatelessWidget {
  BuildContext ctx;
  final String symbol;
  final Color color;
  final Function buttononclick;
  final Color buttoncolor;
  final Color shadowcolor;
  final double fontsize;
  final bool isNum;
  Neubutton(
      {required this.ctx,
      required this.symbol,
      required this.color,
      required this.fontsize,
      required this.buttononclick,
      required this.buttoncolor,
      required this.shadowcolor,
      required this.isNum});

  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
      duration: Duration(milliseconds: 10),
      onPressed: () {
        HapticFeedback.lightImpact();
        buttononclick(symbol); // added '!' on suggestion of flutter
      },
      style: NeumorphicStyle(
        shape: NeumorphicShape.concave,
        color: buttoncolor,
        boxShape: NeumorphicBoxShape.circle(),
        lightSource: LightSource.topRight,
        shadowLightColor: shadowcolor,
        depth: 6,
      ),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.120, // width is 50
        height: MediaQuery.of(context).size.width * 0.120,
        child: Center(
          child: Consumer<ThemeController>(builder: (context, tc, __) {
            return Text(
              symbol,
              style: (tc.font != 'Montserrat')
                  ? TextStyle(
                      fontFamily: 'regular', color: color, fontSize: fontsize)
                  : GoogleFonts.montserrat(
                      textStyle: TextStyle(
                        color: color,
                        fontWeight:
                            (isNum) ? FontWeight.normal : FontWeight.bold,
                        letterSpacing: .5,
                        fontSize: fontsize,
                      ),
                    ),
              // style: GoogleFonts.montserrat(
              //     textStyle: TextStyle(color: color),
              //     fontSize: MediaQuery.of(context).size.width * 0.045),
            );
          }),
        ), // width is 50
      ),
    );
  }
}
