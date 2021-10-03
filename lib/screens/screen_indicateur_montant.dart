import 'package:easyeconomy/models/easy_economy_models.dart';
import 'package:flutter/material.dart';

class ScreenIndicatorMontant extends StatefulWidget {
  final String titre;
  final IconData icones;
  final List<MontantUniverselle> listMontantUniverselle;
  const ScreenIndicatorMontant(
      {required this.titre,
      required this.icones,
      required this.listMontantUniverselle});

  @override
  _ScreenIndicatorMontantState createState() => _ScreenIndicatorMontantState();
}

class _ScreenIndicatorMontantState extends State<ScreenIndicatorMontant> {
  String montantCharge() {
    double montants = 0;
    for (var i = widget.listMontantUniverselle.length - 1; i >= 0; i--) {
      print(widget.listMontantUniverselle[i].unity.toString());
      if (widget.listMontantUniverselle[i].unity.toString() ==
          'unity_Montant_universelle.ChargeFixe') {
        montants = montants + widget.listMontantUniverselle[i].montant;
      }
    }
    return montants.toString();
  }

  String montantRevenu() {
    double montants = 0;
    for (var i = widget.listMontantUniverselle.length - 1; i >= 0; i--) {
      if (widget.listMontantUniverselle[i].unity.toString() ==
          'unity_Montant_universelle.RevenuFixe') {
        montants = montants + widget.listMontantUniverselle[i].montant;
      }
    }
    return montants.toString();
  }

  String montantTotals() {
    double montant = 0;

    for (var i = widget.listMontantUniverselle.length - 1; i >= 0; i--) {
      if (widget.listMontantUniverselle[i].unity.toString() ==
          'unity_Montant_universelle.ChargeFixe') {
        montant = montant - widget.listMontantUniverselle[i].montant;
      } else if (widget.listMontantUniverselle[i].unity.toString() ==
          'unity_Montant_universelle.RevenuFixe') {
        montant = montant + widget.listMontantUniverselle[i].montant;
      }
    }

    return montant.toString();
  }

  String choixMontant() {
    String montant = '0';

    if (widget.titre == "Solde prévisionnel") {
      montant = montantTotals();
    } else if (widget.titre == "Prévisions revenus") {
      montant = montantRevenu();
    } else if (widget.titre == "Prévisons charges") {
      montant = montantCharge();
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
                    color: Colors.white,
                  ), // icon
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.titre,
                      style: TextStyle(fontSize: 13, color: Colors.white),
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
                          style: TextStyle(fontSize: 13, color: Colors.white),
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
