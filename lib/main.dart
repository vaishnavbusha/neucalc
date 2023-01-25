import 'package:calc/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter/services.dart';

import 'package:hive_flutter/hive_flutter.dart';
import './view/calculator.dart';
import 'model/historymodel.dart';

main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  // await GetStorage.init();
  await Hive.initFlutter();
  Hive.registerAdapter(HistoryModelAdapter());
  await Hive.openBox(hiveDataVariable);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(Calc());
}

class Calc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Calculator(),
    );
  }
}
