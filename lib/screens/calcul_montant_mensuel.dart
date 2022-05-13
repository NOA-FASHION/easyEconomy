import 'package:easyeconomy/controllers/easy_Controller.dart';
import 'package:easyeconomy/models/easy_economy_models.dart';
import 'package:easyeconomy/screens/gestion_mensuel_live_resultats.dart';
import 'package:easyeconomy/screens/screen_indicateur_montant.dart';
import 'package:easyeconomy/screens/screen_indicator_montant_gestionMensuel_live.dart';
import 'package:flutter/material.dart';
import 'package:multi_charts/multi_charts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class CalculMontantMensuel {
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
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
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
                          child: Text(
                            " GESTION MENSUELLE".toUpperCase(),
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          )),
                    ),
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
                  // Container(
                  //   width: 110,
                  //   height: 110,
                  //   child: PieChart(
                  //     textScaleFactor: 0.0,
                  //     values: [
                  //       (montantChargesDouble / montantRevenuDouble) * 100,
                  //       (montantTotalsDouble / montantRevenuDouble) * 100
                  //     ],
                  //     labels: ['Marge', 'frais'],
                  //     sliceFillColors: [
                  //       Colors.red,
                  //       Colors.blue,
                  //     ],
                  //     animationDuration: Duration(milliseconds: 1500),
                  //     showLegend: false,
                  //   ),
                  // ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ScreenIndicatorMontantGestionLive(
                    titre: _listMontantUniverselleLive.length > 0
                        ? 'Restantes'
                        : "Prévisons charges",
                    icones: Icons.arrow_circle_up,
                    gestionListMontantUniverselle: _listMontantUniverselle,
                    gestionListMontantUniverselleLive:
                        _listMontantUniverselleLive,
                    titre1: 'Validées',
                    titre2: 'CHARGE',
                  ),
                  ScreenIndicatorMontantGestionLive(
                    titre: _listMontantUniverselleLive.length > 0
                        ? ' Restants'
                        : "Prévisions revenus",
                    icones: Icons.arrow_circle_down,
                    gestionListMontantUniverselle: _listMontantUniverselle,
                    gestionListMontantUniverselleLive:
                        _listMontantUniverselleLive,
                    titre2: 'REVENUS',
                    titre1: ' Validés',
                  ),
                  ScreenIndicatorMontantGestionLive(
                    titre: _listMontantUniverselleLive.length > 0
                        ? 'Restants '
                        : "Prévision  solde",
                    icones: Icons.calculate_outlined,
                    gestionListMontantUniverselle: _listMontantUniverselle,
                    gestionListMontantUniverselleLive:
                        _listMontantUniverselleLive,
                    titre1: 'Validé ',
                    titre2: 'SOLDE',
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
}
