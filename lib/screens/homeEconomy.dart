import 'package:circle_nav_bar/circle_nav_bar.dart';
import 'package:easyeconomy/controllers/easy_Controller.dart';
import 'package:easyeconomy/screens/charge_fixe_mensuel.dart';
import 'package:easyeconomy/screens/setting.dart';

import 'package:easyeconomy/screens/simulator_gestion.dart';
import 'package:flutter/material.dart';

import 'package:loading_overlay_pro/loading_overlay_pro.dart';

import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

import 'package:vertical_card_pager/vertical_card_pager.dart';

import 'gestion_mensuel.dart';

class Home extends StatefulWidget {
  final int index;
  Home({Key? key, required this.index}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
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
    late TabController tabController =
        TabController(length: 2, vsync: this, initialIndex: tabIndex);
    EasyController variable = Provider.of<EasyController>(context);
    return Material(
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Colors.orange, Colors.blueAccent])),
        child: Scaffold(
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
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(130.0),
            child: SafeArea(
              child: navbar
                  ? AppBar(
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
                                colors: <Color>[
                              Colors.orange,
                              Colors.blueAccent
                            ])),
                      ),
                    )
                  : SizedBox(
                      height: 0.1,
                    ),
            ),
          ),
          body: navbar
              ? LoadingOverlayPro(
                  isLoading: _isLoading,
                  child: Shimmer(
                    duration: Duration(seconds: 3),
                    interval: Duration(seconds: 5),
                    color: Colors.white,
                    enabled: true,
                    direction: ShimmerDirection.fromLTRB(),
                    child: Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [Colors.orange, Colors.blueAccent])),
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
                          Center(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15.0),
                                image: DecorationImage(
                                  invertColors: true,
                                  image: AssetImage("assets/1.png"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              width: MediaQuery.of(context).size.width / 1.2,
                              height: 220,
                              child: Card(
                                  color: Colors.transparent,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  elevation: 15.0,
                                  child: Container(
                                    margin: EdgeInsets.only(bottom: 15),
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
                                                    BorderRadius.circular(5),
                                                color: Colors.orange.shade200),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(2.0),
                                              child: Text(
                                                "Charge et revenu fixe"
                                                    .toUpperCase(),
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ),
                                        ),
                                        // SizedBox(
                                        //   height: 20.0,
                                        // ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            // Padding(
                                            //   padding: const EdgeInsets.all(8.0),
                                            //   child: SizedBox.fromSize(
                                            //       size: Size(50,
                                            //           50), // button width and height
                                            //       child: ClipOval(
                                            //           child: Material(
                                            //               color: Colors.blue,
                                            //               child: InkWell(
                                            //                 // splash color
                                            //                 splashColor: Colors.white,
                                            //                 onTap: () {
                                            //                   variable
                                            //                       .uploadChallenge();
                                            //                 },
                                            //                 child: Column(
                                            //                   mainAxisAlignment:
                                            //                       MainAxisAlignment
                                            //                           .center,
                                            //                   children: <Widget>[
                                            //                     Icon(
                                            //                       Icons.upload_sharp,
                                            //                       size: 20,
                                            //                       color: Colors.white,
                                            //                     ), // icon
                                            //                     Text(
                                            //                       "Upload",
                                            //                       style: TextStyle(
                                            //                           fontSize: 10,
                                            //                           color: Colors
                                            //                               .white),
                                            //                     ), // text
                                            //                   ],
                                            //                 ),
                                            //               )))),
                                            // ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  )),
                            ),
                          ),
                          Center(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                image: DecorationImage(
                                  image: AssetImage("assets/2.png"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              width: MediaQuery.of(context).size.width / 1.2,
                              height: 220,
                              child: Card(
                                  color: Colors.transparent,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                  elevation: 15.0,
                                  child: Container(
                                    margin: EdgeInsets.only(bottom: 15),
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
                                                    BorderRadius.circular(5),
                                                color: Colors.orange.shade200),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(4.0),
                                              child: Text(
                                                "Simulateur de gestion"
                                                    .toUpperCase(),
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ),
                                        ),
                                        // SizedBox(
                                        //   height: 15.0,
                                        // ),
                                        // Row(
                                        //   mainAxisAlignment: MainAxisAlignment.end,
                                        //   children: [
                                        //     Column(
                                        //       children: [
                                        //         Padding(
                                        //           padding:
                                        //               const EdgeInsets.only(right: 8),
                                        //           child: IconButton(
                                        //             onPressed: () async {
                                        //               setState(() {
                                        //                 _isLoading = true;
                                        //               });
                                        //               await delay(2000);
                                        //               setState(() {
                                        //                 _isLoading = false;
                                        //               });
                                        //               showTopSnackBar(
                                        //                 context,
                                        //                 CustomSnackBar.success(
                                        //                   backgroundColor:
                                        //                       Colors.blue,
                                        //                   icon: Icon(
                                        //                     Icons.restore,
                                        //                     size: 30,
                                        //                     color: Colors.white,
                                        //                   ),
                                        //                   message:
                                        //                       'reset effectué avec succes',
                                        //                 ),
                                        //               );
                                        //               variable
                                        //                   .resetListMontantPrevision();
                                        //             },
                                        //             icon: Icon(
                                        //               Icons.restart_alt,
                                        //               color: Colors.blue,
                                        //               size: 45,
                                        //             ),
                                        //           ),
                                        //         ),
                                        //         Center(
                                        //           child: Text(
                                        //             "Reset",
                                        //             style:
                                        //                 TextStyle(color: Colors.blue),
                                        //           ),
                                        //         ),
                                        //       ],
                                        //     ),
                                        //   ],
                                        // ),
                                        // SizedBox(
                                        //   height: 5.0,
                                        // ),
                                        // Lottie.asset("assets/simulateur.json",
                                        //     width: 70),
                                        // Icon(
                                        //   Icons.calculate,
                                        //   color: Colors.white,
                                        //   size: 45,
                                        // ),

                                        // Center(child: Text("Simulateur de gestion")),
                                      ],
                                    ),
                                  )),
                            ),
                          ),
                          Center(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                image: DecorationImage(
                                  invertColors: true,
                                  image: AssetImage("assets/3.png"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              width: MediaQuery.of(context).size.width / 1.2,
                              height: 210,
                              child: Card(
                                  color: Colors.transparent,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                  elevation: 15.0,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
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
                                              color: Colors.orange.shade200),
                                          child: Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Text(
                                              "Gestion mensuelle".toUpperCase(),
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                      ),
                                      // Center(child: Text("Gestion mensuelle")),
                                    ],
                                  )),
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
