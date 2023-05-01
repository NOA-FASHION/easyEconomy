import 'package:currency_textfield/currency_textfield.dart';
import 'package:easyeconomy/controllers/easy_Controller.dart';
import 'package:easyeconomy/models/easy_economy_models.dart';
import 'package:easyeconomy/screens/cacul_montant_widget.dart';
import 'package:easyeconomy/screens/gestion_mensuel_live_resultats.dart';
import 'package:easyeconomy/screens/screen_indicator_montant_gestionMensuel_live.dart';
import 'package:easyeconomy/screens/transaction_edit.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pie_chart/flutter_pie_chart.dart';

import 'package:provider/provider.dart';

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
      setState(() {
        baterry = true;
      });
    } else {
      setState(() {
        baterry = false;
      });
    }

    return montant;
  }

  @override
  Widget build(BuildContext context) {
    double montantTotal =
        soldeLive(widget.montantTotals, widget.montantTotalsLive);
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
                      ],
                    ),
                    TransactionPasse(
                      idGestionMontantUniverselle:
                          widget.idGestionMontantUniverselle,
                      indexMontantUniverselle: widget.indexMontantUniverselle,
                      variable: widget.variable,
                    ),
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
                        Transaction(
                          transaction: "Transactions validées",
                        ),
                        PieChart(
                          montantCharge: widget.montantChargeLive,
                          montantRevenu: widget.montantRevenuLive,
                          montantTotals: widget.montantTotalsLive,
                        ),
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
                                soldeLive: montantTotal,
                              ),
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
              proportion: montantTotals > 0 ? montantTotals : -montantTotals),
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
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ChangeNotifierProvider.value(
                      value: variable,
                      child: GestionMensuelLiveResultats(
                        idGestionMontantUniverselle:
                            idGestionMontantUniverselle,
                        indexMontantUniverselle: indexMontantUniverselle,
                      ))));
              // Navigator.push(
              //     context,
              //     PageTransition(
              //         duration: const Duration(milliseconds: 1300),
              //         child: ChangeNotifierProvider.value(
              //             value: variable,
              //             child: GestionMensuelLiveResultats(
              //               idGestionMontantUniverselle:
              //                   idGestionMontantUniverselle,
              //               indexMontantUniverselle: indexMontantUniverselle,
              //             )),
              //         type: PageTransitionType.rightToLeftWithFade));
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
            soldeLive.toStringAsFixed(2) + " \$",
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

class ActiveGlowWidget2 extends StatefulWidget {
  final double active;
  final int indexGestionMensuel;
  final MontantUniverselle gestion;
  final BuildContext context;
  final int index;
  final MontantUniverselle item;
  final EasyController variable;
  final int icon;
  final GlobalKey<FormState> formKey;
  final CurrencyTextFieldController controller;
  ActiveGlowWidget2(
      {Key? key,
      required this.active,
      required this.indexGestionMensuel,
      required this.gestion,
      required this.context,
      required this.index,
      required this.item,
      required this.variable,
      required this.icon,
      required this.formKey,
      required this.controller})
      : super(key: key);

  @override
  State<ActiveGlowWidget2> createState() => _ActiveGlowWidget2State();
}

class _ActiveGlowWidget2State extends State<ActiveGlowWidget2> {
  String valueText3 = '';
  String valueText4 = '';
  String unityPattern = "unity_Montant_universelle.";
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          // color: colorsDescription(gestion.unity.toString()),
        ),
        child: Card(
          color: widget.active == 0 ? Colors.white : Colors.grey,
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
                      displayTextInputDialog(
                          widget.indexGestionMensuel,
                          context,
                          widget.index,
                          widget.item,
                          widget.variable,
                          widget.icon,
                          widget.formKey,
                          widget.controller);
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
                          maxLetterTitre(
                              widget.gestion.nom.toUpperCase(), context),
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
                            color: colorsDescription(
                                widget.gestion.unity.toString()),
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Text(
                                widget.gestion.unity
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
                            widget.gestion.montant.toStringAsFixed(2) + " \$",
                            style: TextStyle(
                              color: colorsDescription(
                                  widget.gestion.unity.toString()),
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
                  color: widget.active == 0 ? Colors.white : Colors.grey,
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
                            IconData(widget.gestion.icones,
                                fontFamily: 'MaterialIcons'),
                            color: colorsDescription(
                                widget.gestion.unity.toString()),
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
