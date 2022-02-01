import 'package:get/get.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculaterController extends GetxController {
  var expression = ''.obs;
  var history = ''.obs;
  void numClick(String text) {
    if (expression.value == 'invalid') {
      expression.value = '';
    } else if (text == 'mod') {
      expression.value += '%';
    } else if (text == 'x') {
      expression.value += '*';
    } else if (text == '_') {
      expression.value += '-';
    } else {
      expression.value += text;
    }
  }

  void del(String text) {
    if (expression.isEmpty)
      expression.value = 'invalid';
    else if (expression.value == 'invalid')
      expression.value = '';
    else
      expression.value =
          (expression.value).substring(0, (expression.value).length - 1);
  }

  void allClear(String text) {
    history.value = '';
    expression.value = '';
  }

  void clear(String text) {
    expression.value = '';
  }

  void evaluate(String text) {
    String temp;
    if (expression.isEmpty) {
      expression.value = 'invalid';
    }
    if (expression.value == 'invalid' ||
        expression.isEmpty ||
        ((expression.value).length == 1) &&
            ((expression.value[0] == '/') ||
                (expression.value[0] == '+') ||
                (expression.value[0] == '-') ||
                (expression.value[0] == '*') ||
                (expression.value[0] == '%'))) {
      expression.value = 'invalid';
    }
    try {
      Parser p = Parser();
      Expression exp = p.parse(expression.value);
      ContextModel cm = ContextModel();

      if ((expression.value).isEmpty || expression.value == 'invalid') {
        expression.value = 'invalid';
      } else {
        history.value = expression.value;
        temp = exp.evaluate(EvaluationType.REAL, cm).toString();
        if (temp[temp.length - 1] == '0') {
          expression.value = temp.substring(0, temp.length - 2);
        } else {
          expression.value = exp.evaluate(EvaluationType.REAL, cm).toString();
        }
      }
    } catch (e) {
      expression.value = 'invalid';
    }
  }
}
