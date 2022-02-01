import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';

class Neubutton extends StatelessWidget {
  final String symbol;
  final Color color;
  final Function buttononclick;
  final Color buttoncolor;
  final Color shadowcolor;
  Neubutton(
      {required this.symbol,
      required this.color,
      required this.buttononclick,
      required this.buttoncolor,
      required this.shadowcolor});

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
        //shadowDarkColor: Color(0xFFE5EAED),
        shadowLightColor: shadowcolor,
        depth: 9,
      ),
      child: Container(
        child: Center(
            child: Text(
          symbol,
          style: GoogleFonts.montserrat(
              textStyle: TextStyle(color: color),
              fontSize: MediaQuery.of(context).size.width / 21.6),
        )),
        width: MediaQuery.of(context).size.width / 8, // width is 50
        height: MediaQuery.of(context).size.width / 8, // width is 50
      ),
    );
  }
}
