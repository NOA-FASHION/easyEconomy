import 'package:easyeconomy/models/easy_economy_models.dart';

import 'package:flutter/material.dart';

class ScreenIndicatorMontantGestionLive extends StatefulWidget {
  final double montantCharge;
  final double montantChargeLive;
  final double montantRevenu;
  final double montantRevenuLive;
  final double montantTotals;
  final double montantTotalsLive;
  final String titre;
  final String titre2;
  final String titre1;
  final IconData icones;

  final List<MontantUniverselle> gestionListMontantUniverselle;
  final List<MontantUniverselle> gestionListMontantUniverselleLive;
  ScreenIndicatorMontantGestionLive(
      {required this.titre,
      required this.titre2,
      required this.titre1,
      required this.gestionListMontantUniverselle,
      required this.icones,
      required this.gestionListMontantUniverselleLive,
      List<MontantUniverselle>? listMontantUniverselle,
      List<MontantUniverselle>? listMontantPrevision,
      required this.montantCharge,
      required this.montantChargeLive,
      required this.montantRevenu,
      required this.montantRevenuLive,
      required this.montantTotals,
      required this.montantTotalsLive});

  @override
  _ScreenIndicatorMontantGestionLiveState createState() =>
      _ScreenIndicatorMontantGestionLiveState();
}

class _ScreenIndicatorMontantGestionLiveState
    extends State<ScreenIndicatorMontantGestionLive> {
  bool baterry = true;

  String choixMontant() {
    String montant = '0';

    if (widget.titre == "Prévision  solde") {
      montant = widget.montantTotals.toStringAsFixed(2);
    } else if (widget.titre == "Prévisions revenus") {
      montant = widget.montantRevenu.toStringAsFixed(2);
    } else if (widget.titre == "Prévisons charges") {
      montant = widget.montantCharge.toStringAsFixed(2);
    } else if (widget.titre == 'Solde live') {
      montant = widget.montantTotalsLive.toStringAsFixed(2);
    } else if (widget.titre == 'Revenu live') {
      montant = widget.montantRevenuLive.toStringAsFixed(2);
    } else if (widget.titre == 'Charge Live') {
      montant = widget.montantChargeLive.toStringAsFixed(2);
    }

    return montant;
  }

  String choixMontantLive() {
    String montant = '0';

    if (widget.titre1 == 'Solde live') {
      montant = widget.montantTotalsLive.toStringAsFixed(2);
    } else if (widget.titre1 == 'Revenu live') {
      montant = widget.montantRevenuLive.toStringAsFixed(2);
    } else if (widget.titre1 == 'Charge Live') {
      montant = widget.montantChargeLive.toStringAsFixed(2);
    }

    return montant;
  }

  Color choixColors() {
    Color montant = Colors.white;

    if (widget.titre == "Prévision  solde" || widget.titre == 'Restants ') {
      if (widget.montantCharge > widget.montantRevenu) {
        montant = Colors.red.shade900;
      } else {
        montant = Colors.green.shade900;
      }
    } else if (widget.titre == "Solde live") {
      if (widget.montantChargeLive > widget.montantRevenuLive) {
        montant = Colors.red.shade900;
      } else {
        montant = Colors.green.shade900;
      }
    } else if (widget.titre == "Prévisions revenus" ||
        widget.titre == 'revenus restants' ||
        widget.titre == 'Revenu live') {
      montant = Colors.green.shade500;
    } else if (widget.titre == "Prévisons charges" ||
        widget.titre == "Charge Live" ||
        widget.titre == "Charges validées") {
      montant = Colors.red.shade500;
    }

    return montant;
  }

  // double soldeLive() {
  //   double montant = 0;

  //   montant = montantTotals() + montantTotalsLive();

  //   if (montant > 0) {
  //     setState(() {
  //       baterry = true;
  //     });
  //   } else {
  //     setState(() {
  //       baterry = false;
  //     });
  //   }

  //   return montant;
  // }

  // bool flipCardTest() {
  //   bool flip = true;
  //   if (montantTotalsLive() > 0 && widget.titre1 == "Solde         validé") {
  //     flip = true;
  //   } else {
  //     flip = false;
  //   }
  //   return flip;
  // }

  @override
  Widget build(BuildContext context) {
    Color choixColorVariable = choixColors();
    return Container(
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
              Icon(
                widget.icones,
                size: 30,
                color: choixColorVariable,
              ), // icon
              // Padding(
              //   padding: const EdgeInsets.all(4.0),
              //   child: Text(
              //     widget.titre1,
              //     style: TextStyle(
              //         fontSize: 13,
              //         color: choixColors(),
              //         fontWeight: FontWeight.bold),
              //     textAlign: TextAlign.center,
              //   ),
              // ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                elevation: 5.0,
                color: choixColorVariable,
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Text(
                    widget.titre1.toUpperCase(),
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 25.0,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      choixMontant() + " \$",
                      style: TextStyle(
                          fontSize: 13,
                          color: choixColorVariable,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ), // text
            ],
          ),
        ),
      ),
    );
  }
}
