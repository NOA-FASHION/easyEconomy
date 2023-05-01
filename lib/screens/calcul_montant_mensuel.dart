import 'package:currency_textfield/currency_textfield.dart';
import 'package:easyeconomy/controllers/easy_Controller.dart';
import 'package:easyeconomy/models/easy_economy_models.dart';

import 'package:easyeconomy/screens/transaction_edit.dart';

import 'package:flutter/material.dart';

import 'package:marquee_text/marquee_text.dart';

import 'package:provider/provider.dart';

class CalculMontantMensuel {
  String valueText3 = '';
  String valueText4 = '';
  String unityPattern = "unity_Montant_universelle.";
  bool baterry = true;

  double montantCharge(List<MontantUniverselle> gestionListMontantUniverselle) {
    double montants = 0;
    List<MontantUniverselle> gestionListMontantUniverselleTrie =
        gestionListMontantUniverselle
            .where((c) => c.previsionsTotal == 0)
            .toList();
    for (var i = gestionListMontantUniverselleTrie.length - 1; i >= 0; i--) {
      if (gestionListMontantUniverselleTrie[i].unity.toString() ==
              'unity_Montant_universelle.ChargeFixe' ||
          gestionListMontantUniverselleTrie[i].unity.toString() ==
              'unity_Montant_universelle.depensePonctuelle') {
        montants = montants + gestionListMontantUniverselleTrie[i].montant;
      }
    }
    return montants;
  }

  double montantChargeLive(
      List<MontantUniverselle> gestionListMontantUniverselleLive) {
    double montants = 0;

    List<MontantUniverselle> gestionListMontantUniverselleLiveTrie =
        gestionListMontantUniverselleLive
            .where((c) => c.previsionsTotal == 0)
            .toList();

    for (var i = gestionListMontantUniverselleLiveTrie.length - 1;
        i >= 0;
        i--) {
      // print(gestionListMontantUniverselleLiveTrie[i].unity.toString());
      if (gestionListMontantUniverselleLiveTrie[i].unity.toString() ==
              'unity_Montant_universelle.ChargeFixe' ||
          gestionListMontantUniverselleLiveTrie[i].unity.toString() ==
              'unity_Montant_universelle.depensePonctuelle') {
        montants = montants + gestionListMontantUniverselleLiveTrie[i].montant;
      }
    }

    return montants;
  }

  double montantRevenu(List<MontantUniverselle> gestionListMontantUniverselle) {
    double montants = 0;

    List<MontantUniverselle> gestionListMontantUniverselleTrie =
        gestionListMontantUniverselle
            .where((c) => c.previsionsTotal == 0)
            .toList();
    for (var i = gestionListMontantUniverselleTrie.length - 1; i >= 0; i--) {
      if (gestionListMontantUniverselleTrie[i].unity.toString() ==
              'unity_Montant_universelle.RevenuFixe' ||
          gestionListMontantUniverselleTrie[i].unity.toString() ==
              'unity_Montant_universelle.RevenuPonctuel') {
        montants = montants + gestionListMontantUniverselleTrie[i].montant;
      }
    }

    return montants;
  }

  double montantRevenuLive(
      List<MontantUniverselle> gestionListMontantUniverselleLive) {
    double montants = 0;
    List<MontantUniverselle> gestionListMontantUniverselleLiveTrie =
        gestionListMontantUniverselleLive
            .where((c) => c.previsionsTotal == 0)
            .toList();
    for (var i = gestionListMontantUniverselleLiveTrie.length - 1;
        i >= 0;
        i--) {
      if (gestionListMontantUniverselleLiveTrie[i].unity.toString() ==
              'unity_Montant_universelle.RevenuFixe' ||
          gestionListMontantUniverselleLiveTrie[i].unity.toString() ==
              'unity_Montant_universelle.RevenuPonctuel') {
        montants = montants + gestionListMontantUniverselleLiveTrie[i].montant;
      }
    }
    return montants;
  }

