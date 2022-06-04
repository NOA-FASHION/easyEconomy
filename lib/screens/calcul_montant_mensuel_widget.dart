import 'package:easyeconomy/controllers/easy_Controller.dart';
import 'package:easyeconomy/models/easy_economy_models.dart';
import 'package:easyeconomy/screens/gestion_mensuel_live_resultats.dart';
import 'package:easyeconomy/screens/screen_indicator_montant_gestionMensuel_live.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pie_chart/flutter_pie_chart.dart';
import 'package:provider/provider.dart';
import 'package:wave_transition/wave_transition.dart';

class HeadderMensuel extends StatefulWidget {
  final double montantCharge;
  final double montantChargeLive;
  final double montantRevenu;
  final double montantRevenuLive;
  final double montantTotals;
  final double montantTotalsLive;
  final BuildContext context;
  final String idGestionMontantUniverselle;
  final EasyController variable;
  final int indexMontantUniverselle;
  final List<MontantUniverselle> listMontantUniverselle;
  final List<MontantUniverselle> listMontantUniverselleLive;
  final bool simuOuchargeFixe;
  HeadderMensuel(
      {Key? key,
      required this.montantCharge,
      required this.montantChargeLive,
      required this.montantRevenu,
      required this.montantRevenuLive,
      required this.montantTotals,
      required this.montantTotalsLive,
      required this.context,
      required this.idGestionMontantUniverselle,
      required this.variable,
      required this.indexMontantUniverselle,
      required this.listMontantUniverselle,
      required this.listMontantUniverselleLive,
      required this.simuOuchargeFixe})
      : super(key: key);

  @override
  State<HeadderMensuel> createState() => _HeadderMensuelState();
}

