import 'package:draggable_home/draggable_home.dart';
import 'package:easyeconomy/controllers/easy_Controller.dart';
import 'package:easyeconomy/models/easy_economy_models.dart';
import 'package:easyeconomy/screens/build_gestion_mensuel_resultats.dart';
import 'package:easyeconomy/screens/cacul_montant_widget.dart';
import 'package:easyeconomy/screens/calcul_montant.dart';
import 'package:easyeconomy/screens/charge_fixe_mensuel.dart';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class GestionMensuelLiveResultats extends StatefulWidget {
  final String idGestionMontantUniverselle;
  final int indexMontantUniverselle;
  GestionMensuelLiveResultats(
      {required this.idGestionMontantUniverselle,
      required this.indexMontantUniverselle});

  @override
  _GestionMensuelLiveResultatsState createState() =>
      _GestionMensuelLiveResultatsState();
}

class _GestionMensuelLiveResultatsState
    extends State<GestionMensuelLiveResultats> {
  final GlobalKey<ScaffoldState> scaffoldkey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  // late PersistentBottomSheetController _bottomSheetController;
  late String nomCharge;
  late String nomRevenu;
  late bool simuOuchargeFixe;
  double montantCharge = 0;
  String unityChallenge = "depensePonctuelle";

  void initState() {
    super.initState();
    simuOuchargeFixe = true;
  }

  @override
  Widget build(BuildContext context) {
    EasyController variable = Provider.of<EasyController>(context);
    List<MontantUniverselle> _listMontantUniverselle = variable
        .getGestionMontantUniverselle(widget.idGestionMontantUniverselle);
    List<MontantUniverselle> _listMontantUniverselleLive = variable
        .getGestionMontantUniverselleLive(widget.idGestionMontantUniverselle);

    double montantChargessString = CalculMontant().montantCharges(
        _listMontantUniverselle, _listMontantUniverselleLive, simuOuchargeFixe);
    double montantRevenuString = CalculMontant().montantRevenu(
        _listMontantUniverselle, _listMontantUniverselleLive, simuOuchargeFixe);
    double montantTotalsString = CalculMontant().montantTotals(
        _listMontantUniverselle, _listMontantUniverselleLive, simuOuchargeFixe);
    return Material(
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Colors.orange, Colors.blueAccent])),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          key: scaffoldkey,
          body: Shimmer(
            duration: Duration(seconds: 3),
            interval: Duration(seconds: 5),
            color: Colors.white,
            enabled: true,
            direction: ShimmerDirection.fromLTRB(),
            child: DraggableHome(
              backgroundColor: Colors.transparent,
              appBarColor: Colors.orange,
              body: [
                Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [Colors.orange, Colors.blueAccent])),
                  child: BuildGestionMensuelResultats(
                    idGestionMontantUniverselle:
                        widget.idGestionMontantUniverselle,
                    indexGestionMensuel: widget.indexMontantUniverselle,
                  ),
                ),
              ],
              headerWidget: Header(
                context: context,
                variable: variable,
                listMontantUniverselle: _listMontantUniverselle,
                listMontPrevision: _listMontantUniverselleLive,
                montantChargesDouble: montantChargessString,
                montantRevenuDouble: montantRevenuString,
                montantTotalsDouble: montantTotalsString,
                simuOuchargeFix: simuOuchargeFixe,
                transactionPasse: false,
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RaccourciMontant(
                    montant: montantChargessString,
                    colors: Colors.red.shade900,
                  ),
                  RaccourciMontant(
                    montant: montantRevenuString,
                    colors: Colors.green.shade900,
                  ),
                  RaccourciMontant(
                    montant: montantTotalsString,
                    colors: Colors.blue.shade900,
                  ),
                  // Card(
                  //   color: Colors.orange,
                  //   shape: RoundedRectangleBorder(
                  //     borderRadius: BorderRadius.circular(10.0),
                  //   ),
                  //   elevation: 25.0,
                  //   child: Container(
                  //     decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.circular(10),
                  //         color: Colors.white),
                  //     child: Padding(
                  //       padding: const EdgeInsets.all(8.0),
                  //       child: Text(
                  //         montantChargessString.toStringAsFixed(2) + " €",
                  //         style: TextStyle(
                  //             fontSize: 13,
                  //             color: Colors.red.shade900,
                  //             fontWeight: FontWeight.bold),
                  //         textAlign: TextAlign.center,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // Card(
                  //   color: Colors.orange,
                  //   shape: RoundedRectangleBorder(
                  //     borderRadius: BorderRadius.circular(10.0),
                  //   ),
                  //   elevation: 25.0,
                  //   child: Container(
                  //     decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.circular(10),
                  //         color: Colors.white),
                  //     child: Padding(
                  //       padding: const EdgeInsets.all(8.0),
                  //       child: Text(
                  //         montantRevenuString.toStringAsFixed(2) + " €",
                  //         style: TextStyle(
                  //             fontSize: 13,
                  //             color: Colors.green.shade900,
                  //             fontWeight: FontWeight.bold),
                  //         textAlign: TextAlign.center,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // Card(
                  //   color: Colors.orange,
                  //   shape: RoundedRectangleBorder(
                  //     borderRadius: BorderRadius.circular(10.0),
                  //   ),
                  //   elevation: 25.0,
                  //   child: Container(
                  //     decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.circular(10),
                  //         color: Colors.white),
                  //     child: Padding(
                  //       padding: const EdgeInsets.all(8.0),
                  //       child: Text(
                  //         montantTotalsString.toStringAsFixed(2) + " €",
                  //         style: TextStyle(
                  //             fontSize: 13,
                  //             color: Colors.blue.shade900,
                  //             fontWeight: FontWeight.bold),
                  //         textAlign: TextAlign.center,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
