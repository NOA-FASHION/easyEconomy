import 'package:easyeconomy/controllers/easy_Controller.dart';
import 'package:easyeconomy/models/easy_economy_models.dart';
import 'package:easyeconomy/screens/build_gestion_mensuel_resultats.dart';
import 'package:easyeconomy/screens/screen_indicateur_montant.dart';
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
    return Material(
      child: Scaffold(
        key: scaffoldkey,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(277.0),
          child: SafeArea(
            child: AppBar(
              title: Text("Transactions validées",
                  style: TextStyle(color: Colors.black)),
              centerTitle: true,
              flexibleSpace: Column(
                children: [
                  Container(
                    height: 110,
                    padding: EdgeInsets.only(top: 30.0),
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/logo1.png',
                      width: 110,
                      height: 110,
                    ),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: <Color>[Colors.orange, Colors.blueAccent])),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10.0),
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ScreenIndicatorMontant(
                                simuOuchargeFixe: simuOuchargeFixe,
                                titre: "Charges validées",
                                icones: Icons.arrow_circle_up,
                                listMontantUniverselle: _listMontantUniverselle,
                                listMontantPrevision:
                                    _listMontantUniverselleLive,
                              ),
                              ScreenIndicatorMontant(
                                simuOuchargeFixe: simuOuchargeFixe,
                                titre: "Revenus Validés",
                                icones: Icons.arrow_circle_down,
                                listMontantUniverselle: _listMontantUniverselle,
                                listMontantPrevision:
                                    _listMontantUniverselleLive,
                              ),
                              ScreenIndicatorMontant(
                                simuOuchargeFixe: simuOuchargeFixe,
                                titre: "Solde validé",
                                icones: Icons.calculate_outlined,
                                listMontantUniverselle: _listMontantUniverselle,
                                listMontantPrevision:
                                    _listMontantUniverselleLive,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: <Color>[Colors.orange, Colors.blueAccent])),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: Shimmer(
          duration: Duration(seconds: 3),
          interval: Duration(seconds: 5),
          color: Colors.white,
          enabled: true,
          direction: ShimmerDirection.fromLTRB(),
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [Colors.orange, Colors.blueAccent])),
            child: BuildGestionMensuelResultats(
              idGestionMontantUniverselle: widget.idGestionMontantUniverselle,
              indexGestionMensuel: widget.indexMontantUniverselle,
            ),
          ),
        ),
      ),
    );
  }
}
