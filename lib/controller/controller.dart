// ignore_for_file: unnecessary_null_comparison

import 'package:calc/constants.dart';
import 'package:calc/controller/historycontroller.dart';
import 'package:calc/controller/hive_controller.dart';
import 'package:calc/model/historymodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculaterController extends ChangeNotifier {
  // var expression = ''.obs;
  // var history = ''.obs;
  var expression = '';
  var history = '';
  var cursorCurrPos;
  int cursorAferDelete = 0;
  final textFieldController = TextEditingController();
  void numClick(String text) {
    if (expression == 'Invalid') {
      expression = '';
    } else if (text == 'mod') {
      expression += '%';
    } else if (text == 'x') {
      expression += '*';
    } else if (text == '_') {
      expression += '-';
    } else {
      expression += text;
    }
    textFieldController.addListener(() {
      getCursorCurrPos();
    });
    textFieldController.text = expression;
    textFieldController.selection =
        TextSelection.collapsed(offset: textFieldController.text.length);
    notifyListeners();
  }

  int getCursorCurrPos() {
    cursorCurrPos = textFieldController.selection.base.offset;
    print(cursorCurrPos);
    return cursorCurrPos;
  }

  void del(String text) {
    try {
      if (expression.isEmpty)
        expression = 'Invalid';
      else if (expression == 'Invalid')
        expression = '';
      else {
        expression = (expression).substring(0, getCursorCurrPos() - 1) +
            (expression).substring(getCursorCurrPos(), (expression).length);
        cursorAferDelete = getCursorCurrPos();
        print('cursorafterdel ' + cursorAferDelete.toString());
      }

      //expression = (expression).substring(0, (expression).length - 1);
      textFieldController.text = expression;
    }
    //getCursorCurrPos();
    catch (e) {
      print(e);
    }
    textFieldController.selection =
        TextSelection.collapsed(offset: cursorAferDelete - 1);

    notifyListeners();
  }

  void allClear(String text) {
    history = '';
    expression = '';
    textFieldController.text = expression;
    notifyListeners();
  }

  void clear(String text) {
    expression = '';
    textFieldController.text = expression;
    notifyListeners();
  }

  void evaluate(String text) {
    String temp;
    if (expression.isEmpty) {
      expression = 'Invalid';
    }
    if (expression == 'Invalid' ||
        expression.isEmpty ||
        ((expression).length == 1) &&
            ((expression[0] == '/') ||
                (expression[0] == '+') ||
                (expression[0] == '-') ||
                (expression[0] == '*') ||
                (expression[0] == '%'))) {
      expression = 'Invalid';
    }
    try {
      Parser p = Parser();
      Expression exp = p.parse(expression);
      ContextModel cm = ContextModel();

      if ((expression).isEmpty || expression == 'Invalid') {
        expression = 'Invalid';
      } else {
        history = expression;
        temp = exp.evaluate(EvaluationType.REAL, cm).toString();

        if (temp[temp.length - 1] == '0') {
          expression = temp.substring(0, temp.length - 2);
        } else {
          if (checkdouble(temp)) {
            expression = removeTrailingZerosAndNumberfy(
                (double.tryParse(temp))!.toStringAsFixed(4));
          } else {
            expression = temp;
          }
        }
      }
      textFieldController.text = expression;
      textFieldController.selection =
          TextSelection.collapsed(offset: textFieldController.text.length);
      if (textFieldController.text == 'Invalid' ||
          textFieldController.text == 'Infinity') {
        print('error values cannot be stored in history');
      } else {
        historyData.add(
            HistoryModel(expression_value: expression, history_value: history));
        HiveController.saveHistoryListHIVE(historyData);
        print(HiveController.getHistoryListHIVE());
      }
    } catch (e) {
      expression = 'Invalid';
    }
    print(expression);
    notifyListeners();
  }

  bool checkdouble(String s) {
    if (s == null) {
      notifyListeners();
      return false;
    }
    notifyListeners();
    return double.tryParse(s) != null;
  }

  removeTrailingZerosAndNumberfy(String n) {
    RegExp regex = RegExp(r'([.]*0)(?!.*\d)');

    String s = double.tryParse(n).toString().replaceAll(regex, '');
    notifyListeners();
    return s;
  }
}
