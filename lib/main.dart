//import 'package:calc/button.dart';
import 'package:calc/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:provider/provider.dart';

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

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.dark;

  bool get IsDarkMode => themeMode == ThemeMode.dark;

  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class _CalculatorState extends State<Calculator> {
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

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      builder: (context, _) {
        final themeProvider = Provider.of<ThemeProvider>(context);
        return MaterialApp(
          theme: ThemeData.light(),
          // Provide light theme.
          darkTheme: ThemeData.dark(),
          // Provide dark theme.
          themeMode: themeProvider.themeMode,
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            // backgroundColor: Color(0xFFE5EAED),
            appBar: AppBar(
              backgroundColor: Color(0xff424242),
              centerTitle: true,
              title: Text(
                'calculaTHOR',
                style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                    // color: Colors.black45,
                    letterSpacing: .5,
                  ),
                ),
              ),
              actions: [ChangeThemeButtonWidget()],
            ),
            body: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
                                // color: Colors.black45,
                                letterSpacing: .5,
                              ),
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
                            maxLines: 2,
                            overflowReplacement: Text(
                              'Sorry String too long',
                              style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                  // color: Colors.black,
                                  letterSpacing: .5,
                                ),
                              ),
                            ),
                            style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                // color: Colors.black,
                                letterSpacing: .5,
                              ),
                            ),
                            textScaleFactor: 4,
                          ),
                          margin:
                          EdgeInsets.only(left: 30, right: 30, bottom: 20),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Neubutton(
                                symbol: 'AC',
                                color: Color(0xFFF05454),
                                buttononclick: allClear,
                              ),
                              Neubutton(
                                symbol: 'C',
                                color: Color(0xFFF05454),
                                buttononclick: clear,
                              ),
                              Neubutton(
                                symbol: 'del',
                                color: Color(0xFFF05454),
                                buttononclick: del,
                              ),
                              Neubutton(
                                symbol: '/',
                                color: Color(0xFFF05454),
                                buttononclick: numClick,
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
                                color: Colors.black,
                                buttononclick: numClick,
                              ),
                              Neubutton(
                                symbol: '8',
                                color: Colors.black,
                                buttononclick: numClick,
                              ),
                              Neubutton(
                                symbol: '9',
                                color: Colors.black,
                                buttononclick: numClick,
                              ),
                              Neubutton(
                                symbol: '*',
                                color: Color(0xFFF05454),
                                buttononclick: numClick,
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
                                color: Colors.black,
                                buttononclick: numClick,
                              ),
                              Neubutton(
                                symbol: '5',
                                color: Colors.black,
                                buttononclick: numClick,
                              ),
                              Neubutton(
                                symbol: '6',
                                color: Colors.black,
                                buttononclick: numClick,
                              ),
                              Neubutton(
                                symbol: '-',
                                color: Color(0xFFF05454),
                                buttononclick: numClick,
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
                                color: Colors.black,
                                buttononclick: numClick,
                              ),
                              Neubutton(
                                symbol: '2',
                                color: Colors.black,
                                buttononclick: numClick,
                              ),
                              Neubutton(
                                symbol: '3',
                                color: Colors.black,
                                buttononclick: numClick,
                              ),
                              Neubutton(
                                symbol: '+',
                                color: Color(0xFFF05454),
                                buttononclick: numClick,
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
                                color: Colors.black,
                                buttononclick: numClick,
                              ),
                              Neubutton(
                                symbol: '0',
                                color: Colors.black,
                                buttononclick: numClick,
                              ),
                              Neubutton(
                                symbol: '00',
                                color: Color(0xFFF05454),
                                buttononclick: numClick,
                              ),
                              Neubutton(
                                symbol: '=',
                                color: Color(0xFFF05454),
                                buttononclick: evaluate,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
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