  double montantTotals(List<MontantUniverselle> gestionListMontantUniverselle) {
    double montant = 0;

    List<MontantUniverselle> gestionListMontantUniverselleTrie =
        gestionListMontantUniverselle
            .where((c) => c.previsionsTotal == 0)
            .toList();
    for (var i = gestionListMontantUniverselleTrie.length - 1; i >= 0; i--) {
      if (gestionListMontantUniverselleTrie[i].unity.toString() ==
              'unity_Montant_universelle.ChargeFixe' ||
          gestionListMontantUniverselleTrie[i].unity.toString() ==
              'unity_Montant_universelle.depensePonctuelle') {
        montant = montant - gestionListMontantUniverselleTrie[i].montant;
      } else if (gestionListMontantUniverselleTrie[i].unity.toString() ==
              'unity_Montant_universelle.RevenuFixe' ||
          gestionListMontantUniverselleTrie[i].unity.toString() ==
              'unity_Montant_universelle.RevenuPonctuel') {
        montant = montant + gestionListMontantUniverselleTrie[i].montant;
      }
    }

    return montant;
  }

  double montantTotalsLive(
      List<MontantUniverselle> gestionListMontantUniverselleLive) {
    double montant = 0;

    List<MontantUniverselle> gestionListMontantUniverselleLiveTrie =
        gestionListMontantUniverselleLive
            .where((c) => c.previsionsTotal == 0)
            .toList();
    for (var i = gestionListMontantUniverselleLiveTrie.length - 1;
        i >= 0;
        i--) {
      if (gestionListMontantUniverselleLiveTrie[i].unity.toString() ==
              'unity_Montant_universelle.ChargeFixe' ||
          gestionListMontantUniverselleLiveTrie[i].unity.toString() ==
              'unity_Montant_universelle.depensePonctuelle') {
        montant = montant - gestionListMontantUniverselleLiveTrie[i].montant;
      } else if (gestionListMontantUniverselleLiveTrie[i].unity.toString() ==
              'unity_Montant_universelle.RevenuFixe' ||
          gestionListMontantUniverselleLiveTrie[i].unity.toString() ==
              'unity_Montant_universelle.RevenuPonctuel') {
        montant = montant + gestionListMontantUniverselleLiveTrie[i].montant;
      }
    }

    return montant;
  }

