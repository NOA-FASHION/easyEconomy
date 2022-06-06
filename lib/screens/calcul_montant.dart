import 'package:currency_textfield/currency_textfield.dart';
import 'package:easyeconomy/controllers/easy_Controller.dart';
import 'package:easyeconomy/models/easy_economy_models.dart';
import 'package:easyeconomy/screens/screen_indicateur_montant.dart';
// import 'package:easyeconomy/screens/screen_indicateur_montant.dart';

import 'package:easyeconomy/screens/transaction_edit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pie_chart/flutter_pie_chart.dart';
// import 'package:flutter_pie_chart/flutter_pie_chart.dart';
import 'package:marquee_text/marquee_text.dart';

import 'package:provider/provider.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
// import 'package:top_snackbar_flutter/custom_snack_bar.dart';
// import 'package:top_snackbar_flutter/top_snack_bar.dart';

class CalculMontant {
  String valueText3 = '';
  String valueText4 = '';
  String unityPattern = "unity_Montant_universelle.";
  Future<Null> delay(int milliseconds) {
    return new Future.delayed(new Duration(milliseconds: milliseconds));
  }

  double montantTotals(List<MontantUniverselle> listMontantUniverselle,
      List<MontantUniverselle> listMontantPrevision, bool simuOuchargeFixe) {
    List<MontantUniverselle> listMontantPrevisionTrie =
        listMontantPrevision.where((c) => c.previsionsTotal == 0).toList();
    List<MontantUniverselle> listMontantUniverselleTrie =
        listMontantUniverselle.where((c) => c.previsionsTotal == 0).toList();
    double montant = 0;
    if (!simuOuchargeFixe) {
      for (var i = listMontantUniverselleTrie.length - 1; i >= 0; i--) {
        if (listMontantUniverselleTrie[i].unity.toString() ==
            'unity_Montant_universelle.ChargeFixe') {
          montant = montant - listMontantUniverselleTrie[i].montant;
        } else if (listMontantUniverselleTrie[i].unity.toString() ==
            'unity_Montant_universelle.RevenuFixe') {
          montant = montant + listMontantUniverselleTrie[i].montant;
        }
      }
    } else if (simuOuchargeFixe) {
      for (var i = listMontantPrevisionTrie.length - 1; i >= 0; i--) {
        if (listMontantPrevisionTrie[i].unity.toString() ==
                'unity_Montant_universelle.ChargeFixe' ||
            listMontantPrevisionTrie[i].unity.toString() ==
                'unity_Montant_universelle.depensePonctuelle') {
          montant = montant - listMontantPrevisionTrie[i].montant;
        } else if (listMontantPrevisionTrie[i].unity.toString() ==
                'unity_Montant_universelle.RevenuFixe' ||
            listMontantPrevisionTrie[i].unity.toString() ==
                'unity_Montant_universelle.RevenuPonctuel') {
          montant = montant + listMontantPrevisionTrie[i].montant;
        }
      }
    }

    return montant;
  }

  double montantCharges(List<MontantUniverselle> listMontantUniverselle,
      List<MontantUniverselle> listMontantPrevision, bool simuOuchargeFixe) {
    List<MontantUniverselle> listMontantPrevisionTrie =
        listMontantPrevision.where((c) => c.previsionsTotal == 0).toList();
    List<MontantUniverselle> listMontantUniverselleTrie =
        listMontantUniverselle.where((c) => c.previsionsTotal == 0).toList();
    double montants = 0;
    if (!simuOuchargeFixe) {
      for (var i = listMontantUniverselleTrie.length - 1; i >= 0; i--) {
        // print(listMontantUniverselleTrie[i].unity.toString());
        if (listMontantUniverselleTrie[i].unity.toString() ==
            'unity_Montant_universelle.ChargeFixe') {
          montants = montants + listMontantUniverselleTrie[i].montant;
        }
      }
    } else if (simuOuchargeFixe) {
      for (var i = listMontantPrevisionTrie.length - 1; i >= 0; i--) {
        // print(listMontantPrevisionTrie[i].unity.toString());
        if (listMontantPrevisionTrie[i].unity.toString() ==
                'unity_Montant_universelle.ChargeFixe' ||
            listMontantPrevisionTrie[i].unity.toString() ==
                'unity_Montant_universelle.depensePonctuelle') {
          montants = montants + listMontantPrevisionTrie[i].montant;
        }
      }
    }

    return montants;
  }

