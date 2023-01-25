import 'package:calc/constants.dart';
import 'package:calc/controller/historycontroller.dart';
import 'package:calc/controller/hive_controller.dart';
import 'package:calc/controller/themecontroller.dart';
import 'package:calc/view/buttonsgrid.dart';
import 'package:calc/view/history.dart';
import 'package:flutter/services.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:new_version/new_version.dart';
import '../controller/controller.dart';
import '../model/button.dart';
import '../controller/themecontroller.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  @override
  void initState() {
    HiveController.getSavedColors();
    HiveController.getSavedFont();
    HiveController.getHistoryListHIVE();

    // themecontroller.bgcolor.value =
    //     themecontroller.data.read('themecolor') ?? 0xFFE5EAED;
    // themecontroller.toggletheme();

    checkversion();
    super.initState();
  }

  void checkversion() async {
    final newversion = NewVersion(androidId: "com.aquelastudios.calculater");
    final status = await newversion.getVersionStatus();
    if (status!.storeVersion != status.localVersion) {
      newversion.showUpdateDialog(
          context: context,
          versionStatus: status,
          dialogTitle: "Update Available!",
          dismissButtonText: "Exit",
          dismissAction: () => SystemNavigator.pop(),
          updateButtonText: "Update",
          dialogText: "Please update the app from " +
              "${status.localVersion}" +
              " to " +
              "${status.storeVersion}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => CalculaterController(),
          ),
          ChangeNotifierProvider(
            create: (context) => ThemeController(),
          ),
        ],
        builder: (context, __) {
          return Calculators();
        });
  }
}

class Calculators extends StatefulWidget {
  @override
  State<Calculators> createState() => _CalculatorsState();
}

