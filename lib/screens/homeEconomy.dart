import 'package:easyeconomy/controllers/easy_Controller.dart';
import 'package:easyeconomy/screens/screenTest.dart';
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

class _HomeState extends State<Home> with TickerProviderStateMixin {
  AnimationController? animationController;
  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 600), vsync: this);
    EasyController variable = Provider.of<EasyController>(context);
    return Material(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(130.0),
          child: SafeArea(
            child: AppBar(
              title: Text('EASYECONOMY',
                  style: TextStyle(color: Colors.black, fontSize: 18)),
              centerTitle: true,
              flexibleSpace: Container(
                padding: EdgeInsets.only(top: 30.0),
                alignment: Alignment.center,
                child: Image.asset(
                  'assets/logo1.png',
                  width: 80,
                  height: 120,
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
                                  Icons.approval,
                                  color: Colors.white,
                                  size: 45,
                                ),
                                SizedBox(
                                  height: 15.0,
                                ),
                                Center(
                                    child: Text(
                                        "Charge et revenu fixe mensuelle")),
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
                            child: Container(
                              margin: EdgeInsets.only(bottom: 15),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Column(
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(right: 8),
                                            child: IconButton(
                                              onPressed: () {
                                                variable
                                                    .resetListMontantPrevision();
                                              },
                                              icon: Icon(
                                                Icons.restart_alt,
                                                color: Colors.white,
                                                size: 45,
                                              ),
                                            ),
                                          ),
                                          Center(child: Text("Reset")),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 35.0,
                                  ),
                                  Icon(
                                    Icons.calculate,
                                    color: Colors.white,
                                    size: 45,
                                  ),
                                  SizedBox(
                                    height: 15.0,
                                  ),
                                  Center(child: Text("Simulateur de gestion")),
                                ],
                              ),
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
                                  Icons.calendar_view_day,
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
                  Center(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.bottomToTop,
                                child: ChangeNotifierProvider.value(
                                  value: variable,
                                  child: TestScreen(
                                    animation: Tween<double>(
                                            begin: 0.0, end: 1.0)
                                        .animate(CurvedAnimation(
                                            parent: animationController!,
                                            curve: Interval((1 / 9) * 1, 1.0,
                                                curve: Curves.fastOutSlowIn))),
                                    animationController: animationController!,
                                  ),
                                )));
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
                                  Icons.calendar_view_day,
                                  color: Colors.white,
                                  size: 45,
                                ),
                                SizedBox(
                                  height: 15.0,
                                ),
                                Center(child: Text("test")),
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
