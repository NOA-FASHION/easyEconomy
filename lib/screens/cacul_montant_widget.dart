import 'package:easyeconomy/controllers/easy_Controller.dart';
import 'package:easyeconomy/models/easy_economy_models.dart';
import 'package:easyeconomy/screens/screen_indicateur_montant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pie_chart/flutter_pie_chart.dart';
import 'package:provider/provider.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class Header extends StatefulWidget {
  final BuildContext context;
  final EasyController variable;
  final bool transactionPasse;
  final List<MontantUniverselle> listMontantUniverselle;
  final List<MontantUniverselle> listMontPrevision;
  final double montantChargesDouble;
  final double montantRevenuDouble;
  final double montantTotalsDouble;
  final bool simuOuchargeFix;
  Header(
      {Key? key,
      required this.listMontPrevision,
      required this.context,
      required this.montantRevenuDouble,
      required this.simuOuchargeFix,
      required this.transactionPasse,
      required this.variable,
      required this.listMontantUniverselle,
      required this.montantChargesDouble,
      required this.montantTotalsDouble})
      : super(key: key);

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    EasyController variable = Provider.of<EasyController>(context);
    return Container(
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
                  CardTitre(
                    simuOuchargeFixe: widget.simuOuchargeFix,
                    transactionPasse: widget.transactionPasse,
                  ),
                  !widget.transactionPasse
                      ? !widget.simuOuchargeFix
                          ? UploadShare(
                              variable: variable,
                            )
                          : ResetBuild(
                              variable: variable,
                            )
                      : SizedBox(
                          width: 1,
                        ),
                  Container(
                    padding: EdgeInsets.all(8),
                    width: 80,
                    height: 80,
                    child: FlutterPieChart(
                      pies: [
                        Pie(
                            color: Colors.red.shade500,
                            proportion: widget.montantChargesDouble),
                        Pie(
                            color: Colors.green.shade500,
                            proportion: widget.montantRevenuDouble),
                        Pie(
                            color: widget.montantChargesDouble >
                                    widget.montantRevenuDouble
                                ? Colors.red.shade900
                                : Colors.green.shade900,
                            proportion: widget.montantTotalsDouble > 0
                                ? widget.montantTotalsDouble
                                : widget.montantTotalsDouble),
                      ],
                      selected: 2,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ScreenIndicatorMontant(
                    simuOuchargeFixe: widget.simuOuchargeFix,
                    titre: "Charges",
                    icones: Icons.arrow_circle_up,
                    listMontantUniverselle: widget.listMontantUniverselle,
                    listMontantPrevision: widget.listMontPrevision,
                    montantCharge:
                        widget.montantChargesDouble.toStringAsFixed(2),
                    montantRevenu:
                        widget.montantRevenuDouble.toStringAsFixed(2),
                    montantTotals:
                        widget.montantTotalsDouble.toStringAsFixed(2),
                  ),
                  ScreenIndicatorMontant(
                    simuOuchargeFixe: widget.simuOuchargeFix,
                    titre: "Revenus",
                    icones: Icons.arrow_circle_down,
                    listMontantUniverselle: widget.listMontantUniverselle,
                    listMontantPrevision: widget.listMontPrevision,
                    montantCharge:
                        widget.montantChargesDouble.toStringAsFixed(2),
                    montantRevenu:
                        widget.montantRevenuDouble.toStringAsFixed(2),
                    montantTotals:
                        widget.montantTotalsDouble.toStringAsFixed(2),
                  ),
                  ScreenIndicatorMontant(
                    simuOuchargeFixe: widget.simuOuchargeFix,
                    titre: "Solde",
                    icones: Icons.calculate_outlined,
                    listMontantUniverselle: widget.listMontantUniverselle,
                    listMontantPrevision: widget.listMontPrevision,
                    montantCharge:
                        widget.montantChargesDouble.toStringAsFixed(2),
                    montantRevenu:
                        widget.montantRevenuDouble.toStringAsFixed(2),
                    montantTotals:
                        widget.montantTotalsDouble.toStringAsFixed(2),
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
  }
}

class CardTitre extends StatelessWidget {
  final bool simuOuchargeFixe;
  final bool transactionPasse;
  const CardTitre(
      {Key? key,
      required this.simuOuchargeFixe,
      required this.transactionPasse})
      : super(key: key);

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
          child: !simuOuchargeFixe
              ? Text(
                  " Charges Fixes".toUpperCase(),
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                )
              : Text(
                  !transactionPasse
                      ? " Simulateur".toUpperCase()
                      : " Transactions validées".toUpperCase(),
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
        ),
      ),
    );
  }
}

class UploadShare extends StatelessWidget {
  final EasyController variable;
  const UploadShare({Key? key, required this.variable}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox.fromSize(
              size: Size(50, 50), // button width and height
              child: ClipOval(
                  child: Material(
                      color: Colors.blue,
                      child: InkWell(
                        // splash color
                        splashColor: Colors.white,
                        onTap: () {
                          variable.uploadChallenge();
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.upload_sharp,
                              size: 20,
                              color: Colors.white,
                            ), // icon
                            Text(
                              "Upload",
                              style:
                                  TextStyle(fontSize: 10, color: Colors.white),
                            ), // text
                          ],
                        ),
                      )))),
        ),
        SizedBox.fromSize(
            size: Size(50, 50), // button width and height
            child: ClipOval(
                child: Material(
                    color: Colors.blue,
                    child: InkWell(
                      // splash color
                      splashColor: Colors.white,
                      onTap: () {
                        variable.writeContent();
                      }, // button pressed
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.share_rounded,
                            size: 20,
                            color: Colors.white,
                          ), // icon
                          Text(
                            "partage",
                            style: TextStyle(fontSize: 10, color: Colors.white),
                          ), // text
                        ],
                      ),
                    )))),
      ],
    );
  }
}

class ResetBuild extends StatelessWidget {
  final EasyController variable;
  Future<Null> delay(int milliseconds) {
    return new Future.delayed(new Duration(milliseconds: milliseconds));
  }

  const ResetBuild({Key? key, required this.variable}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox.fromSize(
          size: Size(50, 50), // button width and height
          child: ClipOval(
              child: Material(
                  color: Colors.blue,
                  child: InkWell(
                    // splash color
                    splashColor: Colors.white,
                    onTap: () async {
                      variable.isLoadingTrue();

                      await delay(2000);
                      variable.isLoadingFalse();
                      showTopSnackBar(
                        context,
                        CustomSnackBar.success(
                          backgroundColor: Colors.blue,
                          icon: Icon(
                            Icons.restore,
                            size: 30,
                            color: Colors.white,
                          ),
                          message: 'reset effectué avec succes',
                        ),
                      );
                      variable.resetListMontantPrevision();
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.restore,
                          size: 20,
                          color: Colors.white,
                        ), // icon
                        Text(
                          "Reset",
                          style: TextStyle(fontSize: 10, color: Colors.white),
                        ), // text
                      ],
                    ),
                  )))),
    );
  }
}
