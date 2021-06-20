import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';
// class Neubutton extends StatefulWidget {
//   final String symbol;
//   final Color color;
//   final Function buttononclick;
//   final Color buttoncolor;
//   Neubutton(
//       {required this.symbol,
//       required this.color,
//       required this.buttononclick,
//       required this.buttoncolor});
//   @override
//   _NeubuttonState createState() => _NeubuttonState();
// }

// class _NeubuttonState extends State<Neubutton> {
//   @override
//   Widget build(BuildContext context) {
//     return NeumorphicButton(
//       duration: Duration(milliseconds: 10),
//       provideHapticFeedback: false,
//       onPressed: () {
//         widget.buttononclick(widget.symbol);
//       },
//       style: NeumorphicStyle(
//         shape: NeumorphicShape.concave,
//         color: widget.buttoncolor,
//         boxShape: NeumorphicBoxShape.circle(),
//         lightSource: LightSource.topRight,
//         //shadowLightColor: Colors.black45,
//         //shadowDarkColor: Colors.black45,
//         depth: 9,
//       ),
//       child: Container(
//         child: Center(
//             child: Text(
//           widget.symbol,
//           textScaleFactor: 2,
//           style:
//               GoogleFonts.montserrat(textStyle: TextStyle(color: widget.color)),
//         )),
//         width: 50,
//         height: 50,
//       ),
//     );
//   }
// }

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
        buttononclick(symbol);
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
          textScaleFactor: 2,
          style: GoogleFonts.montserrat(textStyle: TextStyle(color: color)),
        )),
        width: 50,
        height: 50,
      ),
    );
  }
}