class _HeadderMensuelState extends State<HeadderMensuel> {
  bool baterry = true;
  double soldeLive(double montantTotals, double montantTotalsLive) {
    double montant = 0;

    montant = montantTotals + montantTotalsLive;

    if (montant > 0) {
      baterry = true;
    } else {
      baterry = false;
    }

    return montant;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.only(top: 60.0, right: 10, left: 10),
        child: FlipCard(
          speed: 400,
          flipOnTouch: true,
          fill: Fill
              .fillBack, // Fill the back side of the card to make in the same size as the front.
          direction: FlipDirection.HORIZONTAL, // default
          front: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Transaction(
                          transaction: "Transactions à venir",
                        ),
                        PieChart(
                          montantCharge: widget.montantCharge,
                          montantRevenu: widget.montantRevenu,
                          montantTotals: widget.montantTotals,
                        ),

                        // Card(
                        //   color: Colors.transparent,
                        //   shape: RoundedRectangleBorder(
                        //     borderRadius: BorderRadius.circular(5.0),
                        //   ),
                        //   elevation: 25.0,
                        //   child: Container(
                        //     decoration: BoxDecoration(
                        //         borderRadius: BorderRadius.circular(10),
                        //         color: Colors.white),
                        //     child: Padding(
                        //         padding: const EdgeInsets.all(8.0),
                        //         child: Text(
                        //           "Transactions à venir".toUpperCase(),
                        //           style: TextStyle(
                        //               fontSize: 12,
                        //               color: Colors.black,
                        //               fontWeight: FontWeight.bold),
                        //           textAlign: TextAlign.center,
                        //         )),
                        //   ),
                        // ),
                        // Container(
                        //   padding: EdgeInsets.all(8),
                        //   width: 80,
                        //   height: 80,
                        //   child: FlutterPieChart(
                        //     pies: [
                        //       Pie(
                        //           color: Colors.red.shade500,
                        //           proportion: widget.montantCharge),
                        //       Pie(
                        //           color: Colors.green.shade500,
                        //           proportion: widget.montantRevenu),
                        //       Pie(
                        //           color: widget.montantCharge >
                        //                   widget.montantRevenu
                        //               ? Colors.red.shade900
                        //               : Colors.green.shade900,
                        //           proportion: widget.montantTotals > 0
                        //               ? widget.montantTotals
                        //               : -widget.montantTotals),
                        //     ],
                        //     selected: 2,
                        //   ),
                        // ),
                      ],
                    ),
                    TransactionPasse(
                      idGestionMontantUniverselle:
                          widget.idGestionMontantUniverselle,
                      indexMontantUniverselle: widget.indexMontantUniverselle,
                      variable: widget.variable,
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.only(right: 27, top: 17),
                    //   child: Column(
                    //     mainAxisAlignment: MainAxisAlignment.center,
                    //     children: <Widget>[
                    //       InkWell(
                    //         splashColor: Colors.white,
                    //         onTap: () {
                    //           Navigator.push(
                    //               context,
                    //               WaveTransition(
                    //                   center: FractionalOffset(0.90, 0.90),
                    //                   duration: Duration(milliseconds: 1000),
                    //                   child: ChangeNotifierProvider.value(
                    //                       value: variable,
                    //                       child: GestionMensuelLiveResultats(
                    //                         idGestionMontantUniverselle:
                    //                             idGestionMontantUniverselle,
                    //                         indexMontantUniverselle:
                    //                             indexMontantUniverselle,
                    //                       ))));
                    //         },
                    //         child: Icon(
                    //           Icons.settings,
                    //           size: 30,
                    //           color: Colors.black,
                    //         ),
                    //       ), // icon
                    //       Text(
                    //         "Transactions passées",
                    //         style: TextStyle(fontSize: 12, color: Colors.black),
                    //       ), // text
                    //     ],
                    //   ),
                    // ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ScreenIndicatorMontantGestionLive(
                      titre: 'Prévisons charges',
                      icones: Icons.arrow_circle_up,
                      gestionListMontantUniverselle:
                          widget.listMontantUniverselle,
                      gestionListMontantUniverselleLive:
                          widget.listMontantUniverselleLive,
                      titre1: 'Charges',
                      titre2: 'CHARGE',
                      montantCharge: widget.montantCharge,
                      montantChargeLive: widget.montantChargeLive,
                      montantRevenu: widget.montantRevenu,
                      montantRevenuLive: widget.montantRevenuLive,
                      montantTotals: widget.montantTotals,
                      montantTotalsLive: widget.montantTotalsLive,
                    ),
                    ScreenIndicatorMontantGestionLive(
                      montantCharge: widget.montantCharge,
                      montantChargeLive: widget.montantChargeLive,
                      montantRevenu: widget.montantRevenu,
                      montantRevenuLive: widget.montantRevenuLive,
                      montantTotals: widget.montantTotals,
                      montantTotalsLive: widget.montantTotalsLive,
                      titre: 'Prévisions revenus',
                      icones: Icons.arrow_circle_down,
                      gestionListMontantUniverselle:
                          widget.listMontantUniverselle,
                      gestionListMontantUniverselleLive:
                          widget.listMontantUniverselleLive,
                      titre2: 'REVENUS',
                      titre1: 'Revenus',
                    ),
                    ScreenIndicatorMontantGestionLive(
                      montantCharge: widget.montantCharge,
                      montantChargeLive: widget.montantChargeLive,
                      montantRevenu: widget.montantRevenu,
                      montantRevenuLive: widget.montantRevenuLive,
                      montantTotals: widget.montantTotals,
                      montantTotalsLive: widget.montantTotalsLive,
                      titre: 'Prévision  solde',
                      icones: Icons.calculate_outlined,
                      gestionListMontantUniverselle:
                          widget.listMontantUniverselle,
                      gestionListMontantUniverselleLive:
                          widget.listMontantUniverselleLive,
                      titre1: 'Solde',
                      titre2: 'SOLDE',
                    ),
                  ],
                ),
              ],
            ),
          ),
          back: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        // Card(
                        //   color: Colors.transparent,
                        //   shape: RoundedRectangleBorder(
                        //     borderRadius: BorderRadius.circular(5.0),
                        //   ),
                        //   elevation: 25.0,
                        //   child: Container(
                        //     decoration: BoxDecoration(
                        //         borderRadius: BorderRadius.circular(10),
                        //         color: Colors.white),
                        //     child: Padding(
                        //         padding: const EdgeInsets.all(8.0),
                        //         child: Text(
                        //           " Transactions validées".toUpperCase(),
                        //           style: TextStyle(
                        //               fontSize: 12,
                        //               color: Colors.black,
                        //               fontWeight: FontWeight.bold),
                        //           textAlign: TextAlign.center,
                        //         )),
                        //   ),
                        // ),
                        Transaction(
                          transaction: "Transactions validées",
                        ),
                        PieChart(
                          montantCharge: widget.montantChargeLive,
                          montantRevenu: widget.montantRevenuLive,
                          montantTotals: widget.montantTotalsLive,
                        ),

                        // Container(
                        //   padding: EdgeInsets.all(8),
                        //   width: 80,
                        //   height: 80,
                        //   child: FlutterPieChart(
                        //     pies: [
                        //       Pie(
                        //           color: Colors.red.shade500,
                        //           proportion: montantChargeLive),
                        //       Pie(
                        //           color: Colors.green.shade500,
                        //           proportion: montantRevenuLive),
                        //       Pie(
                        //           color: montantChargeLive > montantRevenuLive
                        //               ? Colors.red.shade900
                        //               : Colors.green.shade900,
                        //           proportion: montantTotalsLive > 0
                        //               ? montantTotalsLive
                        //               : -montantTotalsLive),
                        //     ],
                        //     selected: 2,
                        //   ),
                        // ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 1),
                      width: MediaQuery.of(context).size.width / 3.2,
                      height: 150,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white70),
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Transaction(
                                transaction: "Estimation",
                              ),
                              // Card(
                              //   color: Colors.transparent,
                              //   shape: RoundedRectangleBorder(
                              //     borderRadius: BorderRadius.circular(5.0),
                              //   ),
                              //   elevation: 25.0,
                              //   child: Container(
                              //     decoration: BoxDecoration(
                              //         borderRadius: BorderRadius.circular(10),
                              //         color: Colors.white),
                              //     child: Padding(
                              //         padding: const EdgeInsets.all(8.0),
                              //         child: Text(
                              //           "Estimation".toUpperCase(),
                              //           style: TextStyle(
                              //               fontSize: 12,
                              //               color: Colors.black,
                              //               fontWeight: FontWeight.bold),
                              //           textAlign: TextAlign.center,
                              //         )),
                              //   ),
                              // ),
                              Icon(
                                Icons.calculate,
                                size: 30,
                                color: baterry
                                    ? Colors.green.shade900
                                    : Colors.red.shade900,
                              ),
                              Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                elevation: 5.0,
                                color: baterry
                                    ? Colors.green.shade900
                                    : Colors.red.shade900,
                                child: Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: Text(
                                    "Solde",
                                    style: TextStyle(
                                        fontSize: 13,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),

                              SoldeLive(
                                baterry: baterry,
                                soldeLive: soldeLive(widget.montantTotals,
                                    widget.montantTotalsLive),
                              ),
                              // Card(
                              //   color: Colors.orange,
                              //   shape: RoundedRectangleBorder(
                              //     borderRadius: BorderRadius.circular(10.0),
                              //   ),
                              //   elevation: 25.0,
                              //   child: Container(
                              //     decoration: BoxDecoration(
                              //         borderRadius: BorderRadius.circular(10),
                              //         color: Colors.white),
                              //     child: Padding(
                              //       padding: const EdgeInsets.all(8.0),
                              //       child: Text(
                              //         soldeLive(widget.montantTotals,
                              //                     widget.montantTotalsLive)
                              //                 .toStringAsFixed(2) +
                              //             " €",
                              //         style: TextStyle(
                              //             fontSize: 13,
                              //             color: baterry
                              //                 ? Colors.green.shade900
                              //                 : Colors.red.shade900,
                              //             fontWeight: FontWeight.bold),
                              //         textAlign: TextAlign.center,
                              //       ),
                              //     ),
                              //   ),
                              // ), // text
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ScreenIndicatorMontantGestionLive(
                      montantCharge: widget.montantCharge,
                      montantChargeLive: widget.montantChargeLive,
                      montantRevenu: widget.montantRevenu,
                      montantRevenuLive: widget.montantRevenuLive,
                      montantTotals: widget.montantTotals,
                      montantTotalsLive: widget.montantTotalsLive,
                      titre: "Charge Live",
                      icones: Icons.arrow_circle_up,
                      gestionListMontantUniverselle:
                          widget.listMontantUniverselle,
                      gestionListMontantUniverselleLive:
                          widget.listMontantUniverselleLive,
                      titre1: 'Charges',
                      titre2: 'Charge Live',
                    ),
                    ScreenIndicatorMontantGestionLive(
                      montantCharge: widget.montantCharge,
                      montantChargeLive: widget.montantChargeLive,
                      montantRevenu: widget.montantRevenu,
                      montantRevenuLive: widget.montantRevenuLive,
                      montantTotals: widget.montantTotals,
                      montantTotalsLive: widget.montantTotalsLive,
                      titre: "Revenu live",
                      icones: Icons.arrow_circle_down,
                      gestionListMontantUniverselle:
                          widget.listMontantUniverselle,
                      gestionListMontantUniverselleLive:
                          widget.listMontantUniverselleLive,
                      titre2: 'REVENUS',
                      titre1: 'Revenus',
                    ),
                    ScreenIndicatorMontantGestionLive(
                      montantCharge: widget.montantCharge,
                      montantChargeLive: widget.montantChargeLive,
                      montantRevenu: widget.montantRevenu,
                      montantRevenuLive: widget.montantRevenuLive,
                      montantTotals: widget.montantTotals,
                      montantTotalsLive: widget.montantTotalsLive,
                      titre: "Solde live",
                      icones: Icons.calculate_outlined,
                      gestionListMontantUniverselle:
                          widget.listMontantUniverselle,
                      gestionListMontantUniverselleLive:
                          widget.listMontantUniverselleLive,
                      titre1: 'Solde',
                      titre2: 'SOLDE',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: <Color>[Colors.orange, Colors.blueAccent])),
    );
  }
}

