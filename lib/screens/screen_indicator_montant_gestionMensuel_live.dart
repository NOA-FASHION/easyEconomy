import 'package:easyeconomy/models/easy_economy_models.dart';
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
  String montantCharge() {
    double montants = 0;

    for (var i = widget.gestionListMontantUniverselle.length - 1; i >= 0; i--) {
      if (widget.gestionListMontantUniverselle[i].unity.toString() ==
              'unity_Montant_universelle.ChargeFixe' ||
          widget.gestionListMontantUniverselle[i].unity.toString() ==
              'unity_Montant_universelle.depensePonctuelle') {
        montants = montants + widget.gestionListMontantUniverselle[i].montant;
      }
    }
    return montants.toStringAsFixed(2);
  }

  String montantChargeLive() {
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

    return montants.toStringAsFixed(2);
  }

  String montantRevenu() {
    double montants = 0;
    for (var i = widget.gestionListMontantUniverselle.length - 1; i >= 0; i--) {
      if (widget.gestionListMontantUniverselle[i].unity.toString() ==
              'unity_Montant_universelle.RevenuFixe' ||
          widget.gestionListMontantUniverselle[i].unity.toString() ==
              'unity_Montant_universelle.RevenuPonctuel') {
        montants = montants + widget.gestionListMontantUniverselle[i].montant;
      }
    }

    return montants.toStringAsFixed(2);
  }

  String montantRevenuLive() {
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
    return montants.toStringAsFixed(2);
  }

  String montantTotals() {
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

    return montant.toStringAsFixed(2);
  }

  String montantTotalsLive() {
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

    return montant.toStringAsFixed(2);
  }

  String choixMontant() {
    String montant = '0';

    if (widget.titre == "Prévisions Soldes" ||
        widget.titre == 'Soldes restants') {
      montant = montantTotals();
    } else if (widget.titre == "Prévisions revenus" ||
        widget.titre == 'revenus restants') {
      montant = montantRevenu();
    } else if (widget.titre == "Prévisons charges" ||
        widget.titre == "Charges restantes") {
      montant = montantCharge();
    }

    return montant;
  }

  String choixMontantLive() {
    String montant = '0';

    if (widget.titre1 == "Soldes Live") {
      montant = montantTotalsLive();
    } else if (widget.titre1 == "Revenus live") {
      montant = montantRevenuLive();
    } else if (widget.titre1 == "Charges live") {
      montant = montantChargeLive();
    }

    return montant;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  ),
                  Icon(
                    widget.icones,
                    size: 30,
                    color: Colors.white,
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
                          style: TextStyle(fontSize: 13, color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.titre1,
                      style: TextStyle(fontSize: 13, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  // text
                ],
              ),
            ),
          )),
    );
  }
}
