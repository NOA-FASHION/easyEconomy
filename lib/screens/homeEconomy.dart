import 'package:circle_nav_bar/circle_nav_bar.dart';
import 'package:easyeconomy/controllers/easy_Controller.dart';
import 'package:easyeconomy/screens/charge_fixe_mensuel.dart';
import 'package:easyeconomy/screens/setting.dart';

import 'package:easyeconomy/screens/simulator_gestion.dart';
import 'package:flutter/material.dart';

import 'package:loading_overlay_pro/loading_overlay_pro.dart';
import 'package:marquee_text/marquee_text.dart';

import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:shape_of_view_null_safe/shape_of_view_null_safe.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

import 'package:vertical_card_pager/vertical_card_pager.dart';

import 'gestion_mensuel.dart';

class Home extends StatefulWidget {
  Home({
    Key? key,
  }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _isLoading = false;

  final List<String> titles = ["", "", ""];
  bool navbar = true;
  // @override
  // void initState() {
  //   super.initState();
  //   timeDilation = 3;
  // }

  // @override
  // void dispose() {
  //   super.dispose();
  //   timeDilation = 1;
  // }

  @override
  Widget build(BuildContext context) {
    // Duration duration = Duration(seconds: 10);
    // Future<Null> delay(int milliseconds) {
    //   return new Future.delayed(new Duration(milliseconds: milliseconds));
    // }
    int tabIndex = 0;
    // late TabController tabController =
    //     TabController(length: 2, vsync: this, initialIndex: tabIndex);
    EasyController variable = Provider.of<EasyController>(context);
    double widthC = MediaQuery.of(context).size.width * 100;
    return Material(
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Colors.orange, Colors.blueAccent])),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          bottomNavigationBar: CircleNavBar(
            activeIcons: const [
              Icon(Icons.home, color: Colors.blue),
              Icon(Icons.settings, color: Colors.orangeAccent),
            ],
            inactiveIcons: const [
              Text("Home"),
              Text("Setting"),
            ],
            color: Colors.grey.shade400,
            height: 60,
            circleWidth: 60,
            initIndex: tabIndex,
            onChanged: (v) {
              // tabController.animateTo(v);
              // tabIndex = v;
              if (v == 1) {
                setState(() {
                  navbar = false;
                });
              } else if (v == 0) {
                setState(() {
                  navbar = true;
                });
              }
            },
            // tabCurve: ,
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 20),
            cornerRadius: const BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
              bottomRight: Radius.circular(24),
              bottomLeft: Radius.circular(24),
            ),
            shadowColor: Colors.red,
            elevation: 15,
          ),
          // appBar: PreferredSize(
          //   preferredSize: Size.fromHeight(130.0),
          //   child: SafeArea(
          // child: navbar
          // ? AppBar(
          //     title: Text('EASYECONOMY',
          //         style: TextStyle(color: Colors.black, fontSize: 18)),
          //     centerTitle: true,
          //     flexibleSpace: Container(
          //       padding: EdgeInsets.only(top: 30.0),
          //       alignment: Alignment.center,
          //       child: Image.asset(
          //         'assets/logo1.png',
          //         width: 80,
          //         height: 120,
          //       ),
          //       decoration: BoxDecoration(
          //           gradient: LinearGradient(
          //               begin: Alignment.centerLeft,
          //               end: Alignment.centerRight,
          //               colors: <Color>[
          //             Colors.orange,
          //             Colors.blueAccent
          //           ])),
          //     ),
          //   )
          // : SizedBox(
          //     height: 0.1,
          //   ),
          //   ),
          // ),
          body: navbar
              ? LoadingOverlayPro(
                  isLoading: _isLoading,
                  child: Shimmer(
                    duration: Duration(seconds: 3),
                    interval: Duration(seconds: 5),
                    color: Colors.white,
                    enabled: true,
                    direction: ShimmerDirection.fromLTRB(),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 50),
                            child: _buildHeader(context, widthC),
                          ),
                          Container(
                            height: 550,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                  Colors.orange,
                                  Colors.blueAccent
                                ])),
                            child: VerticalCardPager(
                              initialPage: 1,
                              align: ALIGN.CENTER,
                              onPageChanged: (page) {},
                              onSelectedItem: (page) {
                                if (page == 0) {
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          type: PageTransitionType.bottomToTop,
                                          child: ChangeNotifierProvider.value(
                                              value: variable,
                                              child: ChargeFixeMensuel())));
                                } else if (page == 1) {
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          type: PageTransitionType.bottomToTop,
                                          child: ChangeNotifierProvider.value(
                                              value: variable,
                                              child: SimulatorGestion())));
                                } else if (page == 2) {
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          type: PageTransitionType.bottomToTop,
                                          child: ChangeNotifierProvider.value(
                                              value: variable,
                                              child: GestionMensuel())));
                                }
                              },
                              titles: titles,
                              images: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15.0),
                                    image: DecorationImage(
                                      invertColors: true,
                                      image: AssetImage("assets/1.png"),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  width:
                                      MediaQuery.of(context).size.width / 1.2,
                                  height: 190,
                                  child: Card(
                                      color: Colors.transparent,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                      ),
                                      elevation: 15.0,
                                      child: Container(
                                        margin: EdgeInsets.only(bottom: 1),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Card(
                                              color: Colors.transparent,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                              ),
                                              elevation: 25.0,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    color:
                                                        Colors.orange.shade200),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(4.0),
                                                  child: MarqueeText(
                                                    text: TextSpan(
                                                        text:
                                                            "Charge et revenu fixe"
                                                                .toUpperCase()),
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                    ),
                                                    speed: 30,
                                                  ),

                                                  // Text(
                                                  //   "Charge et revenu fixe"
                                                  //       .toUpperCase(),
                                                  //   style: TextStyle(
                                                  //       fontSize: 12,
                                                  //       color: Colors.black,
                                                  //       fontWeight:
                                                  //           FontWeight.bold),
                                                  //   textAlign: TextAlign.center,
                                                  // ),
                                                ),
                                              ),
                                            ),
                                            // SizedBox(
                                            //   height: 20.0,
                                            // ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [],
                                            ),
                                          ],
                                        ),
                                      )),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.0),
                                    image: DecorationImage(
                                      image: AssetImage("assets/2.png"),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  width:
                                      MediaQuery.of(context).size.width / 1.2,
                                  height: 190,
                                  child: Card(
                                      color: Colors.transparent,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                      ),
                                      elevation: 15.0,
                                      child: Container(
                                        margin: EdgeInsets.only(bottom: 1),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Card(
                                              color: Colors.transparent,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                              ),
                                              elevation: 25.0,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    color:
                                                        Colors.orange.shade200),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(4.0),
                                                  child: MarqueeText(
                                                    text: TextSpan(
                                                        text:
                                                            "Simulateur de gestion"
                                                                .toUpperCase()),
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                    ),
                                                    speed: 30,
                                                  ),

                                                  // Text(
                                                  //   "Simulateur de gestion"
                                                  //       .toUpperCase(),
                                                  //   style: TextStyle(
                                                  //       fontSize: 12,
                                                  //       color: Colors.black,
                                                  //       fontWeight:
                                                  //           FontWeight.bold),
                                                  //   textAlign: TextAlign.center,
                                                  // ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.0),
                                    image: DecorationImage(
                                      invertColors: true,
                                      image: AssetImage("assets/3.png"),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  width:
                                      MediaQuery.of(context).size.width / 1.2,
                                  height: 190,
                                  child: Card(
                                      color: Colors.transparent,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                      ),
                                      elevation: 15.0,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          // Lottie.asset("assets/shedule.json",
                                          //     width: 60),
                                          // Icon(
                                          //   Icons.calendar_view_day,
                                          //   color: Colors.white,
                                          //   size: 45,
                                          // ),

                                          Card(
                                            color: Colors.transparent,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                            ),
                                            elevation: 25.0,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  color:
                                                      Colors.orange.shade200),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(4.0),
                                                child: MarqueeText(
                                                  text: TextSpan(
                                                      text: "Gestion mensuelle"
                                                          .toUpperCase()),
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                  ),
                                                  speed: 30,
                                                ),
                                                // child: Text(
                                                //   "Gestion mensuelle"
                                                //       .toUpperCase(),
                                                //   style: TextStyle(
                                                //       fontSize: 12,
                                                //       color: Colors.black,
                                                //       fontWeight:
                                                //           FontWeight.bold),
                                                //   textAlign: TextAlign.center,
                                                // ),
                                              ),
                                            ),
                                          ),
                                          // Center(child: Text("Gestion mensuelle")),
                                        ],
                                      )),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              : Setting(
                  index: 1,
                ),
        ),
      ),
    );
  }
}