class Transaction extends StatelessWidget {
  final String transaction;
  const Transaction({Key? key, required this.transaction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      elevation: 25.0,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.white),
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              transaction.toUpperCase(),
              style: TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            )),
      ),
    );
  }
}

class PieChart extends StatelessWidget {
  final double montantCharge;
  final double montantRevenu;
  final double montantTotals;
  const PieChart(
      {Key? key,
      required this.montantCharge,
      required this.montantRevenu,
      required this.montantTotals})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      width: 80,
      height: 80,
      child: FlutterPieChart(
        pies: [
          Pie(color: Colors.red.shade500, proportion: montantCharge),
          Pie(color: Colors.green.shade500, proportion: montantRevenu),
          Pie(
              color: montantCharge > montantRevenu
                  ? Colors.red.shade900
                  : Colors.green.shade900,
              proportion: montantTotals > 0 ? montantTotals : montantTotals),
        ],
        selected: 2,
      ),
    );
  }
}

class TransactionPasse extends StatelessWidget {
  final String idGestionMontantUniverselle;
  final EasyController variable;
  final int indexMontantUniverselle;
  const TransactionPasse(
      {Key? key,
      required this.idGestionMontantUniverselle,
      required this.variable,
      required this.indexMontantUniverselle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 27, top: 17),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          InkWell(
            splashColor: Colors.white,
            onTap: () {
              Navigator.push(
                  context,
                  WaveTransition(
                      center: FractionalOffset(0.90, 0.90),
                      duration: Duration(milliseconds: 1000),
                      child: ChangeNotifierProvider.value(
                          value: variable,
                          child: GestionMensuelLiveResultats(
                            idGestionMontantUniverselle:
                                idGestionMontantUniverselle,
                            indexMontantUniverselle: indexMontantUniverselle,
                          ))));
            },
            child: Icon(
              Icons.settings,
              size: 30,
              color: Colors.black,
            ),
          ), // icon
          Text(
            "Transactions passées",
            style: TextStyle(fontSize: 12, color: Colors.black),
          ), // text
        ],
      ),
    );
  }
}

class SoldeLive extends StatelessWidget {
  final bool baterry;
  final double soldeLive;
  const SoldeLive({Key? key, required this.soldeLive, required this.baterry})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.orange,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 25.0,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.white),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            soldeLive.toStringAsFixed(2) + " €",
            style: TextStyle(
                fontSize: 13,
                color: baterry ? Colors.green.shade900 : Colors.red.shade900,
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