  double montantRevenu(List<MontantUniverselle> listMontantUniverselle,
      List<MontantUniverselle> listMontantPrevision, bool simuOuchargeFixe) {
    List<MontantUniverselle> listMontantPrevisionTrie =
        listMontantPrevision.where((c) => c.previsionsTotal == 0).toList();
    List<MontantUniverselle> listMontantUniverselleTrie =
        listMontantUniverselle.where((c) => c.previsionsTotal == 0).toList();
    double montants = 0;
    if (!simuOuchargeFixe) {
      for (var i = listMontantUniverselleTrie.length - 1; i >= 0; i--) {
        if (listMontantUniverselleTrie[i].unity.toString() ==
            'unity_Montant_universelle.RevenuFixe') {
          montants = montants + listMontantUniverselleTrie[i].montant;
        }
      }
    } else if (simuOuchargeFixe) {
      for (var i = listMontantPrevisionTrie.length - 1; i >= 0; i--) {
        if (listMontantPrevisionTrie[i].unity.toString() ==
                'unity_Montant_universelle.RevenuFixe' ||
            listMontantPrevisionTrie[i].unity.toString() ==
                'unity_Montant_universelle.RevenuPonctuel') {
          montants = montants + listMontantPrevisionTrie[i].montant;
        }
      }
    }
    return montants;
  }

