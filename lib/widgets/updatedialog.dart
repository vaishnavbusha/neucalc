// ignore_for_file: deprecated_member_use, non_constant_identifier_names, must_be_immutable

import 'package:flutter/material.dart';

class UpdateDialog extends StatefulWidget {
  int color;
  int divider_color;
  int evaluated_expression_color;
  String description;
  String localVersion;
  String storeVersion;
  String applink;
  UpdateDialog({
    Key? key,
    required this.color,
    required this.divider_color,
    required this.applink,
    required this.description,
    required this.localVersion,
    required this.storeVersion,
    required this.evaluated_expression_color,
  }) : super(key: key);

  @override
  State<UpdateDialog> createState() => _UpdateDialogState();
}

class _UpdateDialogState extends State<UpdateDialog> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(
        milliseconds: 500,
      ),
      curve: Curves.fastLinearToSlowEaseIn,
      child: AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
        backgroundColor: Color(widget.color),
        title: Text(
          "Update Available !",
          style: TextStyle(
              fontFamily: 'gilroy_regular',
              fontWeight: FontWeight.bold,
              color: Color(widget.divider_color)),
        ),
        content: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Please update your app from ',
                style: TextStyle(
                    fontFamily: 'gilroy_regular',
                    color: Color(widget.evaluated_expression_color)
                        .withOpacity(0.7)),
              ),
              TextSpan(
                text: '${widget.localVersion} ',
                style: TextStyle(
                    fontFamily: 'gilroy_regular',
                    fontWeight: FontWeight.bold,
                    color: Color(widget.evaluated_expression_color)),
              ),
              TextSpan(
                text: 'to ',
                style: TextStyle(
                    fontFamily: 'gilroy_regular',
                    color: Color(widget.evaluated_expression_color)
                        .withOpacity(0.7)),
              ),
              TextSpan(
                text: '${widget.storeVersion} ',
                style: TextStyle(
                    fontFamily: 'gilroy_regular',
                    fontWeight: FontWeight.bold,
                    color: Color(widget.evaluated_expression_color)),
              ),
              TextSpan(
                text: 'to get new features.',
                style: TextStyle(
                    fontFamily: 'gilroy_regular',
                    color: Color(widget.evaluated_expression_color)
                        .withOpacity(0.7)),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              Navigator.of(context).pop();
              //SystemNavigator.pop();
            },
            child: Text(
              "LATER",
              style: TextStyle(
                  fontFamily: 'gilroy_regular',
                  fontWeight: FontWeight.bold,
                  color: Color(widget.divider_color)),
            ),
          ),
          FlatButton(
            minWidth: 70,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            color: Color(widget.divider_color),
            onPressed: () async {
              // StoreRedirect.redirect(
              //   androidAppId: "com.snapchat.android",
              // );
              //await launchUrl(Uri.parse(widget.applink));
              Navigator.of(context).pop();
            },
            child: Text(
              "UPDATE",
              style: TextStyle(
                  fontFamily: 'gilroy_regular',
                  fontWeight: FontWeight.bold,
                  color: Color(widget.color)),
            ),
          ),
        ],
      ),
    );
  }
}
