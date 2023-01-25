// ignore_for_file: must_be_immutable, non_constant_identifier_names

import 'package:calc/constants.dart';
import 'package:calc/controller/historycontroller.dart';
import 'package:calc/controller/themecontroller.dart';
import 'package:calc/model/historymodel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HistoryPage extends StatefulWidget {
  int color;
  int evaluated_expression_color;
  int divider_color;
  String fontName;
  HistoryPage({
    Key? key,
    required this.color,
    required this.fontName,
    required this.evaluated_expression_color,
    required this.divider_color,
  }) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  late HistoryController historyController;
  late int historylistlength;
  @override
  void initState() {
    // TODO: implement initState
    historyController = Provider.of<HistoryController>(context, listen: false);
    historyController.getHistoryData();
    historylistlength = historyController.tempHistoryListData.length;
    super.initState();
  }

  @override
  Widget build(BuildContext ctx) {
    double height = MediaQuery.of(context).size.height;

    return SafeArea(
        child: Scaffold(
      backgroundColor: Color(widget.color),
      appBar: AppBar(
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: Text("Delete History"),
                    content: Text("Would you like to clear entire history ?"),
                    actions: <Widget>[
                      FlatButton(
                        onPressed: () {
                          Navigator.of(ctx).pop();
                        },
                        child: Text("NO"),
                      ),
                      FlatButton(
                        onPressed: () {
                          Navigator.of(ctx).pop();
                          historyController.deleteHistory();
                        },
                        child: Text("YES"),
                      ),
                    ],
                  ),
                );
              },
              child: Icon(
                Icons.clear_rounded,
                color: Colors.red,
              ),
            ),
          )
        ],
        iconTheme: IconThemeData(color: Color(widget.divider_color)),
        title: Text(
          'History',
          style: GoogleFonts.montserrat(
            textStyle: TextStyle(
              color: Color(widget.divider_color),

              fontSize: height / 30, // value is 60
            ),
          ),
        ),
        centerTitle: true,
        //elevation: 0.0,
        backgroundColor: Color(widget.color),
      ),
      body: Consumer<HistoryController>(
        builder: (context, hc, child) => (hc.tempHistoryListData.isEmpty)
            ? Center(
                child: Text(
                  'No history to display',
                  style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                      color: Color(widget.evaluated_expression_color)
                          .withOpacity(0.5),

                      fontSize: height / 30, // value is 60
                    ),
                  ),
                ),
              )
            : ListView.builder(
                itemBuilder: (context, index) {
                  int i = historylistlength - index - 1;
                  return Column(children: [
                    //expression
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FittedBox(
                        fit: BoxFit.cover,
                        child: Text(
                          '${(hc.tempHistoryListData)[i].history_value}',
                          style: (widget.fontName != 'Montserrat')
                              ? TextStyle(
                                  fontFamily: 'regular',
                                  color:
                                      Color(widget.evaluated_expression_color)
                                          .withOpacity(0.5),
                                  fontSize: height / 17)
                              : GoogleFonts.montserrat(
                                  textStyle: TextStyle(
                                    color:
                                        Color(widget.evaluated_expression_color)
                                            .withOpacity(0.5),

                                    fontSize: height / 17, // value is 60
                                  ),
                                ),
                        ),
                      ),
                    ),
                    //evaluated expression
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FittedBox(
                        fit: BoxFit.cover,
                        child: Text(
                          '${(hc.tempHistoryListData)[i].expression_value}',
                          style: (widget.fontName != 'Montserrat')
                              ? TextStyle(
                                  fontFamily: 'regular',
                                  color:
                                      Color(widget.evaluated_expression_color),
                                  fontSize: height / 17)
                              : GoogleFonts.montserrat(
                                  textStyle: TextStyle(
                                    color: Color(
                                        widget.evaluated_expression_color),

                                    fontSize: height / 17, // value is 60
                                  ),
                                ),
                        ),
                      ),
                    ),
                    Divider(
                      indent: 15,
                      endIndent: 15,
                      height: 15,
                      color: Color(widget.divider_color),
                    ),
                  ]);
                },
                itemCount: historylistlength),
      ),
    ));
  }
}