  Widget header(
      BuildContext context,
      EasyController variable,
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
                                " Charges Fixes".toUpperCase(),
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              )
                            : Text(
                                !transactionPasse
                                    ? " Simulateur".toUpperCase()
                                    : " Transactions validées".toUpperCase(),
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                      ),
                    ),
                  ),
                  !transactionPasse
                      ? !simuOuchargeFixe
                          ? Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox.fromSize(
                                      size: Size(
                                          50, 50), // button width and height
                                      child: ClipOval(
                                          child: Material(
                                              color: Colors.blue,
                                              child: InkWell(
                                                // splash color
                                                splashColor: Colors.white,
                                                onTap: () {
                                                  variable.uploadChallenge();
                                                },
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    Icon(
                                                      Icons.upload_sharp,
                                                      size: 20,
                                                      color: Colors.white,
                                                    ), // icon
                                                    Text(
                                                      "Upload",
                                                      style: TextStyle(
                                                          fontSize: 10,
                                                          color: Colors.white),
                                                    ), // text
                                                  ],
                                                ),
                                              )))),
                                ),
                                SizedBox.fromSize(
                                    size:
                                        Size(50, 50), // button width and height
                                    child: ClipOval(
                                        child: Material(
                                            color: Colors.blue,
                                            child: InkWell(
                                              // splash color
                                              splashColor: Colors.white,
                                              onTap: () {
                                                variable.writeContent();
                                              }, // button pressed
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: <Widget>[
                                                  Icon(
                                                    Icons.share_rounded,
                                                    size: 20,
                                                    color: Colors.white,
                                                  ), // icon
                                                  Text(
                                                    "partage",
                                                    style: TextStyle(
                                                        fontSize: 10,
                                                        color: Colors.white),
                                                  ), // text
                                                ],
                                              ),
                                            )))),
                              ],
                            )
                          : Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox.fromSize(
                                  size: Size(50, 50), // button width and height
                                  child: ClipOval(
                                      child: Material(
                                          color: Colors.blue,
                                          child: InkWell(
                                            // splash color
                                            splashColor: Colors.white,
                                            onTap: () async {
                                              variable.isLoadingTrue();

                                              await delay(2000);
                                              variable.isLoadingFalse();
                                              showTopSnackBar(
                                                context,
                                                CustomSnackBar.success(
                                                  backgroundColor: Colors.blue,
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
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: <Widget>[
                                                Icon(
                                                  Icons.restore,
                                                  size: 20,
                                                  color: Colors.white,
                                                ), // icon
                                                Text(
                                                  "Reset",
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color: Colors.white),
                                                ), // text
                                              ],
                                            ),
                                          )))),
                            )
                      : SizedBox(
                          width: 1,
                        ),
                  Container(
                    padding: EdgeInsets.all(8),
                    width: 80,
                    height: 80,
                    child: FlutterPieChart(
                      pies: [
                        Pie(
                            color: Colors.red.shade500,
                            proportion: montantChargesDouble),
                        Pie(
                            color: Colors.green.shade500,
                            proportion: montantRevenuDouble),
                        Pie(
                            color: montantChargesDouble > montantRevenuDouble
                                ? Colors.red.shade900
                                : Colors.green.shade900,
                            proportion: montantTotalsDouble > 0
                                ? montantTotalsDouble
                                : -montantTotalsDouble),
                      ],
                      selected: 2,
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

  Color colorsDescription(String description) {
    Color colors = Colors.black;
    if (description == "unity_Montant_universelle.ChargeFixe") {
      colors = Colors.red.shade500;
      return colors;
    } else if (description == "unity_Montant_universelle.depensePonctuelle") {
      colors = Colors.red.shade500;
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

  // Widget activeGlow1(
  //     double active, MontantUniverselle gestion, BuildContext context) {
  //   Widget glow = Padding(
  //     padding: const EdgeInsets.all(1.0),
  //     child: Container(
  //       width: MediaQuery.of(context).size.width,
  //       decoration: BoxDecoration(
  //         borderRadius: BorderRadius.circular(20),
  //         // color: colorsDescription(gestion.unity.toString()),
  //       ),
  //       child: Card(
  //         color: active == 0 ? Colors.white : Colors.grey,
  //         shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.circular(15.0),
  //         ),
  //         elevation: 15.0,
  //         child: Padding(
  //           padding: const EdgeInsets.all(8.0),
  //           child: Row(
  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //             children: [
  //               Column(
  //                 children: [
  //                   Container(
  //                     width: MediaQuery.of(context).size.width / 1.80,
  //                     height: 25.0,
  //                     child: Row(
  //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                       children: [
  //                         maxLetterTitre(gestion.nom.toUpperCase(), context),
  //                         SizedBox(
  //                           width: 15.0,
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //                   Container(
  //                     width: MediaQuery.of(context).size.width / 1.72,
  //                     height: 30.0,
  //                     child: Row(
  //                       children: [
  //                         Card(
  //                           shape: RoundedRectangleBorder(
  //                             borderRadius: BorderRadius.circular(5.0),
  //                           ),
  //                           elevation: 5.0,
  //                           color: colorsDescription(gestion.unity.toString()),
  //                           child: Padding(
  //                             padding: const EdgeInsets.all(3.0),
  //                             child: Text(
  //                               gestion.unity
  //                                   .toString()
  //                                   .replaceAll(unityPattern, "")
  //                                   .toUpperCase(),
  //                               style: TextStyle(
  //                                 fontSize: 12,
  //                                 fontWeight: FontWeight.bold,
  //                               ),
  //                             ),
  //                           ),
  //                         ),
  //                         SizedBox(
  //                           width: 10.0,
  //                         ),
  //                         Text(
  //                           gestion.montant.toStringAsFixed(2) + " €",
  //                           style: TextStyle(
  //                             color:
  //                                 colorsDescription(gestion.unity.toString()),
  //                             fontSize: 13,
  //                             fontWeight: FontWeight.bold,
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //               Card(
  //                 color: active == 0 ? Colors.white : Colors.grey,
  //                 shape: RoundedRectangleBorder(
  //                   borderRadius: BorderRadius.circular(60.0),
  //                 ),
  //                 elevation: 15.0,
  //                 child: Container(
  //                   child: ClipRRect(
  //                       borderRadius: BorderRadius.circular(40.0),
  //                       child: Padding(
  //                         padding: const EdgeInsets.all(3.0),
  //                         child: Icon(
  //                           IconData(gestion.icones,
  //                               fontFamily: 'MaterialIcons'),
  //                           color: colorsDescription(gestion.unity.toString()),
  //                         ),
  //                       )),
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //       ),
  //     ),
  //   );

  //   return glow;
  // }

  // Widget activeGlow(
  //     double active,
  //     bool modifNamePrix,
  //     MontantUniverselle gestion,
  //     BuildContext context,
  //     int index,
  //     MontantUniverselle item,
  //     EasyController variable,
  //     int icon,
  //     GlobalKey<FormState> formKey,
  //     String valueText,
  //     String valueText2,
  //     CurrencyTextFieldController controller) {
  //   Widget glow = Padding(
  //     padding: const EdgeInsets.all(1.0),
  //     child: Container(
  //       width: MediaQuery.of(context).size.width,
  //       decoration: BoxDecoration(
  //         borderRadius: BorderRadius.circular(20),
  //         // color: colorsDescription(gestion.unity.toString()),
  //       ),
  //       child: Card(
  //         color: active == 0 ? Colors.white : Colors.grey,
  //         shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.circular(15.0),
  //         ),
  //         elevation: 15.0,
  //         child: Padding(
  //           padding: const EdgeInsets.all(8.0),
  //           child: Row(
  //             mainAxisAlignment: MainAxisAlignment.start,
  //             children: [
  //               IconButton(
  //                   padding: EdgeInsets.all(2),
  //                   onPressed: () {
  //                     displayTextInputDialog(
  //                         modifNamePrix,
  //                         context,
  //                         index,
  //                         item,
  //                         variable,
  //                         icon,
  //                         formKey,
  //                         valueText,
  //                         valueText2,
  //                         controller);
  //                   },
  //                   icon: const Icon(
  //                     Icons.edit,
  //                     size: 17,
  //                   )),
  //               // InkWell(onTap: ,
  //               //   child: Icon(Icons.edit)),
  //               Column(
  //                 children: [
  //                   Container(
  //                     width: MediaQuery.of(context).size.width / 1.72,
  //                     height: 25.0,
  //                     child: Row(
  //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                       children: [
  //                         maxLetterTitre(gestion.nom.toUpperCase(), context),
  //                         SizedBox(
  //                           width: 15.0,
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //                   Container(
  //                     width: MediaQuery.of(context).size.width / 1.72,
  //                     height: 30.0,
  //                     child: Row(
  //                       children: [
  //                         Card(
  //                           shape: RoundedRectangleBorder(
  //                             borderRadius: BorderRadius.circular(5.0),
  //                           ),
  //                           elevation: 5.0,
  //                           color: colorsDescription(gestion.unity.toString()),
  //                           child: Padding(
  //                             padding: const EdgeInsets.all(3.0),
  //                             child: Text(
  //                               gestion.unity
  //                                   .toString()
  //                                   .replaceAll(unityPattern, "")
  //                                   .toUpperCase(),
  //                               style: TextStyle(
  //                                 fontSize: 12,
  //                                 fontWeight: FontWeight.bold,
  //                               ),
  //                             ),
  //                           ),
  //                         ),
  //                         SizedBox(
  //                           width: 10.0,
  //                         ),
  //                         Text(
  //                           gestion.montant.toStringAsFixed(2) + " €",
  //                           style: TextStyle(
  //                             color:
  //                                 colorsDescription(gestion.unity.toString()),
  //                             fontSize: 13,
  //                             fontWeight: FontWeight.bold,
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //               Card(
  //                 color: active == 0 ? Colors.white : Colors.grey,
  //                 shape: RoundedRectangleBorder(
  //                   borderRadius: BorderRadius.circular(60.0),
  //                 ),
  //                 elevation: 15.0,
  //                 child: Container(
  //                   child: ClipRRect(
  //                       borderRadius: BorderRadius.circular(40.0),
  //                       child: Padding(
  //                         padding: const EdgeInsets.all(3.0),
  //                         child: Icon(
  //                           IconData(gestion.icones,
  //                               fontFamily: 'MaterialIcons'),
  //                           color: colorsDescription(gestion.unity.toString()),
  //                         ),
  //                       )),
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //       ),
  //     ),
  //   );

  //   return glow;
  // }

  Future<void> displayTextInputDialog(
      bool modifNamePrix,
      BuildContext context,
      int index,
      MontantUniverselle item,
      EasyController variable,
      int icon,
      GlobalKey<FormState> formKey,
      String valueText,
      String valueText2,
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
                    formfieldDropDown(
                        formKey, valueText, valueText2, controller),
                    ChangeNotifierProvider.value(
                      value: variable,
                      child: TransactionEdit(
                        icon: icon,
                        indexGestion: index,
                        item: item,
                        typeMontantUniv:
                            modifNamePrix ? "simulator" : 'chargeFixe',
                        indexGestionMensuel: 0,
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
                      modifNamePrix
                          ? variable.changeTitreSimulation(
                              indexGestion: index, nom: valueText3)
                          : variable.changeTitre(
                              indexGestion: index, nom: valueText3);
                    }
                    if (valueText4.isNotEmpty) {
                      modifNamePrix
                          ? variable.changePrixSimulation(
                              indexGestion: index, montant: valueText4)
                          : variable.changePrix(
                              indexGestion: index, montant: valueText4);
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

  Widget formfieldDropDown(GlobalKey<FormState> formKey, String valueText,
      String valueText2, CurrencyTextFieldController controller) {
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
