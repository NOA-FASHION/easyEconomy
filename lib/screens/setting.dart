import 'package:circle_nav_bar/circle_nav_bar.dart';
import 'package:easyeconomy/controllers/easy_Controller.dart';
import 'package:easyeconomy/screens/homeEconomy.dart';
import 'package:flutter/scheduler.dart';
import 'package:easyeconomy/screens/purchase.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class Setting extends StatefulWidget {
  final int index;

  Setting({Key? key, required this.index}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    EasyController variable = Provider.of<EasyController>(context);
    return Material(
      child: Scaffold(
        bottomNavigationBar: CircleNavBar(
          activeIcons: const [
            Icon(Icons.person, color: Colors.deepPurple),
            Icon(Icons.home, color: Colors.deepPurple),
            Icon(Icons.favorite, color: Colors.deepPurple),
          ],
          inactiveIcons: const [
            Text("My"),
            Text("Home"),
            Text("Like"),
          ],
          color: Colors.grey.shade400,
          height: 60,
          circleWidth: 60,
          initIndex: widget.index,
          onChanged: (v) {
            if (v == 0) {
              Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.bottomToTop,
                      child: ChangeNotifierProvider.value(
                          value: variable,
                          child: PurchaseApp(
                            index: 0,
                          ))));
            } else if (v == 1) {
              Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.bottomToTop,
                      child: ChangeNotifierProvider.value(
                          value: variable,
                          child: Home(
                            index: 1,
                          ))));
            } else if (v == 2) {
              Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.bottomToTop,
                      child: ChangeNotifierProvider.value(
                          value: variable,
                          child: Setting(
                            index: 2,
                          ))));
            }
          },
          // tabCurve: ,
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 20),
          cornerRadius: const BorderRadius.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8),
            bottomRight: Radius.circular(24),
            bottomLeft: Radius.circular(24),
          ),
          shadowColor: Colors.deepPurple,
          elevation: 10,
        ),
      ),
    );
  }
}
