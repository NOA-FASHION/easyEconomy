import 'package:easyeconomy/models/easy_economy_models.dart';
import 'package:easyeconomy/screens/screen_indicateur_montant.dart';
import 'package:flutter/material.dart';
import 'package:marquee_text/marquee_text.dart';
import 'package:multi_charts/multi_charts.dart';

class CalculMontant {
  String unityPattern = "unity_Montant_universelle.";
  double montantTotals(List<MontantUniverselle> listMontantUniverselle,
      List<MontantUniverselle> listMontantPrevision, bool simuOuchargeFixe) {
    double montant = 0;
    if (!simuOuchargeFixe) {
      for (var i = listMontantUniverselle.length - 1; i >= 0; i--) {
        if (listMontantUniverselle[i].unity.toString() ==
            'unity_Montant_universelle.ChargeFixe') {
          montant = montant - listMontantUniverselle[i].montant;
        } else if (listMontantUniverselle[i].unity.toString() ==
            'unity_Montant_universelle.RevenuFixe') {
          montant = montant + listMontantUniverselle[i].montant;
        }
      }
    } else if (simuOuchargeFixe) {
      for (var i = listMontantPrevision.length - 1; i >= 0; i--) {
        if (listMontantPrevision[i].unity.toString() ==
                'unity_Montant_universelle.ChargeFixe' ||
            listMontantPrevision[i].unity.toString() ==
                'unity_Montant_universelle.depensePonctuelle') {
          montant = montant - listMontantPrevision[i].montant;
        } else if (listMontantPrevision[i].unity.toString() ==
                'unity_Montant_universelle.RevenuFixe' ||
            listMontantPrevision[i].unity.toString() ==
                'unity_Montant_universelle.RevenuPonctuel') {
          montant = montant + listMontantPrevision[i].montant;
        }
      }
    }

    return montant;
  }

  double montantCharges(List<MontantUniverselle> listMontantUniverselle,
      List<MontantUniverselle> listMontantPrevision, bool simuOuchargeFixe) {
    double montants = 0;
    if (!simuOuchargeFixe) {
      for (var i = listMontantUniverselle.length - 1; i >= 0; i--) {
        print(listMontantUniverselle[i].unity.toString());
        if (listMontantUniverselle[i].unity.toString() ==
            'unity_Montant_universelle.ChargeFixe') {
          montants = montants + listMontantUniverselle[i].montant;
        }
      }
    } else if (simuOuchargeFixe) {
      for (var i = listMontantPrevision.length - 1; i >= 0; i--) {
        print(listMontantPrevision[i].unity.toString());
        if (listMontantPrevision[i].unity.toString() ==
                'unity_Montant_universelle.ChargeFixe' ||
            listMontantPrevision[i].unity.toString() ==
                'unity_Montant_universelle.depensePonctuelle') {
          montants = montants + listMontantPrevision[i].montant;
        }
      }
    }

    return montants;
  }

  double montantRevenu(List<MontantUniverselle> listMontantUniverselle,
      List<MontantUniverselle> listMontantPrevision, bool simuOuchargeFixe) {
    double montants = 0;
    if (!simuOuchargeFixe) {
      for (var i = listMontantUniverselle.length - 1; i >= 0; i--) {
        if (listMontantUniverselle[i].unity.toString() ==
            'unity_Montant_universelle.RevenuFixe') {
          montants = montants + listMontantUniverselle[i].montant;
        }
      }
    } else if (simuOuchargeFixe) {
      for (var i = listMontantPrevision.length - 1; i >= 0; i--) {
        if (listMontantPrevision[i].unity.toString() ==
                'unity_Montant_universelle.RevenuFixe' ||
            listMontantPrevision[i].unity.toString() ==
                'unity_Montant_universelle.RevenuPonctuel') {
          montants = montants + listMontantPrevision[i].montant;
        }
      }
    }
    return montants;
  }

