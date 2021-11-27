import 'package:easyeconomy/models/easy_economy_models.dart';
import 'package:flutter/material.dart';

class ScreenIndicatorMontant extends StatefulWidget {
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
      required this.listMontantUniverselle});

  @override
  _ScreenIndicatorMontantState createState() => _ScreenIndicatorMontantState();
}

class _ScreenIndicatorMontantState extends State<ScreenIndicatorMontant> {
  String montantCharge() {
    double montants = 0;
    if (!widget.simuOuchargeFixe) {
      for (var i = widget.listMontantUniverselle.length - 1; i >= 0; i--) {
        print(widget.listMontantUniverselle[i].unity.toString());
        if (widget.listMontantUniverselle[i].unity.toString() ==
            'unity_Montant_universelle.ChargeFixe') {
          montants = montants + widget.listMontantUniverselle[i].montant;
        }
      }
    } else if (widget.simuOuchargeFixe) {
      for (var i = widget.listMontantPrevision.length - 1; i >= 0; i--) {
        print(widget.listMontantPrevision[i].unity.toString());
        if (widget.listMontantPrevision[i].unity.toString() ==
                'unity_Montant_universelle.ChargeFixe' ||
            widget.listMontantPrevision[i].unity.toString() ==
                'unity_Montant_universelle.depensePonctuelle') {
          montants = montants + widget.listMontantPrevision[i].montant;
        }
      }
    }

    return montants.toStringAsFixed(2);
  }

  String montantRevenu() {
    double montants = 0;
    if (!widget.simuOuchargeFixe) {
      for (var i = widget.listMontantUniverselle.length - 1; i >= 0; i--) {
        if (widget.listMontantUniverselle[i].unity.toString() ==
            'unity_Montant_universelle.RevenuFixe') {
          montants = montants + widget.listMontantUniverselle[i].montant;
        }
      }
    } else if (widget.simuOuchargeFixe) {
      for (var i = widget.listMontantPrevision.length - 1; i >= 0; i--) {
        if (widget.listMontantPrevision[i].unity.toString() ==
                'unity_Montant_universelle.RevenuFixe' ||
            widget.listMontantPrevision[i].unity.toString() ==
                'unity_Montant_universelle.RevenuPonctuel') {
          montants = montants + widget.listMontantPrevision[i].montant;
        }
      }
    }
    return montants.toStringAsFixed(2);
  }

  String montantTotals() {
    double montant = 0;
    if (!widget.simuOuchargeFixe) {
      for (var i = widget.listMontantUniverselle.length - 1; i >= 0; i--) {
        if (widget.listMontantUniverselle[i].unity.toString() ==
            'unity_Montant_universelle.ChargeFixe') {
          montant = montant - widget.listMontantUniverselle[i].montant;
        } else if (widget.listMontantUniverselle[i].unity.toString() ==
            'unity_Montant_universelle.RevenuFixe') {
          montant = montant + widget.listMontantUniverselle[i].montant;
        }
      }
    } else if (widget.simuOuchargeFixe) {
      for (var i = widget.listMontantPrevision.length - 1; i >= 0; i--) {
        if (widget.listMontantPrevision[i].unity.toString() ==
                'unity_Montant_universelle.ChargeFixe' ||
            widget.listMontantPrevision[i].unity.toString() ==
                'unity_Montant_universelle.depensePonctuelle') {
          montant = montant - widget.listMontantPrevision[i].montant;
        } else if (widget.listMontantPrevision[i].unity.toString() ==
                'unity_Montant_universelle.RevenuFixe' ||
            widget.listMontantPrevision[i].unity.toString() ==
                'unity_Montant_universelle.RevenuPonctuel') {
          montant = montant + widget.listMontantPrevision[i].montant;
        }
      }
    }

    return montant.toStringAsFixed(2);
  }

  String choixMontant() {
    String montant = '0';

    if (widget.titre == "Prévision  solde" ||
        widget.titre == "Solde         validé") {
      montant = montantTotals();
    } else if (widget.titre == "Prévisions revenus" ||
        widget.titre == "Revenus Validés") {
      montant = montantRevenu();
    } else if (widget.titre == "Prévisons charges" ||
        widget.titre == "Charges validées") {
      montant = montantCharge();
    }

    return montant;
  }

  Color choixColors() {
    Color montant = Colors.white;

    if (widget.titre == "Prévision  solde" || widget.titre == "Solde  validé") {
      montant = Colors.white;
    } else if (widget.titre == "Prévisions revenus" ||
        widget.titre == "Revenus Validés") {
      montant = Colors.green.shade900;
    } else if (widget.titre == "Prévisons charges" ||
        widget.titre == "Charges validées") {
      montant = Colors.red.shade900;
    }

    return montant;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 3.2,
      height: 140,
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
                  Icon(
                    widget.icones,
                    size: 30,
                    color: choixColors(),
                  ), // icon
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
                          choixMontant() + " €",
                          style: TextStyle(
                              fontSize: 13,
                              color: choixColors(),
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
