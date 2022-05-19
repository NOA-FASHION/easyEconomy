import 'package:easyeconomy/controllers/easy_Controller.dart';
import 'package:easyeconomy/screens/charge_fixe_mensuel.dart';

import 'package:easyeconomy/screens/simulator_gestion.dart';
import 'package:flutter/material.dart';
import 'package:loading_overlay_pro/loading_overlay_pro.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import 'gestion_mensuel.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    Duration duration = Duration(seconds: 10);
    Future<Null> delay(int milliseconds) {
      return new Future.delayed(new Duration(milliseconds: milliseconds));
    }

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
        body: LoadingOverlayPro(
          isLoading: _isLoading,
          child: SingleChildScrollView(
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
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: SizedBox.fromSize(
                                              size: Size(50,
                                                  50), // button width and height
                                              child: ClipOval(
                                                  child: Material(
                                                      color: Colors.blue,
                                                      child: InkWell(
                                                        // splash color
                                                        splashColor:
                                                            Colors.white,
                                                        onTap: () {
                                                          variable
                                                              .uploadChallenge();
                                                          // variable.initialiseConnectionDatabase();
                                                        }, // button pressed
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: <Widget>[
                                                            Icon(
                                                              Icons
                                                                  .upload_sharp,
                                                              size: 20,
                                                              color:
                                                                  Colors.white,
                                                            ), // icon
                                                            Text(
                                                              "Upload",
                                                              style: TextStyle(
                                                                  fontSize: 10,
                                                                  color: Colors
                                                                      .white),
                                                            ), // text
                                                          ],
                                                        ),
                                                      )))),
                                        ),
                                      ],
                                    ),
                                    // SizedBox(
                                    //   height: 5.0,
                                    // ),
                                    Lottie.asset("assets/ChargeRevenuFixe.json",
                                        width: 70),
                                    // Icon(
                                    //   Icons.calculate,
                                    //   color: Colors.white,
                                    //   size: 45,
                                    // ),
                                    SizedBox(
                                      height: 15.0,
                                    ),
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
                                                BorderRadius.circular(10),
                                            color: Colors.orangeAccent),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            "Charge et revenu fixe mensuelle"
                                                .toUpperCase(),
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    ),
                                    // Center(child: Text("Simulateur de gestion")),
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
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 8),
                                              child: IconButton(
                                                onPressed: () async {
                                                  setState(() {
                                                    _isLoading = true;
                                                  });
                                                  await delay(2000);
                                                  setState(() {
                                                    _isLoading = false;
                                                  });
                                                  showTopSnackBar(
                                                    context,
                                                    CustomSnackBar.success(
                                                      backgroundColor:
                                                          Colors.blue,
                                                      icon: Icon(
                                                        Icons.restore,
                                                        size: 30,
                                                        color: Colors.white,
                                                      ),
                                                      message:
                                                          'reset effectué avec succes',
                                                    ),
                                                  );
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
                                    // SizedBox(
                                    //   height: 5.0,
                                    // ),
                                    Lottie.asset("assets/simulateur.json",
                                        width: 70),
                                    // Icon(
                                    //   Icons.calculate,
                                    //   color: Colors.white,
                                    //   size: 45,
                                    // ),
                                    SizedBox(
                                      height: 15.0,
                                    ),
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
                                                BorderRadius.circular(10),
                                            color: Colors.orangeAccent),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            "Simulateur de gestion"
                                                .toUpperCase(),
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    ),
                                    // Center(child: Text("Simulateur de gestion")),
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
                                      value: variable,
                                      child: GestionMensuel())));
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
                                  Lottie.asset("assets/shedule.json",
                                      width: 60),
                                  // Icon(
                                  //   Icons.calendar_view_day,
                                  //   color: Colors.white,
                                  //   size: 45,
                                  // ),
                                  SizedBox(
                                    height: 15.0,
                                  ),
                                  Card(
                                    color: Colors.transparent,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    elevation: 25.0,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.orangeAccent),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
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
                    ),
                    // Center(
                    //   child: InkWell(
                    //     onTap: () {
                    //       Navigator.push(
                    //           context,
                    //           PageTransition(
                    //               type: PageTransitionType.bottomToTop,
                    //               child: ChangeNotifierProvider.value(
                    //                 value: variable,
                    //                 child: TestScreen(

                    //                 ),
                    //               )));
                    //     },
                    //     child: Container(
                    //       decoration: BoxDecoration(
                    //           borderRadius: BorderRadius.circular(10),
                    //           gradient: LinearGradient(
                    //               begin: Alignment.centerLeft,
                    //               end: Alignment.centerRight,
                    //               colors: [Colors.blueAccent, Colors.orange])),
                    //       width: MediaQuery.of(context).size.width / 1.2,
                    //       height: 210,
                    //       child: Card(
                    //           color: Colors.transparent,
                    //           shape: RoundedRectangleBorder(
                    //             borderRadius: BorderRadius.circular(30.0),
                    //           ),
                    //           elevation: 15.0,
                    //           child: Column(
                    //             mainAxisAlignment: MainAxisAlignment.center,
                    //             children: [
                    //               Icon(
                    //                 Icons.calendar_view_day,
                    //                 color: Colors.white,
                    //                 size: 45,
                    //               ),
                    //               SizedBox(
                    //                 height: 15.0,
                    //               ),
                    //               Center(child: Text("test")),
                    //             ],
                    //           )),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