Widget _buildHeader(BuildContext context, double width) {
  return ShapeOfView(
    shape: BubbleShape(
        position: BubblePosition.Bottom,
        arrowPositionPercent: 0.5,
        borderRadius: 20,
        arrowHeight: 10,
        arrowWidth: 10),
    child: Stack(
      children: <Widget>[
        Ink(
          height: 230,
          width: 430,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            image: new DecorationImage(
              image: new AssetImage('assets/6.png'),
              fit: BoxFit.cover,
            ),
            // gradient: LinearGradient(
            //     begin: Alignment.centerLeft,
            //     end: Alignment.centerRight,
            //     colors: [Colors.orange, Colors.blueAccent])
          ),
        ),
        Container(
          width: 200,
          margin: const EdgeInsets.only(top: 50),
          child: Column(
            children: <Widget>[
              Card(
                elevation: 15,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
                color: Colors.grey.shade400,
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(
                      color: Colors.white,
                      width: 6.0,
                    ),
                  ),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(80),
                      child: Image.asset('assets/logo.png',
                          width: 80, height: 80, fit: BoxFit.fill)),
                ),
              ),
              _buildMainInfo(context, width)
            ],
          ),
        ),
        // Container(
        //     decoration: BoxDecoration(
        //         borderRadius: BorderRadius.circular(5.0),
        //         gradient: LinearGradient(
        //             begin: Alignment.centerLeft,
        //             end: Alignment.centerRight,
        //             colors: [Colors.orange, Colors.blueAccent])),
        //     margin: const EdgeInsets.only(top: 210),
        //     child: _buildInfoCard(context))
      ],
    ),
  );
}

Widget _buildMainInfo(BuildContext context, double width) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(5.0),
      // gradient: LinearGradient(
      //     begin: Alignment.centerLeft,
      //     end: Alignment.centerRight,
      //     colors: [Colors.orange, Colors.blueAccent])
    ),
    width: width,
    margin: const EdgeInsets.all(10),
    alignment: AlignmentDirectional.center,
    child: Column(
      children: <Widget>[
        Text('HOME',
            style: TextStyle(
                fontSize: 20, color: Colors.teal, fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
        // Text('Flutter',
        //     style: TextStyle(
        //         color: Colors.grey.shade50, fontStyle: FontStyle.italic))
      ],
    ),
  );
}