  // Widget header(
  //     double montantCharge,
  //     double montantChargeLive,
  //     double montantRevenu,
  //     double montantRevenuLive,
  //     double montantTotals,
  //     double montantTotalsLive,
  //     BuildContext context,
  //     String idGestionMontantUniverselle,
  //     EasyController variable,
  //     int indexMontantUniverselle,
  //     List<MontantUniverselle> _listMontantUniverselle,
  //     List<MontantUniverselle> _listMontantUniverselleLive,
  //     bool simuOuchargeFixe) {
  //   Widget headers = Container(
  //     alignment: Alignment.center,
  //     child: Padding(
  //       padding: const EdgeInsets.only(top: 60.0, right: 10, left: 10),
  //       child: FlipCard(
  //         speed: 400,
  //         flipOnTouch: true,
  //         fill: Fill
  //             .fillBack, // Fill the back side of the card to make in the same size as the front.
  //         direction: FlipDirection.HORIZONTAL, // default
  //         front: Container(
  //           decoration: BoxDecoration(
  //             color: Colors.white,
  //             borderRadius: BorderRadius.circular(10),
  //           ),
  //           child: Column(
  //             children: [
  //               Row(
  //                 mainAxisAlignment: MainAxisAlignment.spaceAround,
  //                 children: [
  //                   Column(
  //                     children: [
  //                       Card(
  //                         color: Colors.transparent,
  //                         shape: RoundedRectangleBorder(
  //                           borderRadius: BorderRadius.circular(5.0),
  //                         ),
  //                         elevation: 25.0,
  //                         child: Container(
  //                           decoration: BoxDecoration(
  //                               borderRadius: BorderRadius.circular(10),
  //                               color: Colors.white),
  //                           child: Padding(
  //                               padding: const EdgeInsets.all(8.0),
  //                               child: Text(
  //                                 "Transactions à venir".toUpperCase(),
  //                                 style: TextStyle(
  //                                     fontSize: 12,
  //                                     color: Colors.black,
  //                                     fontWeight: FontWeight.bold),
  //                                 textAlign: TextAlign.center,
  //                               )),
  //                         ),
  //                       ),
  //                       Container(
  //                         padding: EdgeInsets.all(8),
  //                         width: 80,
  //                         height: 80,
  //                         child: FlutterPieChart(
  //                           pies: [
  //                             Pie(
  //                                 color: Colors.red.shade500,
  //                                 proportion: montantCharge),
  //                             Pie(
  //                                 color: Colors.green.shade500,
  //                                 proportion: montantRevenu),
  //                             Pie(
  //                                 color: montantCharge > montantRevenu
  //                                     ? Colors.red.shade900
  //                                     : Colors.green.shade900,
  //                                 proportion: montantTotals > 0
  //                                     ? montantTotals
  //                                     : -montantTotals),
  //                           ],
  //                           selected: 2,
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                   Padding(
  //                     padding: const EdgeInsets.only(right: 27, top: 17),
  //                     child: Column(
  //                       mainAxisAlignment: MainAxisAlignment.center,
  //                       children: <Widget>[
  //                         InkWell(
  //                           splashColor: Colors.white,
  //                           onTap: () {
  //                             Navigator.push(
  //                                 context,
  //                                 WaveTransition(
  //                                     center: FractionalOffset(0.90, 0.90),
  //                                     duration: Duration(milliseconds: 1000),
  //                                     child: ChangeNotifierProvider.value(
  //                                         value: variable,
  //                                         child: GestionMensuelLiveResultats(
  //                                           idGestionMontantUniverselle:
  //                                               idGestionMontantUniverselle,
  //                                           indexMontantUniverselle:
  //                                               indexMontantUniverselle,
  //                                         ))));
  //                           },
  //                           child: Icon(
  //                             Icons.settings,
  //                             size: 30,
  //                             color: Colors.black,
  //                           ),
  //                         ), // icon
  //                         Text(
  //                           "Transactions passées",
  //                           style: TextStyle(fontSize: 12, color: Colors.black),
  //                         ), // text
  //                       ],
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //               Row(
  //                 mainAxisAlignment: MainAxisAlignment.spaceAround,
  //                 children: [
  //                   ScreenIndicatorMontantGestionLive(
  //                     titre: 'Prévisons charges',
  //                     icones: Icons.arrow_circle_up,
  //                     gestionListMontantUniverselle: _listMontantUniverselle,
  //                     gestionListMontantUniverselleLive:
  //                         _listMontantUniverselleLive,
  //                     titre1: 'Charges',
  //                     titre2: 'CHARGE',
  //                     montantCharge: montantCharge,
  //                     montantChargeLive: montantChargeLive,
  //                     montantRevenu: montantRevenu,
  //                     montantRevenuLive: montantRevenuLive,
  //                     montantTotals: montantTotals,
  //                     montantTotalsLive: montantTotalsLive,
  //                   ),
  //                   ScreenIndicatorMontantGestionLive(
  //                     montantCharge: montantCharge,
  //                     montantChargeLive: montantChargeLive,
  //                     montantRevenu: montantRevenu,
  //                     montantRevenuLive: montantRevenuLive,
  //                     montantTotals: montantTotals,
  //                     montantTotalsLive: montantTotalsLive,
  //                     titre: 'Prévisions revenus',
  //                     icones: Icons.arrow_circle_down,
  //                     gestionListMontantUniverselle: _listMontantUniverselle,
  //                     gestionListMontantUniverselleLive:
  //                         _listMontantUniverselleLive,
  //                     titre2: 'REVENUS',
  //                     titre1: 'Revenus',
  //                   ),
  //                   ScreenIndicatorMontantGestionLive(
  //                     montantCharge: montantCharge,
  //                     montantChargeLive: montantChargeLive,
  //                     montantRevenu: montantRevenu,
  //                     montantRevenuLive: montantRevenuLive,
  //                     montantTotals: montantTotals,
  //                     montantTotalsLive: montantTotalsLive,
  //                     titre: 'Prévision  solde',
  //                     icones: Icons.calculate_outlined,
  //                     gestionListMontantUniverselle: _listMontantUniverselle,
  //                     gestionListMontantUniverselleLive:
  //                         _listMontantUniverselleLive,
  //                     titre1: 'Solde',
  //                     titre2: 'SOLDE',
  //                   ),
  //                 ],
  //               ),
  //             ],
  //           ),
  //         ),
  //         back: Container(
  //           decoration: BoxDecoration(
  //             color: Colors.white,
  //             borderRadius: BorderRadius.circular(10),
  //           ),
  //           child: Column(
  //             children: [
  //               Row(
  //                 mainAxisAlignment: MainAxisAlignment.spaceAround,
  //                 children: [
  //                   Column(
  //                     children: [
  //                       Card(
  //                         color: Colors.transparent,
  //                         shape: RoundedRectangleBorder(
  //                           borderRadius: BorderRadius.circular(5.0),
  //                         ),
  //                         elevation: 25.0,
  //                         child: Container(
  //                           decoration: BoxDecoration(
  //                               borderRadius: BorderRadius.circular(10),
  //                               color: Colors.white),
  //                           child: Padding(
  //                               padding: const EdgeInsets.all(8.0),
  //                               child: Text(
  //                                 " Transactions validées".toUpperCase(),
  //                                 style: TextStyle(
  //                                     fontSize: 12,
  //                                     color: Colors.black,
  //                                     fontWeight: FontWeight.bold),
  //                                 textAlign: TextAlign.center,
  //                               )),
  //                         ),
  //                       ),
  //                       Container(
  //                         padding: EdgeInsets.all(8),
  //                         width: 80,
  //                         height: 80,
  //                         child: FlutterPieChart(
  //                           pies: [
  //                             Pie(
  //                                 color: Colors.red.shade500,
  //                                 proportion: montantChargeLive),
  //                             Pie(
  //                                 color: Colors.green.shade500,
  //                                 proportion: montantRevenuLive),
  //                             Pie(
  //                                 color: montantChargeLive > montantRevenuLive
  //                                     ? Colors.red.shade900
  //                                     : Colors.green.shade900,
  //                                 proportion: montantTotalsLive > 0
  //                                     ? montantTotalsLive
  //                                     : -montantTotalsLive),
  //                           ],
  //                           selected: 2,
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                   Container(
  //                     margin: EdgeInsets.only(top: 1),
  //                     width: MediaQuery.of(context).size.width / 3.2,
  //                     height: 150,
  //                     child: Container(
  //                       decoration: BoxDecoration(
  //                         border: Border.all(color: Colors.white70),
  //                         color: Colors.transparent,
  //                         borderRadius: BorderRadius.circular(10),
  //                       ),
  //                       child: Center(
  //                         child: Column(
  //                           mainAxisAlignment: MainAxisAlignment.center,
  //                           children: <Widget>[
  //                             Card(
  //                               color: Colors.transparent,
  //                               shape: RoundedRectangleBorder(
  //                                 borderRadius: BorderRadius.circular(5.0),
  //                               ),
  //                               elevation: 25.0,
  //                               child: Container(
  //                                 decoration: BoxDecoration(
  //                                     borderRadius: BorderRadius.circular(10),
  //                                     color: Colors.white),
  //                                 child: Padding(
  //                                     padding: const EdgeInsets.all(8.0),
  //                                     child: Text(
  //                                       "Estimation".toUpperCase(),
  //                                       style: TextStyle(
  //                                           fontSize: 12,
  //                                           color: Colors.black,
  //                                           fontWeight: FontWeight.bold),
  //                                       textAlign: TextAlign.center,
  //                                     )),
  //                               ),
  //                             ),
  //                             Icon(
  //                               Icons.calculate,
  //                               size: 30,
  //                               color: baterry
  //                                   ? Colors.green.shade900
  //                                   : Colors.red.shade900,
  //                             ),
  //                             Card(
  //                               shape: RoundedRectangleBorder(
  //                                 borderRadius: BorderRadius.circular(5.0),
  //                               ),
  //                               elevation: 5.0,
  //                               color: baterry
  //                                   ? Colors.green.shade900
  //                                   : Colors.red.shade900,
  //                               child: Padding(
  //                                 padding: const EdgeInsets.all(3.0),
  //                                 child: Text(
  //                                   "Solde",
  //                                   style: TextStyle(
  //                                       fontSize: 13,
  //                                       color: Colors.black,
  //                                       fontWeight: FontWeight.bold),
  //                                   textAlign: TextAlign.center,
  //                                 ),
  //                               ),
  //                             ),
  //                             Card(
  //                               color: Colors.orange,
  //                               shape: RoundedRectangleBorder(
  //                                 borderRadius: BorderRadius.circular(10.0),
  //                               ),
  //                               elevation: 25.0,
  //                               child: Container(
  //                                 decoration: BoxDecoration(
  //                                     borderRadius: BorderRadius.circular(10),
  //                                     color: Colors.white),
  //                                 child: Padding(
  //                                   padding: const EdgeInsets.all(8.0),
  //                                   child: Text(
  //                                     soldeLive(montantTotals,
  //                                                 montantTotalsLive)
  //                                             .toStringAsFixed(2) +
  //                                         " \$",
  //                                     style: TextStyle(
  //                                         fontSize: 13,
  //                                         color: baterry
  //                                             ? Colors.green.shade900
  //                                             : Colors.red.shade900,
  //                                         fontWeight: FontWeight.bold),
  //                                     textAlign: TextAlign.center,
  //                                   ),
  //                                 ),
  //                               ),
  //                             ), // text
  //                           ],
  //                         ),
  //                       ),
  //                     ),
  //                   ),

  //                 ],
  //               ),
  //               Row(
  //                 mainAxisAlignment: MainAxisAlignment.spaceAround,
  //                 children: [
  //                   ScreenIndicatorMontantGestionLive(
  //                     montantCharge: montantCharge,
  //                     montantChargeLive: montantChargeLive,
  //                     montantRevenu: montantRevenu,
  //                     montantRevenuLive: montantRevenuLive,
  //                     montantTotals: montantTotals,
  //                     montantTotalsLive: montantTotalsLive,
  //                     titre: "Charge Live",
  //                     icones: Icons.arrow_circle_up,
  //                     gestionListMontantUniverselle: _listMontantUniverselle,
  //                     gestionListMontantUniverselleLive:
  //                         _listMontantUniverselleLive,
  //                     titre1: 'Charges',
  //                     titre2: 'Charge Live',
  //                   ),
  //                   ScreenIndicatorMontantGestionLive(
  //                     montantCharge: montantCharge,
  //                     montantChargeLive: montantChargeLive,
  //                     montantRevenu: montantRevenu,
  //                     montantRevenuLive: montantRevenuLive,
  //                     montantTotals: montantTotals,
  //                     montantTotalsLive: montantTotalsLive,
  //                     titre: "Revenu live",
  //                     icones: Icons.arrow_circle_down,
  //                     gestionListMontantUniverselle: _listMontantUniverselle,
  //                     gestionListMontantUniverselleLive:
  //                         _listMontantUniverselleLive,
  //                     titre2: 'REVENUS',
  //                     titre1: 'Revenus',
  //                   ),
  //                   ScreenIndicatorMontantGestionLive(
  //                     montantCharge: montantCharge,
  //                     montantChargeLive: montantChargeLive,
  //                     montantRevenu: montantRevenu,
  //                     montantRevenuLive: montantRevenuLive,
  //                     montantTotals: montantTotals,
  //                     montantTotalsLive: montantTotalsLive,
  //                     titre: "Solde live",
  //                     icones: Icons.calculate_outlined,
  //                     gestionListMontantUniverselle: _listMontantUniverselle,
  //                     gestionListMontantUniverselleLive:
  //                         _listMontantUniverselleLive,
  //                     titre1: 'Solde',
  //                     titre2: 'SOLDE',
  //                   ),
  //                 ],
  //               ),
  //             ],
  //           ),
  //         ),
  //       ),
  //     ),
  //     decoration: BoxDecoration(
  //         gradient: LinearGradient(
  //             begin: Alignment.centerLeft,
  //             end: Alignment.centerRight,
  //             colors: <Color>[Colors.orange, Colors.blueAccent])),
  //   );
  //   return headers;
  // }

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
      montant = Colors.blue.shade500;
    } else if (titre == "Prévisions revenus" ||
        titre == 'revenus restants' ||
        titre1 == 'Revenu live') {
      montant = Colors.green.shade500;
    } else if (titre == "Prévisons charges" ||
        titre == "Restantes" ||
        titre1 == "Charge Live") {
      montant = Colors.red.shade500;
    }

    return montant;
  }

