import 'package:easyeconomy/models/easy_economy_models.dart';
import 'package:flutter/material.dart';

class ScreenIndicatorMontant extends StatefulWidget {
  final String montantTotals;
  final String montantRevenu;
  final String montantCharge;
  final String titre;
  final bool simuOuchargeFixe;
  final IconData icones;
  final List<MontantUniverselle> listMontantUniverselle;
  final List<MontantUniverselle> listMontantPrevision;
  const ScreenIndicatorMontant(
      {required this.titre,
      required this.listMontantPrevision,
      required this.simuOuchargeFixe,
      required this.icones,
      required this.listMontantUniverselle,
      required this.montantTotals,
      required this.montantRevenu,
      required this.montantCharge});

  @override
  _ScreenIndicatorMontantState createState() => _ScreenIndicatorMontantState();
}

class _ScreenIndicatorMontantState extends State<ScreenIndicatorMontant> {
  // String montantCharge() {
  //   double montants = 0;
  //   if (!widget.simuOuchargeFixe) {
  //     for (var i = widget.listMontantUniverselle.length - 1; i >= 0; i--) {
  //       print(widget.listMontantUniverselle[i].unity.toString());
  //       if (widget.listMontantUniverselle[i].unity.toString() ==
  //           'unity_Montant_universelle.ChargeFixe') {
  //         montants = montants + widget.listMontantUniverselle[i].montant;
  //       }
  //     }
  //   } else if (widget.simuOuchargeFixe) {
  //     for (var i = widget.listMontantPrevision.length - 1; i >= 0; i--) {
  //       print(widget.listMontantPrevision[i].unity.toString());
  //       if (widget.listMontantPrevision[i].unity.toString() ==
  //               'unity_Montant_universelle.ChargeFixe' ||
  //           widget.listMontantPrevision[i].unity.toString() ==
  //               'unity_Montant_universelle.depensePonctuelle') {
  //         montants = montants + widget.listMontantPrevision[i].montant;
  //       }
  //     }
  //   }

  //   return montants.toStringAsFixed(2);
  // }

  // String montantRevenu() {
  //   double montants = 0;
  //   if (!widget.simuOuchargeFixe) {
  //     for (var i = widget.listMontantUniverselle.length - 1; i >= 0; i--) {
  //       if (widget.listMontantUniverselle[i].unity.toString() ==
  //           'unity_Montant_universelle.RevenuFixe') {
  //         montants = montants + widget.listMontantUniverselle[i].montant;
  //       }
  //     }
  //   } else if (widget.simuOuchargeFixe) {
  //     for (var i = widget.listMontantPrevision.length - 1; i >= 0; i--) {
  //       if (widget.listMontantPrevision[i].unity.toString() ==
  //               'unity_Montant_universelle.RevenuFixe' ||
  //           widget.listMontantPrevision[i].unity.toString() ==
  //               'unity_Montant_universelle.RevenuPonctuel') {
  //         montants = montants + widget.listMontantPrevision[i].montant;
  //       }
  //     }
  //   }
  //   return montants.toStringAsFixed(2);
  // }

  // String montantTotals() {
  //   double montant = 0;
  //   if (!widget.simuOuchargeFixe) {
  //     for (var i = widget.listMontantUniverselle.length - 1; i >= 0; i--) {
  //       if (widget.listMontantUniverselle[i].unity.toString() ==
  //           'unity_Montant_universelle.ChargeFixe') {
  //         montant = montant - widget.listMontantUniverselle[i].montant;
  //       } else if (widget.listMontantUniverselle[i].unity.toString() ==
  //           'unity_Montant_universelle.RevenuFixe') {
  //         montant = montant + widget.listMontantUniverselle[i].montant;
  //       }
  //     }
  //   } else if (widget.simuOuchargeFixe) {
  //     for (var i = widget.listMontantPrevision.length - 1; i >= 0; i--) {
  //       if (widget.listMontantPrevision[i].unity.toString() ==
  //               'unity_Montant_universelle.ChargeFixe' ||
  //           widget.listMontantPrevision[i].unity.toString() ==
  //               'unity_Montant_universelle.depensePonctuelle') {
  //         montant = montant - widget.listMontantPrevision[i].montant;
  //       } else if (widget.listMontantPrevision[i].unity.toString() ==
  //               'unity_Montant_universelle.RevenuFixe' ||
  //           widget.listMontantPrevision[i].unity.toString() ==
  //               'unity_Montant_universelle.RevenuPonctuel') {
  //         montant = montant + widget.listMontantPrevision[i].montant;
  //       }
  //     }
  //   }

  //   return montant.toStringAsFixed(2);
  // }

  String choixMontant() {
    String montant = '0';

    if (widget.titre == "Solde" || widget.titre == "Solde         validé") {
      montant = widget.montantTotals;
    } else if (widget.titre == "Revenus" || widget.titre == "Revenus Validés") {
      montant = widget.montantRevenu;
    } else if (widget.titre == "Charges" ||
        widget.titre == "Charges validées") {
      montant = widget.montantCharge;
    }

    return montant;
  }

  Color choixColors() {
    Color montant = Colors.white;

    if (widget.titre == "Solde" || widget.titre == "Solde  validé") {
      if (double.parse(widget.montantCharge) >
          double.parse(widget.montantRevenu)) {
        montant = Colors.red.shade900;
      } else {
        montant = Colors.green.shade900;
      }
    } else if (widget.titre == "Revenus" || widget.titre == "Revenus Validés") {
      montant = Colors.green.shade500;
    } else if (widget.titre == "Charges" ||
        widget.titre == "Charges validées") {
      montant = Colors.red.shade500;
    }

    return montant;
  }

  @override
  Widget build(BuildContext context) {
    Color choixColorVariable = choixColors();
    return Container(
      margin: EdgeInsets.only(top: 1),
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
                  Icon(
                    widget.icones,
                    size: 30,
                    color: choixColorVariable,
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    elevation: 5.0,
                    color: choixColorVariable,
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Text(
                        widget.titre.toUpperCase(),
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
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
          )),
    );
  }
}