class _CalculatorsState extends State<Calculators> {
  late CalculaterController calculaterController;
  late ThemeController themeController;
  late String font;
  @override
  void initState() {
    font = 'Montserrat';
    // TODO: implement initState
    super.initState();

    themeController = Provider.of<ThemeController>(context, listen: false);
    calculaterController =
        Provider.of<CalculaterController>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Consumer<ThemeController>(builder: (context, tc, __) {
      return Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Color(tc.bgcolor),
        //   elevation: 0,
        //   centerTitle: true,
        //   actions: [
        //     Padding(
        //       padding: EdgeInsets.only(right: 10),
        //       child: PopupMenuButton(
        //         color: Color(tc.bgcolor),
        //         itemBuilder: (context) => [
        //           PopupMenuItem(
        //             child: Row(
        //               mainAxisAlignment: MainAxisAlignment.center,
        //               children: [
        //                 Icon(
        //                   Icons.history,
        //                   color: Color(tc.textcolor),
        //                 ),
        //                 SizedBox(width: 5),
        //                 Text(
        //                   'history',
        //                   style: GoogleFonts.montserrat(
        //                     textStyle: TextStyle(
        //                         color: Color(tc.textcolor).withOpacity(0.5),
        //                         fontSize: 20),
        //                   ),
        //                 ),
        //               ],
        //             ),
        //           ),
        //           PopupMenuItem(
        //             child: Row(
        //               mainAxisAlignment: MainAxisAlignment.center,
        //               children: [
        //                 Icon(
        //                   Icons.history,
        //                   color: Color(tc.textcolor),
        //                 ),
        //                 SizedBox(width: 5),
        //                 Text(
        //                   'history',
        //                   style: GoogleFonts.montserrat(
        //                     textStyle: TextStyle(
        //                         color: Color(tc.textcolor).withOpacity(0.5),
        //                         fontSize: 20),
        //                   ),
        //                 ),
        //               ],
        //             ),
        //           ),
        //         ],
        //         child: Icon(
        //           Icons.menu_rounded,
        //           size: 25,
        //           color: Color(tc.textcolor),
        //         ),
        //       ),
        //     )
        //   ],
        //   title: Container(
        //     //color: Colors.red,
        //     child: NeumorphicButton(
        //       onPressed: () => themeController.toggletheme(),
        //       style: NeumorphicStyle(
        //         color: Color(tc.togglebuttoncolor),
        //         shape: NeumorphicShape.concave,
        //         boxShape: NeumorphicBoxShape.circle(),
        //         lightSource: LightSource.topRight,
        //         shadowLightColor: Color(tc.shadowcolor),
        //         depth: 0,
        //       ),
        //       child: NeumorphicIcon(
        //         toggleicon,
        //         size: width / 16,
        //         style: NeumorphicStyle(
        //             color: Color(tc.specialtextcolor), depth: 0),
        //       ),
        //     ),
        //   ),
        // ),
        backgroundColor: Color(tc.bgcolor),
        body: SafeArea(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: height / 80,
                    left: width * 0.45,
                    right: width * 0.45,
                  ),
                  child: Container(
                    //color: Colors.red,
                    child: NeumorphicButton(
                      onPressed: () => themeController.toggletheme(),
                      style: NeumorphicStyle(
                        color: Color(tc.togglebuttoncolor),
                        shape: NeumorphicShape.concave,
                        boxShape: NeumorphicBoxShape.circle(),
                        lightSource: LightSource.topRight,
                        shadowLightColor: Color(tc.shadowcolor),
                        depth: 0,
                      ),
                      child: NeumorphicIcon(
                        toggleicon,
                        size: width / 16,
                        style: NeumorphicStyle(
                            color: Color(tc.specialtextcolor), depth: 0),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 5),
                GestureDetector(
                  onTap: () {
                    showBottomSheetContainer(tc, context);
                  },
                  child: Icon(
                    Icons.menu_rounded,
                    size: 25,
                    color: Color(tc.textcolor),
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
                          child: Consumer<ThemeController>(
                              builder: (context, tc, __) {
                            return Consumer<CalculaterController>(
                                builder: (context, cc, __) {
                              TextStyle textConstraints() {
                                if (cc.history == 'Infinity' ||
                                    cc.history == 'Invalid') {
                                  return GoogleFonts.montserrat(
                                    textStyle: TextStyle(
                                        color: Color(tc.textcolor)
                                            .withOpacity(0.5),
                                        fontSize: height / 28),
                                  );
                                } else {
                                  return (tc.font != 'Montserrat')
                                      ? TextStyle(
                                          fontFamily: 'regular',
                                          color: Color(tc.textcolor)
                                              .withOpacity(0.5),
                                          fontSize: height / 30,
                                        )
                                      : GoogleFonts.montserrat(
                                          textStyle: TextStyle(
                                              color: Color(tc.textcolor)
                                                  .withOpacity(0.5),
                                              fontSize: height / 28),
                                        );
                                }
                              }

                              return Text(
                                cc.history,
                                textAlign: TextAlign.right,
                                // style: TextStyle(
                                //     fontFamily: 'regular',
                                //     color: Color(textcolor),
                                //     letterSpacing: .5,
                                //     fontSize: height / 24),
                                style: textConstraints(),
                              );
                            });
                          }),
                        ),
                        margin: EdgeInsets.only(
                          left: width / 14.4, // value is 30
                          right: width / 14.4, // value is 30
                        ),
                      ),
                      Consumer<CalculaterController>(
                          builder: (context, cc, __) {
                        TextStyle textConstraints() {
                          if (cc.expression == 'Invalid' ||
                              cc.expression == 'Infinity') {
                            return GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                color: Color(tc.textcolor),
                                fontSize: height / 17, // value is 60
                              ),
                            );
                          } else {
                            return (tc.font != 'Montserrat')
                                ? TextStyle(
                                    fontFamily: 'regular',
                                    color: Color(tc.textcolor),
                                    fontSize: height / 17)
                                : GoogleFonts.montserrat(
                                    textStyle: TextStyle(
                                      color: Color(tc.textcolor),

                                      fontSize: height / 17, // value is 60
                                    ),
                                  );
                          }
                        }

                        cc.getCursorCurrPos();
                        return Padding(
                          padding: EdgeInsets.only(right: 25, left: 30),
                          child: TextField(
                            textAlign: TextAlign.end,
                            showCursor: true,
                            readOnly: true,
                            controller: cc.textFieldController,
                            style: textConstraints(),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              fillColor: Colors.red,
                            ),
                          ),
                        );
                      }),
                      Container(
                        child: Container(
                          height: 55,
                          child: SingleChildScrollView(
                            padding: EdgeInsets.only(
                              top: 5,
                            ), // value is 3,
                            reverse: true,
                            scrollDirection: Axis.horizontal,
                            child: Center(
                              child: Consumer<ThemeController>(
                                  builder: (context, tc, __) {
                                return Consumer<CalculaterController>(
                                  builder: (context, cc, child) {
                                    TextStyle textConstraints() {
                                      if (cc.expression == 'Invalid' ||
                                          cc.expression == 'Infinity') {
                                        return GoogleFonts.montserrat(
                                          textStyle: TextStyle(
                                            color: Color(tc.textcolor),
                                            fontSize:
                                                height / 17, // value is 60
                                          ),
                                        );
                                      } else {
                                        return (tc.font != 'Montserrat')
                                            ? TextStyle(
                                                fontFamily: 'regular',
                                                color: Color(tc.textcolor),
                                                fontSize: height / 17)
                                            : GoogleFonts.montserrat(
                                                textStyle: TextStyle(
                                                  color: Color(tc.textcolor),

                                                  fontSize: height /
                                                      17, // value is 60
                                                ),
                                              );
                                      }
                                    }

                                    return Text(cc.expression,
                                        textAlign: TextAlign.center,
                                        style: textConstraints());
                                  },
                                );
                              }),
                            ),
                          ),
                        ),
                        margin: EdgeInsets.only(
                          left: width / 14.4,
                          right: width / 14.4,
                          //bottom: width / 21.6,
                        ), // value is 30,30,20
                      ),
                    ],
                  ),
                ),
                ///// button codes
                ButtonGrid(
                    calculaterController: calculaterController,
                    context: context,
                    height: height,
                    tc: tc,
                    width: width),
              ]),
        ),
      );
    });
  }

  void showBottomSheetContainer(ThemeController tc, BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        backgroundColor: Color(tc.bgcolor),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        builder: (context) {
          return ListenableProvider.value(
            value: themeController,
            child: Container(
              height: 160,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.push(
                            ctx,
                            MaterialPageRoute(
                              builder: (ctx) => ChangeNotifierProvider(
                                  create: (context) => HistoryController(),
                                  builder: (context, _) {
                                    return HistoryPage(
                                      color: tc.bgcolor,
                                      fontName: tc.font,
                                      evaluated_expression_color: tc.textcolor,
                                      divider_color: tc.specialtextcolor,
                                    );
                                  }),
                            ),
                          );
                        },
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.history,
                                color: Color(tc.textcolor).withOpacity(0.8),
                              ),
                              SizedBox(width: 10),
                              Text(
                                'Show History',
                                style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(
                                      color: Color(tc.textcolor), fontSize: 20),
                                ),
                              ),
                            ]),
                      ),
                    ),
                    Divider(
                      height: 4,
                      indent: 20,
                      endIndent: 20,
                      color: Color(tc.specialtextcolor),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            'Change Button\'s Font',
                            style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                  color: Color(tc.textcolor), fontSize: 20),
                            ),
                          ),
                          SizedBox(height: 10),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Consumer<ThemeController>(
                                    builder: (context, tc, __) {
                                  return GestureDetector(
                                    onTap: () {
                                      tc.changeFont('Montserrat');
                                    },
                                    child: Container(
                                      padding: (tc.font == 'Montserrat')
                                          ? EdgeInsets.all(10)
                                          : EdgeInsets.all(8),
                                      decoration: (tc.font == 'Montserrat')
                                          ? BoxDecoration(
                                              color: Color(tc.specialtextcolor),
                                              borderRadius:
                                                  BorderRadius.circular(10))
                                          : BoxDecoration(
                                              border: Border.all(
                                                  width: 2,
                                                  color: Color(
                                                      tc.specialtextcolor)),
                                              //color: Color(tc.specialtextcolor),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                      child: Row(
                                        children: [
                                          Text('Montserrat',
                                              style: GoogleFonts.montserrat(
                                                textStyle: TextStyle(
                                                    color: Color(tc.textcolor),
                                                    fontSize: 20),
                                              )),
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                                SizedBox(width: 10),
                                Consumer<ThemeController>(
                                    builder: (context, tc, __) {
                                  return GestureDetector(
                                    onTap: () {
                                      tc.changeFont('Infamous');
                                    },
                                    child: Container(
                                      padding: (tc.font == 'Infamous')
                                          ? EdgeInsets.all(10)
                                          : EdgeInsets.all(8),
                                      decoration: (tc.font == 'Infamous')
                                          ? BoxDecoration(
                                              color: Color(tc.specialtextcolor),
                                              borderRadius:
                                                  BorderRadius.circular(10))
                                          : BoxDecoration(
                                              border: Border.all(
                                                  width: 2,
                                                  color: Color(
                                                      tc.specialtextcolor)),
                                              //color: Color(tc.specialtextcolor),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                      child: Row(
                                        children: [
                                          Text('Infamous',
                                              style: GoogleFonts.montserrat(
                                                textStyle: TextStyle(
                                                    color: Color(tc.textcolor),
                                                    fontSize: 20),
                                              )),
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                              ]),
                        ],
                      ),
                    ),
                  ]),
            ),
          );
        });
  }
}
