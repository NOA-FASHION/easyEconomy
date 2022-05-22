import 'package:easyeconomy/screens/homeEconomy.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'controllers/easy_Controller.dart';

void main() => runApp(EasyEconomy());

class EasyEconomy extends StatefulWidget {
  @override
  _EasyEconomyState createState() => _EasyEconomyState();
}

class _EasyEconomyState extends State<EasyEconomy> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.transparent,
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      title: 'EasyEconomy',
      home: ChangeNotifierProvider<EasyController>(
          create: (context) => EasyController(),
          child: Home(
            index: 1,
          )),
    );
  }
}
