import 'package:easyeconomy/controllers/easy_Controller.dart';
import 'package:easyeconomy/models/easy_economy_models.dart';
import 'package:easyeconomy/screens/gestion_mensuel_live_resultats.dart';
import 'package:easyeconomy/screens/screen_indicateur_montant.dart';
import 'package:easyeconomy/screens/screen_indicator_montant_gestionMensuel_live.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:multi_charts/multi_charts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class CalculMontantMensuel {
  bool baterry = true;
  double montantCharge(List<MontantUniverselle> gestionListMontantUniverselle) {
    double montants = 0;

    for (var i = gestionListMontantUniverselle.length - 1; i >= 0; i--) {
      if (gestionListMontantUniverselle[i].unity.toString() ==
              'unity_Montant_universelle.ChargeFixe' ||
          gestionListMontantUniverselle[i].unity.toString() ==
              'unity_Montant_universelle.depensePonctuelle') {
        montants = montants + gestionListMontantUniverselle[i].montant;
      }
    }
    return montants;
  }

  double montantChargeLive(
      List<MontantUniverselle> gestionListMontantUniverselleLive) {
    double montants = 0;

    for (var i = gestionListMontantUniverselleLive.length - 1; i >= 0; i--) {
      print(gestionListMontantUniverselleLive[i].unity.toString());
      if (gestionListMontantUniverselleLive[i].unity.toString() ==
              'unity_Montant_universelle.ChargeFixe' ||
          gestionListMontantUniverselleLive[i].unity.toString() ==
              'unity_Montant_universelle.depensePonctuelle') {
        montants = montants + gestionListMontantUniverselleLive[i].montant;
      }
    }

    return montants;
  }

  double montantRevenu(List<MontantUniverselle> gestionListMontantUniverselle) {
    double montants = 0;
    for (var i = gestionListMontantUniverselle.length - 1; i >= 0; i--) {
      if (gestionListMontantUniverselle[i].unity.toString() ==
              'unity_Montant_universelle.RevenuFixe' ||
          gestionListMontantUniverselle[i].unity.toString() ==
              'unity_Montant_universelle.RevenuPonctuel') {
        montants = montants + gestionListMontantUniverselle[i].montant;
      }
    }

    return montants;
  }

  double montantRevenuLive(
      List<MontantUniverselle> gestionListMontantUniverselleLive) {
    double montants = 0;

    for (var i = gestionListMontantUniverselleLive.length - 1; i >= 0; i--) {
      if (gestionListMontantUniverselleLive[i].unity.toString() ==
              'unity_Montant_universelle.RevenuFixe' ||
          gestionListMontantUniverselleLive[i].unity.toString() ==
              'unity_Montant_universelle.RevenuPonctuel') {
        montants = montants + gestionListMontantUniverselleLive[i].montant;
      }
    }
    return montants;
  }

  double montantTotals(List<MontantUniverselle> gestionListMontantUniverselle) {
    double montant = 0;
    for (var i = gestionListMontantUniverselle.length - 1; i >= 0; i--) {
      if (gestionListMontantUniverselle[i].unity.toString() ==
              'unity_Montant_universelle.ChargeFixe' ||
          gestionListMontantUniverselle[i].unity.toString() ==
              'unity_Montant_universelle.depensePonctuelle') {
        montant = montant - gestionListMontantUniverselle[i].montant;
      } else if (gestionListMontantUniverselle[i].unity.toString() ==
              'unity_Montant_universelle.RevenuFixe' ||
          gestionListMontantUniverselle[i].unity.toString() ==
              'unity_Montant_universelle.RevenuPonctuel') {
        montant = montant + gestionListMontantUniverselle[i].montant;
      }
    }

    return montant;
  }

  double montantTotalsLive(
      List<MontantUniverselle> gestionListMontantUniverselleLive) {
    double montant = 0;

    for (var i = gestionListMontantUniverselleLive.length - 1; i >= 0; i--) {
      if (gestionListMontantUniverselleLive[i].unity.toString() ==
              'unity_Montant_universelle.ChargeFixe' ||
          gestionListMontantUniverselleLive[i].unity.toString() ==
              'unity_Montant_universelle.depensePonctuelle') {
        montant = montant - gestionListMontantUniverselleLive[i].montant;
      } else if (gestionListMontantUniverselleLive[i].unity.toString() ==
              'unity_Montant_universelle.RevenuFixe' ||
          gestionListMontantUniverselleLive[i].unity.toString() ==
              'unity_Montant_universelle.RevenuPonctuel') {
        montant = montant + gestionListMontantUniverselleLive[i].montant;
      }
    }

    return montant;
  }

  Widget header(
      double montantCharge,
      double montantChargeLive,
      double montantRevenu,
      double montantRevenuLive,
      double montantTotals,
      double montantTotalsLive,
      BuildContext context,
      String idGestionMontantUniverselle,
      EasyController variable,
      int indexMontantUniverselle,
      List<MontantUniverselle> _listMontantUniverselle,
      List<MontantUniverselle> _listMontantUniverselleLive,
      bool simuOuchargeFixe) {
    Widget headers = Container(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.only(top: 60.0, right: 10, left: 10),
        child: FlipCard(
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
                        Card(
                          color: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          elevation: 25.0,
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white),
                            child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Transaction à venir".toUpperCase(),
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                )),
                          ),
                        ),
                        Container(
                          width: 90,
                          height: 90,
                          child: PieChart(
                            textScaleFactor: 0.0,
                            values: [
                              (montantCharge / montantRevenu) * 100,
                              (montantTotals / montantRevenu) * 100
                            ],
                            labels: ['Marge', 'frais'],
                            sliceFillColors: [
                              Colors.red,
                              montantCharge > montantRevenu
                                  ? Colors.red
                                  : Colors.blue,
                            ],
                            animationDuration: Duration(milliseconds: 1500),
                            showLegend: false,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 27, top: 17),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          InkWell(
                            splashColor: Colors.white,
                            onTap: () {
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType.bottomToTop,
                                      child: ChangeNotifierProvider.value(
                                          value: variable,
                                          child: GestionMensuelLiveResultats(
                                            idGestionMontantUniverselle:
                                                idGestionMontantUniverselle,
                                            indexMontantUniverselle:
                                                indexMontantUniverselle,
                                          ))));
                            },
                            child: Icon(
                              Icons.settings,
                              size: 20,
                              color: Colors.black,
                            ),
                          ), // icon
                          Text(
                            "transaction",
                            style: TextStyle(fontSize: 10, color: Colors.black),
                          ), // text
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ScreenIndicatorMontantGestionLive(
                      titre: 'Prévisons charges',
                      icones: Icons.arrow_circle_up,
                      gestionListMontantUniverselle: _listMontantUniverselle,
                      gestionListMontantUniverselleLive:
                          _listMontantUniverselleLive,
                      titre1: 'Charges',
                      titre2: 'CHARGE',
                      montantCharge: montantCharge,
                      montantChargeLive: montantChargeLive,
                      montantRevenu: montantRevenu,
                      montantRevenuLive: montantRevenuLive,
                      montantTotals: montantTotals,
                      montantTotalsLive: montantTotalsLive,
                    ),
                    ScreenIndicatorMontantGestionLive(
                      montantCharge: montantCharge,
                      montantChargeLive: montantChargeLive,
                      montantRevenu: montantRevenu,
                      montantRevenuLive: montantRevenuLive,
                      montantTotals: montantTotals,
                      montantTotalsLive: montantTotalsLive,
                      titre: 'Prévisions revenus',
                      icones: Icons.arrow_circle_down,
                      gestionListMontantUniverselle: _listMontantUniverselle,
                      gestionListMontantUniverselleLive:
                          _listMontantUniverselleLive,
                      titre2: 'REVENUS',
                      titre1: 'Revenus',
                    ),
                    ScreenIndicatorMontantGestionLive(
                      montantCharge: montantCharge,
                      montantChargeLive: montantChargeLive,
                      montantRevenu: montantRevenu,
                      montantRevenuLive: montantRevenuLive,
                      montantTotals: montantTotals,
                      montantTotalsLive: montantTotalsLive,
                      titre: 'Prévision  solde',
                      icones: Icons.calculate_outlined,
                      gestionListMontantUniverselle: _listMontantUniverselle,
                      gestionListMontantUniverselleLive:
                          _listMontantUniverselleLive,
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
                        Card(
                          color: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          elevation: 25.0,
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white),
                            child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  " Transactions passées".toUpperCase(),
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                )),
                          ),
                        ),
                        Container(
                          width: 90,
                          height: 90,
                          child: PieChart(
                            textScaleFactor: 0.0,
                            values: [
                              (montantChargeLive / montantRevenuLive) * 100,
                              (montantTotalsLive / montantRevenuLive) * 100
                            ],
                            labels: ['Marge', 'frais'],
                            sliceFillColors: [
                              Colors.red,
                              Colors.blue,
                            ],
                            animationDuration: Duration(milliseconds: 1500),
                            showLegend: false,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 3.2,
                      height: 150,
                      child: Card(
                          color: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          elevation: 25.0,
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
                                  // icon
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Estimation finale ",
                                      style: TextStyle(
                                          fontSize: 13,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Card(
                                    color: Colors.orange,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    elevation: 25.0,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          soldeLive(montantTotals,
                                                      montantTotalsLive)
                                                  .toStringAsFixed(2) +
                                              " €",
                                          style: TextStyle(
                                              fontSize: 13,
                                              color: baterry
                                                  ? Colors.green.shade900
                                                  : Colors.red.shade900,
                                              fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 13,
                                  ),
                                  Text(
                                    "Solde",
                                    style: TextStyle(
                                        fontSize: 13,
                                        color: baterry
                                            ? Colors.green.shade900
                                            : Colors.red.shade900,
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          )),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ScreenIndicatorMontantGestionLive(
                      montantCharge: montantCharge,
                      montantChargeLive: montantChargeLive,
                      montantRevenu: montantRevenu,
                      montantRevenuLive: montantRevenuLive,
                      montantTotals: montantTotals,
                      montantTotalsLive: montantTotalsLive,
                      titre: "Charge Live",
                      icones: Icons.arrow_circle_up,
                      gestionListMontantUniverselle: _listMontantUniverselle,
                      gestionListMontantUniverselleLive:
                          _listMontantUniverselleLive,
                      titre1: 'Charges',
                      titre2: 'Charge Live',
                    ),
                    ScreenIndicatorMontantGestionLive(
                      montantCharge: montantCharge,
                      montantChargeLive: montantChargeLive,
                      montantRevenu: montantRevenu,
                      montantRevenuLive: montantRevenuLive,
                      montantTotals: montantTotals,
                      montantTotalsLive: montantTotalsLive,
                      titre: "Revenu live",
                      icones: Icons.arrow_circle_down,
                      gestionListMontantUniverselle: _listMontantUniverselle,
                      gestionListMontantUniverselleLive:
                          _listMontantUniverselleLive,
                      titre2: 'REVENUS',
                      titre1: 'Revenus',
                    ),
                    ScreenIndicatorMontantGestionLive(
                      montantCharge: montantCharge,
                      montantChargeLive: montantChargeLive,
                      montantRevenu: montantRevenu,
                      montantRevenuLive: montantRevenuLive,
                      montantTotals: montantTotals,
                      montantTotalsLive: montantTotalsLive,
                      titre: "Solde live",
                      icones: Icons.calculate_outlined,
                      gestionListMontantUniverselle: _listMontantUniverselle,
                      gestionListMontantUniverselleLive:
                          _listMontantUniverselleLive,
                      titre1: 'Soldes',
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
    return headers;
  }

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

  Color choixColors(String titre, String titre1) {
    Color montant = Colors.white;

    if (titre == "Prévision  solde" ||
        titre == 'Solde live' ||
        titre1 == 'Validé ') {
      montant = Colors.blue.shade900;
    } else if (titre == "Prévisions revenus" ||
        titre == 'revenus restants' ||
        titre1 == 'Revenu live') {
      montant = Colors.green.shade900;
    } else if (titre == "Prévisons charges" ||
        titre == "Restantes" ||
        titre1 == "Charge Live") {
      montant = Colors.red.shade900;
    }

    return montant;
  }
}
