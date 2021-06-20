//import 'package:calc/button.dart';
import 'package:calc/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:auto_size_text/auto_size_text.dart';
//import 'package:shared_preferences/shared_preferences.dart';

main(List<String> args) {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(Calc());
}

class Calc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Calculator();
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  int bgcolor = 0xFFE5EAED;
  IconData toggleicon = Icons.wb_sunny_outlined;
  Color togglebuttoncolor = Color(0xFFE5EAED);
  Color buttoncolor = Color(0xFFE5EAED);
  Color shadowcolor = Color(0xFFE5EAED);
  Color textcolor = Colors.black;
  Color specialtextcolor = Color(0xFFF05454);
  String _history = '';
  String _expression = '';

  void numClick(String text) {
    setState(() {
      if (_expression == 'invalid') {
        clear(text);
      } else {
        _expression += text;
      }
    });
  }

  // getchangedtheme() async {
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   return pref.getInt('bgthemecolor');
  // }

  // Future setchangedtheme(int bgcolor) async {
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   pref.setInt('bgthemecolor', bgcolor);
  // }

  void del(String text) {
    setState(() {
      if (_expression.isEmpty) {
        _expression = 'invalid';
      } else if (_expression == 'invalid') {
        clear(text);
      } else {
        _expression = _expression.substring(0, _expression.length - 1);
      }
    });
  }

  void allClear(String text) {
    setState(() {
      _history = '';
      _expression = '';
    });
  }

  void clear(String text) {
    setState(() {
      _expression = '';
    });
  }

  void toggletheme() {
    setState(() {
      if (bgcolor == 0xFFE5EAED) {
        //bgcolor = Color(0xff393e46);
        bgcolor = 0xff292d36;
        toggleicon = Icons.bedtime;
        //togglebuttoncolor = Color(0xff202020);
        togglebuttoncolor = Color(0xff243441);
        //buttoncolor = Color(0xff393e46);
        buttoncolor = Color(0xff292d36);
        //buttoncolor = Color(0xff243441);
        shadowcolor = Color(0xff202020);
        //shadowcolor = Color(0xff243441);
        textcolor = Color(0xff0affee);
        specialtextcolor = Color(0xfffa6901);
        //setchangedtheme(bgcolor);
      } else if (bgcolor == 0xff292d36) {
        bgcolor = 0xFF243441;
        toggleicon = Icons.terrain_rounded;
        togglebuttoncolor = Color(0xff243441);

        buttoncolor = Color(0xFF243441);
        shadowcolor = Color(0xFF243441);
        textcolor = Color(0xff0affee);
        specialtextcolor = Color(0xfffa6901);
        //setchangedtheme(bgcolor);
      } else {
        bgcolor = 0xFFE5EAED;
        toggleicon = Icons.wb_sunny_outlined;
        togglebuttoncolor = Color(0xFFE5EAED);
        buttoncolor = Color(0xFFE5EAED);
        shadowcolor = Color(0xFFE5EAED);
        textcolor = Colors.black;
        specialtextcolor = Color(0xFFF05454);
        //setchangedtheme(bgcolor);
      }
    });
  }

  void evaluate(String text) {
    Parser p = Parser();
    Expression exp = p.parse(_expression);
    ContextModel cm = ContextModel();

    setState(() {
      if (_expression.isEmpty) {
        _expression = 'invalid';
      } else {
        _history = _expression;
        _expression = exp.evaluate(EvaluationType.REAL, cm).toString();
      }
    });
  }

  // @override
  // void initState() {
  //   super.initState();
  //   checkbgthemecolor();
  // }

  // Future checkbgthemecolor() async {
  //   int c = await getchangedtheme() ?? 0;
  //   setState(() {
  //     bgcolor = c;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return NeumorphicApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(bgcolor),
        body: SafeArea(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: NeumorphicButton(
                    onPressed: () {
                      toggletheme();
                    },
                    style: NeumorphicStyle(
                      color: togglebuttoncolor,
                      shape: NeumorphicShape.concave,
                      boxShape: NeumorphicBoxShape.circle(),
                      lightSource: LightSource.topRight,
                      shadowLightColor: shadowcolor,
                      depth: 0,
                    ),
                    child: NeumorphicIcon(
                      toggleicon,
                      size: 30,
                      style: NeumorphicStyle(color: specialtextcolor, depth: 0),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        //color: Colors.red,
                        child: Text(
                          _history,
                          style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                                color: textcolor.withOpacity(0.5),
                                letterSpacing: .5),
                          ),
                          textAlign: TextAlign.right,
                          textScaleFactor: 2,
                        ),
                        margin: EdgeInsets.only(left: 30, right: 30),
                      ),
                      Container(
                        //color: Colors.blue,
                        child: AutoSizeText(
                          _expression,
                          maxLines: 1,
                          overflowReplacement: Text(
                            'Ala helana cheyaku bro',
                            style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                color: textcolor,
                                letterSpacing: .5,
                              ),
                            ),
                          ),
                          style: GoogleFonts.montserrat(
                            textStyle:
                                TextStyle(color: textcolor, letterSpacing: .5),
                          ),
                          textScaleFactor: 4,
                        ),
                        margin:
                            EdgeInsets.only(left: 30, right: 30, bottom: 20),
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Neubutton(
                            symbol: 'AC',
                            color: specialtextcolor,
                            buttononclick: allClear,
                            buttoncolor: buttoncolor,
                            shadowcolor: shadowcolor,
                          ),
                          Neubutton(
                            symbol: 'C',
                            color: specialtextcolor,
                            buttononclick: clear,
                            buttoncolor: buttoncolor,
                            shadowcolor: shadowcolor,
                          ),
                          Neubutton(
                            symbol: '%',
                            color: specialtextcolor,
                            buttononclick: numClick,
                            buttoncolor: buttoncolor,
                            shadowcolor: shadowcolor,
                          ),
                          Neubutton(
                            symbol: '/',
                            color: specialtextcolor,
                            buttononclick: numClick,
                            buttoncolor: buttoncolor,
                            shadowcolor: shadowcolor,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Neubutton(
                            symbol: '7',
                            color: textcolor,
                            buttononclick: numClick,
                            buttoncolor: buttoncolor,
                            shadowcolor: shadowcolor,
                          ),
                          Neubutton(
                            symbol: '8',
                            color: textcolor,
                            buttononclick: numClick,
                            buttoncolor: buttoncolor,
                            shadowcolor: shadowcolor,
                          ),
                          Neubutton(
                            symbol: '9',
                            color: textcolor,
                            buttononclick: numClick,
                            buttoncolor: buttoncolor,
                            shadowcolor: shadowcolor,
                          ),
                          Neubutton(
                            symbol: '*',
                            color: specialtextcolor,
                            buttononclick: numClick,
                            buttoncolor: buttoncolor,
                            shadowcolor: shadowcolor,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Neubutton(
                            symbol: '4',
                            color: textcolor,
                            buttononclick: numClick,
                            buttoncolor: buttoncolor,
                            shadowcolor: shadowcolor,
                          ),
                          Neubutton(
                            symbol: '5',
                            color: textcolor,
                            buttononclick: numClick,
                            buttoncolor: buttoncolor,
                            shadowcolor: shadowcolor,
                          ),
                          Neubutton(
                            symbol: '6',
                            color: textcolor,
                            buttononclick: numClick,
                            buttoncolor: buttoncolor,
                            shadowcolor: shadowcolor,
                          ),
                          Neubutton(
                            symbol: '-',
                            color: specialtextcolor,
                            buttononclick: numClick,
                            buttoncolor: buttoncolor,
                            shadowcolor: shadowcolor,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Neubutton(
                            symbol: '1',
                            color: textcolor,
                            buttononclick: numClick,
                            buttoncolor: buttoncolor,
                            shadowcolor: shadowcolor,
                          ),
                          Neubutton(
                            symbol: '2',
                            color: textcolor,
                            buttononclick: numClick,
                            buttoncolor: buttoncolor,
                            shadowcolor: shadowcolor,
                          ),
                          Neubutton(
                            symbol: '3',
                            color: textcolor,
                            buttononclick: numClick,
                            buttoncolor: buttoncolor,
                            shadowcolor: shadowcolor,
                          ),
                          Neubutton(
                            symbol: '+',
                            color: specialtextcolor,
                            buttononclick: numClick,
                            buttoncolor: buttoncolor,
                            shadowcolor: shadowcolor,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Neubutton(
                            symbol: '.',
                            color: textcolor,
                            buttononclick: numClick,
                            buttoncolor: buttoncolor,
                            shadowcolor: shadowcolor,
                          ),
                          Neubutton(
                            symbol: '0',
                            color: textcolor,
                            buttononclick: numClick,
                            buttoncolor: buttoncolor,
                            shadowcolor: shadowcolor,
                          ),
                          Neubutton(
                            symbol: '<',
                            color: specialtextcolor,
                            buttononclick: del,
                            buttoncolor: buttoncolor,
                            shadowcolor: shadowcolor,
                          ),
                          Neubutton(
                            symbol: '=',
                            color: specialtextcolor,
                            buttononclick: evaluate,
                            buttoncolor: buttoncolor,
                            shadowcolor: shadowcolor,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ]),
        ),
      ),
    );
  }
}

// NeumorphicButton(
//               child: Container(
//                 width: 200,
//                 height: 200,
//                 child: Text('2sdas'),
//               ),
//               style: NeumorphicStyle(
//                   shape: NeumorphicShape.concave,
//                   boxShape: NeumorphicBoxShape.circle(),
//                   depth: 30,
//                   lightSource: LightSource.topLeft,
//                   color: Colors.blueGrey),
//             ),
