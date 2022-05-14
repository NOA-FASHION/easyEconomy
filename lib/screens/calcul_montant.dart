import 'package:currency_textfield/currency_textfield.dart';
import 'package:easyeconomy/controllers/easy_Controller.dart';
import 'package:easyeconomy/models/easy_economy_models.dart';
import 'package:easyeconomy/screens/screen_indicateur_montant.dart';
import 'package:easyeconomy/screens/transaction_edit.dart';
import 'package:flutter/material.dart';
import 'package:marquee_text/marquee_text.dart';
import 'package:multi_charts/multi_charts.dart';
import 'package:provider/provider.dart';

class CalculMontant {
  String valueText3 = '';
  String valueText4 = '';
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

  Widget activeGlow1(MontantUniverselle gestion, BuildContext context) {
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
                      width: MediaQuery.of(context).size.width / 1.80,
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
                            gestion.montant.toStringAsFixed(2) + " €",
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

  Widget activeGlow(
    bool modifNamePrix,
      MontantUniverselle gestion,
      BuildContext context,
      int index,
      MontantUniverselle item,
      EasyController variable,
      int icon,
      GlobalKey<FormState> formKey,
      String valueText,
      String valueText2,
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
                      displayTextInputDialog(context, index, item, variable,
                          icon, formKey, valueText, valueText2, controller);
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
                            gestion.montant.toStringAsFixed(2) + " €",
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

  Future<void> displayTextInputDialog(
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
                        typeMontantUniv: 'chargeFixe',
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
                      variable.changeTitreSimulation(
                          indexGestion: index, nom: valueText3);
                    }
                    if (valueText4.isNotEmpty) {
                      variable.changePrixSimulation(
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
