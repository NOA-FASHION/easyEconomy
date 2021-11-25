import 'package:easyeconomy/models/easy_economy_models.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

class ScreenIndicatorMontantGestionLive extends StatefulWidget {
  final String titre;
  final String titre1;
  final IconData icones;
  final List<MontantUniverselle> gestionListMontantUniverselle;
  final List<MontantUniverselle> gestionListMontantUniverselleLive;
  ScreenIndicatorMontantGestionLive(
      {required this.titre,
      required this.titre1,
      required this.gestionListMontantUniverselle,
      required this.icones,
      required this.gestionListMontantUniverselleLive,
      List<MontantUniverselle>? listMontantUniverselle,
      List<MontantUniverselle>? listMontantPrevision});

  @override
  _ScreenIndicatorMontantGestionLiveState createState() =>
      _ScreenIndicatorMontantGestionLiveState();
}

class _ScreenIndicatorMontantGestionLiveState
    extends State<ScreenIndicatorMontantGestionLive> {
  double montantCharge() {
    double montants = 0;

    for (var i = widget.gestionListMontantUniverselle.length - 1; i >= 0; i--) {
      if (widget.gestionListMontantUniverselle[i].unity.toString() ==
              'unity_Montant_universelle.ChargeFixe' ||
          widget.gestionListMontantUniverselle[i].unity.toString() ==
              'unity_Montant_universelle.depensePonctuelle') {
        montants = montants + widget.gestionListMontantUniverselle[i].montant;
      }
    }
    return montants;
  }

  double montantChargeLive() {
    double montants = 0;

    for (var i = widget.gestionListMontantUniverselleLive.length - 1;
        i >= 0;
        i--) {
      print(widget.gestionListMontantUniverselleLive[i].unity.toString());
      if (widget.gestionListMontantUniverselleLive[i].unity.toString() ==
              'unity_Montant_universelle.ChargeFixe' ||
          widget.gestionListMontantUniverselleLive[i].unity.toString() ==
              'unity_Montant_universelle.depensePonctuelle') {
        montants =
            montants + widget.gestionListMontantUniverselleLive[i].montant;
      }
    }

    return montants;
  }

  double montantRevenu() {
    double montants = 0;
    for (var i = widget.gestionListMontantUniverselle.length - 1; i >= 0; i--) {
      if (widget.gestionListMontantUniverselle[i].unity.toString() ==
              'unity_Montant_universelle.RevenuFixe' ||
          widget.gestionListMontantUniverselle[i].unity.toString() ==
              'unity_Montant_universelle.RevenuPonctuel') {
        montants = montants + widget.gestionListMontantUniverselle[i].montant;
      }
    }

    return montants;
  }

  double montantRevenuLive() {
    double montants = 0;

    for (var i = widget.gestionListMontantUniverselleLive.length - 1;
        i >= 0;
        i--) {
      if (widget.gestionListMontantUniverselleLive[i].unity.toString() ==
              'unity_Montant_universelle.RevenuFixe' ||
          widget.gestionListMontantUniverselleLive[i].unity.toString() ==
              'unity_Montant_universelle.RevenuPonctuel') {
        montants =
            montants + widget.gestionListMontantUniverselleLive[i].montant;
      }
    }
    return montants;
  }

  double montantTotals() {
    double montant = 0;
    for (var i = widget.gestionListMontantUniverselle.length - 1; i >= 0; i--) {
      if (widget.gestionListMontantUniverselle[i].unity.toString() ==
              'unity_Montant_universelle.ChargeFixe' ||
          widget.gestionListMontantUniverselle[i].unity.toString() ==
              'unity_Montant_universelle.depensePonctuelle') {
        montant = montant - widget.gestionListMontantUniverselle[i].montant;
      } else if (widget.gestionListMontantUniverselle[i].unity.toString() ==
              'unity_Montant_universelle.RevenuFixe' ||
          widget.gestionListMontantUniverselle[i].unity.toString() ==
              'unity_Montant_universelle.RevenuPonctuel') {
        montant = montant + widget.gestionListMontantUniverselle[i].montant;
      }
    }

    return montant;
  }

  double montantTotalsLive() {
    double montant = 0;

    for (var i = widget.gestionListMontantUniverselleLive.length - 1;
        i >= 0;
        i--) {
      if (widget.gestionListMontantUniverselleLive[i].unity.toString() ==
              'unity_Montant_universelle.ChargeFixe' ||
          widget.gestionListMontantUniverselleLive[i].unity.toString() ==
              'unity_Montant_universelle.depensePonctuelle') {
        montant = montant - widget.gestionListMontantUniverselleLive[i].montant;
      } else if (widget.gestionListMontantUniverselleLive[i].unity.toString() ==
              'unity_Montant_universelle.RevenuFixe' ||
          widget.gestionListMontantUniverselleLive[i].unity.toString() ==
              'unity_Montant_universelle.RevenuPonctuel') {
        montant = montant + widget.gestionListMontantUniverselleLive[i].montant;
      }
    }

    return montant;
  }

  String choixMontant() {
    String montant = '0';

    if (widget.titre == "Prévision  solde" ||
        widget.titre == 'Transactions restantes') {
      montant = montantTotals().toStringAsFixed(2);
    } else if (widget.titre == "Prévisions revenus" ||
        widget.titre == 'revenus restants') {
      montant = montantRevenu().toStringAsFixed(2);
    } else if (widget.titre == "Prévisons charges" ||
        widget.titre == "Charges restantes") {
      montant = montantCharge().toStringAsFixed(2);
    }

    return montant;
  }

  String choixMontantLive() {
    String montant = '0';

    if (widget.titre1 == "Solde         validé") {
      montant = montantTotalsLive().toStringAsFixed(2);
    } else if (widget.titre1 == "Revenus validés") {
      montant = montantRevenuLive().toStringAsFixed(2);
    } else if (widget.titre1 == "Charges validées") {
      montant = montantChargeLive().toStringAsFixed(2);
    }

    return montant;
  }

  Color choixColors() {
    Color montant = Colors.white;

    if (widget.titre == "Prévision  solde" ||
        widget.titre == 'Transactions restantes' ||
        widget.titre1 == "Solde         validé") {
      montant = Colors.white;
    } else if (widget.titre == "Prévisions revenus" ||
        widget.titre == 'revenus restants' ||
        widget.titre1 == "Revenus validés") {
      montant = Colors.green.shade900;
    } else if (widget.titre == "Prévisons charges" ||
        widget.titre == "Charges restantes" ||
        widget.titre1 == "Charges validées") {
      montant = Colors.red.shade900;
    }

    return montant;
  }

  String soldeLive() {
    double montant = 0;

    montant = montantTotals() + montantTotalsLive();

    return montant.toStringAsFixed(2);
  }

  bool flipCardTest() {
    bool flip = true;
    if (montantTotalsLive() > 0 && widget.titre1 == "Solde         validé") {
      flip = true;
    } else {
      flip = false;
    }
    return flip;
  }

  @override
  Widget build(BuildContext context) {
    return FlipCard(
      flipOnTouch: flipCardTest(),
      fill: Fill
          .fillBack, // Fill the back side of the card to make in the same size as the front.
      direction: FlipDirection.HORIZONTAL, // default
      front: Container(
        width: MediaQuery.of(context).size.width / 3.2,
        height: 230,
        child: Card(
            color: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            elevation: 25.0,
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white70),
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [Colors.blueAccent, Colors.orange])),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    // icon
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        widget.titre,
                        style: TextStyle(
                            fontSize: 13,
                            color: choixColors(),
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
                            border: Border.all(color: Colors.white70),
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [Colors.orange, Colors.blueAccent])),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            choixMontant(),
                            style: TextStyle(
                                fontSize: 13,
                                color: choixColors(),
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    Icon(
                      widget.icones,
                      size: 30,
                      color: choixColors(),
                    ),
                    Card(
                      color: Colors.orange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      elevation: 25.0,
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white70),
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [Colors.orange, Colors.blueAccent])),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            choixMontantLive(),
                            style: TextStyle(
                                fontSize: 13,
                                color: choixColors(),
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        widget.titre1,
                        style: TextStyle(
                            fontSize: 13,
                            color: choixColors(),
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    // text
                  ],
                ),
              ),
            )),
      ),
      back: Container(
        width: MediaQuery.of(context).size.width / 3.2,
        height: 220,
        child: Card(
            color: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            elevation: 25.0,
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white70),
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [Colors.blueAccent, Colors.orange])),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    // icon
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Prévision  solde",
                        style: TextStyle(
                            fontSize: 13,
                            color: choixColors(),
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),

                    Icon(
                      widget.icones,
                      size: 30,
                      color: choixColors(),
                    ),
                    Card(
                      color: Colors.orange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      elevation: 25.0,
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white70),
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [Colors.orange, Colors.blueAccent])),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            soldeLive(),
                            style: TextStyle(
                                fontSize: 13,
                                color: choixColors(),
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),

                    // text
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
