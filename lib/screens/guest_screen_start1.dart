import 'package:easyeconomy/controllers/easy_Controller.dart';
import 'package:easyeconomy/screens/homeEconomy.dart';

import 'package:easyeconomy/screens/introViews.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class GuestScreen extends StatefulWidget {
  GuestScreen({Key? key}) : super(key: key);

  @override
  _GuestScreenState createState() => _GuestScreenState();
}

class _GuestScreenState extends State<GuestScreen> {
  @override
  Widget build(BuildContext context) {
    EasyController variable = Provider.of<EasyController>(context);
    String? switchIntro = variable.getChallengeyesterday().switchIintro;

    return Container(
      child: switchIntro == "true" || switchIntro == ""
          ? ChangeNotifierProvider.value(
              value: variable, child: IntroViewsPage())
          : ChangeNotifierProvider.value(value: variable, child: Home()),
    );
  }
}