  Widget activeGlow(
      double active,
      int indexGestionMensuel,
      MontantUniverselle gestion,
      BuildContext context,
      int index,
      MontantUniverselle item,
      EasyController variable,
      int icon,
      GlobalKey<FormState> formKey,
      CurrencyTextFieldController controller) {
    Widget glow = Padding(
      padding: const EdgeInsets.all(1.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          // color: colorsDescription(gestion.unity.toString()),
        ),
        child: Card(
          color: active == 0 ? Colors.white : Colors.grey,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          elevation: 15.0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                    padding: EdgeInsets.all(2),
                    onPressed: () {
                      displayTextInputDialog(indexGestionMensuel, context,
                          index, item, variable, icon, formKey, controller);
                    },
                    icon: Icon(
                      Icons.edit,
                      size: 17,
                    )),
                // InkWell(onTap: ,
                //   child: Icon(Icons.edit)),
                Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 1.72,
                      height: 25.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          maxLetterTitre(gestion.nom.toUpperCase(), context),
                          SizedBox(
                            width: 15.0,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 1.72,
                      height: 30.0,
                      child: Row(
                        children: [
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
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            gestion.montant.toStringAsFixed(2) + " \$",
                            style: TextStyle(
                              color:
                                  colorsDescription(gestion.unity.toString()),
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Card(
                  color: active == 0 ? Colors.white : Colors.grey,
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

  Color colorsDescription(String description) {
    Color colors = Colors.black;
    if (description == "unity_Montant_universelle.ChargeFixe") {
      colors = Colors.red.shade500;
      return colors;
    } else if (description == "unity_Montant_universelle.depensePonctuelle") {
      colors = Colors.red.shade500;
      return colors;
    } else if (description == "unity_Montant_universelle.RevenuFixe") {
      colors = Colors.green.shade500;
      return colors;
    } else if (description == "unity_Montant_universelle.RevenuPonctuel") {
      colors = Colors.green.shade500;
      return colors;
    }
    return colors;
  }

  Widget maxLetterTitre(String word, BuildContext context) {
    Widget longLetter;

    String word2;
    if (word.length > 25) {
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

  Future<void> displayTextInputDialog(
      int indexGestionMensuel,
      BuildContext context,
      int index,
      MontantUniverselle item,
      EasyController variable,
      int icon,
      GlobalKey<FormState> formKey,
      CurrencyTextFieldController controller) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            scrollable: true,
            title: Text('Modification'),
            content: Form(
              key: formKey,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                ),
                height: 450,
                width: double.maxFinite,
                child: ListView(
                  children: [
                    formfieldDropDown(formKey, controller),
                    ChangeNotifierProvider.value(
                      value: variable,
                      child: TransactionEdit(
                        icon: icon,
                        indexGestion: index,
                        item: item,
                        typeMontantUniv: '',
                        indexGestionMensuel: indexGestionMensuel,
                      ),
                    )
                  ],
                ),
              ),
            ),
            actions: <Widget>[
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.cancel),
                iconSize: 35,
              ),
              IconButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    if (valueText3.isNotEmpty) {
                      variable.changeTitreGestionMensuel(
                          indexGestionMensuel: indexGestionMensuel,
                          indexGestion: index,
                          nom: valueText3);
                    }
                    if (valueText4.isNotEmpty) {
                      variable.changePrixGestionMensuel(
                          indexGestionMensuel: indexGestionMensuel,
                          indexGestion: index,
                          montant: valueText4);
                    }

                    Navigator.pop(context);
                  }
                },
                icon: Icon(Icons.check),
                iconSize: 35,
              ),
            ],
          );
        });
  }

  Widget formfieldDropDown(
      GlobalKey<FormState> formKey, CurrencyTextFieldController controller) {
    return Column(
      children: [
        TextFormField(
          textCapitalization: TextCapitalization.sentences,
          onSaved: (value) {
            valueText3 = value!;
          },
          validator: (value) {
            if (value!.isEmpty) {
              return "Merci d'entrer un nouveau titre ";
            }
            return null;
          },
          decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 2.0, color: Colors.blueAccent),
                  borderRadius: BorderRadius.circular(15.0)),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1.0, color: Colors.blueAccent),
                  borderRadius: BorderRadius.circular(15.0)),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              labelText: "Modifier titre",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0))),
        ),
        SizedBox(
          height: 15.0,
        ),
        TextFormField(
          controller: controller,
          textCapitalization: TextCapitalization.sentences,
          onSaved: (value) {
            valueText4 = controller.doubleValue.toString();
          },
          validator: (value) {
            if (value!.isEmpty) {
              return "Merci d'entrer un nouveau prix ";
            }
            return null;
          },
          decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 2.0, color: Colors.blueAccent),
                  borderRadius: BorderRadius.circular(15.0)),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1.0, color: Colors.blueAccent),
                  borderRadius: BorderRadius.circular(15.0)),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              labelText: "Modifier prix",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0))),
        ),
      ],
    );
  }
}
