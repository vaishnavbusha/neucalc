// ignore_for_file: non_constant_identifier_names

import 'package:hive/hive.dart';
part 'historymodel.g.dart';

@HiveType(typeId: 0)
class HistoryModel {
  @HiveField(0)
  String expression_value;
  @HiveField(1)
  String history_value;
  @HiveField(2)
  String date_time;
  HistoryModel(
      {required this.expression_value,
      required this.history_value,
      required this.date_time});
}
