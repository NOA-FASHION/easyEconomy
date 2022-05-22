// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easyeconomy/controllers/easy_Controller.dart';
import 'package:easyeconomy/screens/guest_screen_start1.dart';
import 'package:easyeconomy/screens/purchase.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class GuestScreenStart1 extends StatefulWidget {
  GuestScreenStart1({Key? key}) : super(key: key);

  @override
  _GuestScreenStart1State createState() => _GuestScreenStart1State();
}

class _GuestScreenStart1State extends State<GuestScreenStart1> {
  Future<Null> delay(int milliseconds) {
    return new Future.delayed(new Duration(milliseconds: milliseconds));
  }

  @override
  Widget build(BuildContext context) {
    EasyController variable = Provider.of<EasyController>(context);
    // variable.authAnonyme();
    // variable.demarageSwitchIntro();
    // test = variable.getChallengeyesterday().nbtacheVallide;
    // modifDtabaseFirebase().then((value) => variable.logOut);
    bool activationManuel = false;
    String? switchActiv = variable.getChallengeyesterday().active;
    return Container(
      child: (switchActiv == "false" && activationManuel == false)
          ? ChangeNotifierProvider.value(value: variable, child: PurchaseApp())
          : ChangeNotifierProvider.value(value: variable, child: GuestScreen()),
    );
  }
}
