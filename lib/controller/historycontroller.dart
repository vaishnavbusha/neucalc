import 'package:calc/controller/hive_controller.dart';
import 'package:calc/model/historymodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';

import '../constants.dart';

class HistoryController extends ChangeNotifier {
  List tempHistoryListData = [];
  getHistoryData() {
    tempHistoryListData = HiveController.getHistoryListHIVE();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      notifyListeners();
    });
  }

  deleteHistory() {
    tempHistoryListData.clear();
    HiveController.saveHistoryListHIVE(tempHistoryListData);
    //saveHistoryListHIVE([]);
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      notifyListeners();
    });
  }
}