  Widget header(
      bool transactionPasse,
      List<MontantUniverselle> _listMontantUniverselle,
      List<MontantUniverselle> _listMontPrevision,
      double montantChargesDouble,
      double montantRevenuDouble,
      double montantTotalsDouble,
      bool simuOuchargeFixe) {
    Widget headers = Container(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.only(top: 70.0, right: 10, left: 10),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                        child: !simuOuchargeFixe
                            ? Text(
                                " Charge Fixe".toUpperCase(),
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              )
                            : Text(
                                !transactionPasse
                                    ? " Simulateur".toUpperCase()
                                    : " Transactions passées".toUpperCase(),
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                      ),
                    ),
                  ),
                  Container(
                    width: 110,
                    height: 110,
                    child: PieChart(
                      textScaleFactor: 0.0,
                      values: [
                        (montantChargesDouble / montantRevenuDouble) * 100,
                        (montantTotalsDouble / montantRevenuDouble) * 100
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ScreenIndicatorMontant(
                    simuOuchargeFixe: simuOuchargeFixe,
                    titre: "Charges",
                    icones: Icons.arrow_circle_up,
                    listMontantUniverselle: _listMontantUniverselle,
                    listMontantPrevision: _listMontPrevision,
                    montantCharge: montantChargesDouble.toStringAsFixed(2),
                    montantRevenu: montantRevenuDouble.toStringAsFixed(2),
                    montantTotals: montantTotalsDouble.toStringAsFixed(2),
                  ),
                  ScreenIndicatorMontant(
                    simuOuchargeFixe: simuOuchargeFixe,
                    titre: "Revenus",
                    icones: Icons.arrow_circle_down,
                    listMontantUniverselle: _listMontantUniverselle,
                    listMontantPrevision: _listMontPrevision,
                    montantCharge: montantChargesDouble.toStringAsFixed(2),
                    montantRevenu: montantRevenuDouble.toStringAsFixed(2),
                    montantTotals: montantTotalsDouble.toStringAsFixed(2),
                  ),
                  ScreenIndicatorMontant(
                    simuOuchargeFixe: simuOuchargeFixe,
                    titre: "Solde",
                    icones: Icons.calculate_outlined,
                    listMontantUniverselle: _listMontantUniverselle,
                    listMontantPrevision: _listMontPrevision,
                    montantCharge: montantChargesDouble.toStringAsFixed(2),
                    montantRevenu: montantRevenuDouble.toStringAsFixed(2),
                    montantTotals: montantTotalsDouble.toStringAsFixed(2),
                  ),
                ],
              ),
            ],
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

  Widget maxLetterTitre(String word, BuildContext context) {
    Widget longLetter;

    String word2;
    if (word.length > 20) {
      longLetter = Container(
        width: MediaQuery.of(context).size.width / 2.4,
        color: Colors.transparent,
        child: MarqueeText(
          text: TextSpan(text: word),
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          speed: 30,
        ),
      );
      return longLetter;
    } else if (word.length > 25) {
      longLetter = Container(
        width: MediaQuery.of(context).size.width / 2,
        color: Colors.transparent,
        child: MarqueeText(
          text: TextSpan(text: word),
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          speed: 30,
        ),
      );
      return longLetter;
    } else {
      word2 = word;
      longLetter = Text(
        word2,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      );
    }
    return longLetter;
  }

  Color colorsDescription(String description) {
    Color colors = Colors.black;
    if (description == "unity_Montant_universelle.ChargeFixe") {
      colors = Colors.red.shade900;
      return colors;
    } else if (description == "unity_Montant_universelle.depensePonctuelle") {
      colors = Colors.red.shade900;
      return colors;
    } else if (description == "unity_Montant_universelle.RevenuFixe") {
      colors = Colors.green.shade900;
      return colors;
    } else if (description == "unity_Montant_universelle.RevenuPonctuel") {
      colors = Colors.green.shade900;
      return colors;
    }
    return colors;
  }

  Widget activeGlow(MontantUniverselle gestion, BuildContext context) {
    Widget glow = Padding(
      padding: const EdgeInsets.all(1.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          // color: colorsDescription(gestion.unity.toString()),
        ),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          elevation: 15.0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 1.45,
                      height: 25.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          maxLetterTitre(gestion.nom.toUpperCase(), context),
                          SizedBox(
                            width: 15.0,
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            elevation: 5.0,
                            color: colorsDescription(gestion.unity.toString()),
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Text(
                                gestion.unity
                                    .toString()
                                    .replaceAll(unityPattern, "")
                                    .toUpperCase(),
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 1.45,
                      height: 30.0,
                      child: Row(
                        children: [
                          Text(
                            "Montant",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blue),
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            gestion.montant.toStringAsFixed(2) + " €",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(60.0),
                  ),
                  elevation: 15.0,
                  child: Container(
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(40.0),
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Icon(
                            IconData(gestion.icones,
                                fontFamily: 'MaterialIcons'),
                            color: colorsDescription(gestion.unity.toString()),
                          ),
                        )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

    return glow;
  }
}
