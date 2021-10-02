import 'package:easyeconomy/controllers/easy_Controller.dart';
import 'package:easyeconomy/screens/simulator_gestion.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

import 'charge_fixe_mensuel.dart';
import 'gestion_mensuel.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    EasyController variable = Provider.of<EasyController>(context);
    return Material(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100.0),
          child: SafeArea(
            child: AppBar(
              title: Text("EASYECONNOMY"),
              centerTitle: true,
              flexibleSpace: Container(
                padding: EdgeInsets.only(top: 40.0),
                alignment: Alignment.center,
                child: Image.asset(
                  'assets/logo.png',
                  width: 55,
                  height: 130,
                ),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: <Color>[Colors.orange, Colors.blueAccent])),
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Shimmer(
            duration: Duration(seconds: 3),
            interval: Duration(seconds: 5),
            color: Colors.white,
            enabled: true,
            direction: ShimmerDirection.fromLTRB(),
            child: Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [Colors.orange, Colors.blueAccent])),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Center(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.bottomToTop,
                                child: ChangeNotifierProvider.value(
                                    value: variable,
                                    child: ChargeFixeMensuel())));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [Colors.blueAccent, Colors.orange])),
                        width: MediaQuery.of(context).size.width / 1.2,
                        height: 210,
                        child: Card(
                            color: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            elevation: 15.0,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.monetization_on,
                                  color: Colors.white,
                                  size: 45,
                                ),
                                SizedBox(
                                  height: 15.0,
                                ),
                                Center(child: Text("Charge fixe mensuelle")),
                              ],
                            )),
                      ),
                    ),
                  ),
                  Center(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.bottomToTop,
                                child: ChangeNotifierProvider.value(
                                    value: variable,
                                    child: SimulatorGestion())));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [Colors.blueAccent, Colors.orange])),
                        width: MediaQuery.of(context).size.width / 1.2,
                        height: 210,
                        child: Card(
                            color: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            elevation: 15.0,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.alarm_on,
                                  color: Colors.white,
                                  size: 45,
                                ),
                                SizedBox(
                                  height: 15.0,
                                ),
                                Center(child: Text("Simulateur de gestion")),
                              ],
                            )),
                      ),
                    ),
                  ),
                  Center(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.bottomToTop,
                                child: ChangeNotifierProvider.value(
                                    value: variable, child: GestionMensuel())));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [Colors.blueAccent, Colors.orange])),
                        width: MediaQuery.of(context).size.width / 1.2,
                        height: 210,
                        child: Card(
                            color: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            elevation: 15.0,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.dashboard,
                                  color: Colors.white,
                                  size: 45,
                                ),
                                SizedBox(
                                  height: 15.0,
                                ),
                                Center(child: Text("Gestion mensuelle")),
                              ],
                            )),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
