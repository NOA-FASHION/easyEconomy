import 'package:easyeconomy/controllers/easy_Controller.dart';
import 'package:easyeconomy/models/easy_economy_models.dart';
import 'package:easyeconomy/screens/gestion_mensuel_live.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pie_chart/flutter_pie_chart.dart';
import 'package:lottie/lottie.dart';
import 'package:marquee_text/marquee_text.dart';

import 'package:provider/provider.dart';

class BuildGestionMensuel extends StatefulWidget {
  BuildGestionMensuel({Key? key}) : super(key: key);

  @override
  _BuildGestionMensuelState createState() => _BuildGestionMensuelState();
}

class _BuildGestionMensuelState extends State<BuildGestionMensuel> {
  double montantChargeLive(
      List<MontantUniverselle> gestionListMontantUniverselleLive) {
    double montants = 0;

    for (var i = gestionListMontantUniverselleLive.length - 1; i >= 0; i--) {
      // print(gestionListMontantUniverselleLive[i].unity.toString());
      if (gestionListMontantUniverselleLive[i].unity.toString() ==
              'unity_Montant_universelle.ChargeFixe' ||
          gestionListMontantUniverselleLive[i].unity.toString() ==
              'unity_Montant_universelle.depensePonctuelle') {
        montants = montants + gestionListMontantUniverselleLive[i].montant;
      }
    }

    return montants;
  }

  double montantRevenuLive(
      List<MontantUniverselle> gestionListMontantUniverselleLive) {
    double montants = 0;

    for (var i = gestionListMontantUniverselleLive.length - 1; i >= 0; i--) {
      if (gestionListMontantUniverselleLive[i].unity.toString() ==
              'unity_Montant_universelle.RevenuFixe' ||
          gestionListMontantUniverselleLive[i].unity.toString() ==
              'unity_Montant_universelle.RevenuPonctuel') {
        montants = montants + gestionListMontantUniverselleLive[i].montant;
      }
    }
    return montants;
  }

  double montantTotalsLive(
      List<MontantUniverselle> gestionListMontantUniverselleLive) {
    double montant = 0;

    for (var i = gestionListMontantUniverselleLive.length - 1; i >= 0; i--) {
      if (gestionListMontantUniverselleLive[i].unity.toString() ==
              'unity_Montant_universelle.ChargeFixe' ||
          gestionListMontantUniverselleLive[i].unity.toString() ==
              'unity_Montant_universelle.depensePonctuelle') {
        montant = montant - gestionListMontantUniverselleLive[i].montant;
      } else if (gestionListMontantUniverselleLive[i].unity.toString() ==
              'unity_Montant_universelle.RevenuFixe' ||
          gestionListMontantUniverselleLive[i].unity.toString() ==
              'unity_Montant_universelle.RevenuPonctuel') {
        montant = montant + gestionListMontantUniverselleLive[i].montant;
      }
    }

    return montant;
  }

  Widget maxLetter(String word) {
    Widget longLetter;

    String word2;

    if (word.length >= 21) {
      longLetter = Container(
        width: MediaQuery.of(context).size.width / 2.9,
        color: Colors.transparent,
        child: MarqueeText(
          text: TextSpan(text: word),
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
          speed: 30,
        ),
      );
      return longLetter;
    } else {
      word2 = word;
      longLetter = Text(
        word2,
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
      );
    }
    return longLetter;
  }

  Widget maxLetterTitre(String word) {
    Widget longLetter;

    String word2;
    if (word.length > 20) {
      longLetter = Container(
        width: MediaQuery.of(context).size.width / 2.4,
        color: Colors.transparent,
        child: MarqueeText(
          text: TextSpan(text: word),
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          speed: 30,
        ),
      );
      return longLetter;
    } else if (word.length > 25) {
      longLetter = Container(
        width: MediaQuery.of(context).size.width / 2,
        color: Colors.transparent,
        child: MarqueeText(
          text: TextSpan(text: word),
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          speed: 30,
        ),
      );
      return longLetter;
    } else {
      word2 = word;
      longLetter = Text(
        word2,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      );
    }
    return longLetter;
  }

  Widget activeGlow(GestionMensuel gestion) {
    double montantTotalsLives =
        montantTotalsLive(gestion.montantUniverselleLive);
    double montantRevenuLives =
        montantRevenuLive(gestion.montantUniverselleLive);
    double montantChargeLives =
        montantChargeLive(gestion.montantUniverselleLive);
    Widget glow = Padding(
      padding: const EdgeInsets.all(1.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          elevation: 15.0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 1.8,
                      height: 25.0,
                      child: Row(
                        children: [
                          Text(
                            "Charges",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, color: Colors.red),
                          ),
                          SizedBox(
                            width: 8.0,
                          ),
                          maxLetter(
                              montantChargeLive(gestion.montantUniverselleLive)
                                      .toStringAsFixed(2) +
                                  " \$"),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 1.8,
                      height: 30.0,
                      child: Row(
                        children: [
                          Text(
                            "Revenus",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.green.shade500),
                          ),
                          SizedBox(
                            width: 6.0,
                          ),
                          Text(
                              montantRevenuLive(gestion.montantUniverselleLive)
                                      .toStringAsFixed(2) +
                                  " \$",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green.shade500)),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 1.8,
                      height: 30.0,
                      child: Row(
                        children: [
                          Text(
                            "Solde",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: montantChargeLives > montantRevenuLives
                                  ? Colors.red.shade900
                                  : Colors.green.shade900,
                            ),
                          ),
                          SizedBox(
                            width: 18.0,
                          ),
                          Text(
                            montantTotalsLive(gestion.montantUniverselleLive)
                                    .toStringAsFixed(2) +
                                " \$",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: montantChargeLives > montantRevenuLives
                                  ? Colors.red.shade900
                                  : Colors.green.shade900,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  width: 80,
                  height: 80,
                  child: FlutterPieChart(
                    pies: [
                      Pie(
                          color: Colors.red.shade500,
                          proportion: montantChargeLives),
                      Pie(
                          color: Colors.green.shade500,
                          proportion: montantRevenuLives),
                      Pie(
                          color: montantChargeLives > montantRevenuLives
                              ? Colors.red.shade900
                              : Colors.green.shade900,
                          proportion: montantTotalsLives > 0
                              ? montantTotalsLives
                              : -montantTotalsLives),
                    ],
                    selected: 2,
                  ),
                ),
                // PieChart(
                //   textScaleFactor: 0.0,
                //   maxWidth: MediaQuery.of(context).size.width / 4.3,
                //   maxHeight: MediaQuery.of(context).size.height / 14,
                //   values: [
                //     (montantTotalsLive(gestion.montantUniverselleLive) /
                //             montantRevenuLive(gestion.montantUniverselleLive)) *
                //         100.roundToDouble(),
                //     (montantChargeLive(gestion.montantUniverselleLive) /
                //             montantRevenuLive(gestion.montantUniverselleLive)) *
                //         100.roundToDouble()
                //   ],
                //   labels: ['Marge', 'frais'],
                //   sliceFillColors: [Colors.greenAccent, Colors.red],
                //   animationDuration: Duration(milliseconds: 1500),
                //   showLegend: false,
                // ),
              ],
            ),
          ),
        ),
      ),
    );

    return glow;
  }

  @override
  Widget build(BuildContext context) {
    EasyController variable = Provider.of<EasyController>(context);
    List<GestionMensuel> _listGestionMensuel = variable.getGestionMensuel();

    if (_listGestionMensuel.isEmpty) {
      return Container(
        alignment: Alignment.center,
        child: Text(
          "Pas de mois en cours.",
          style: TextStyle(color: Colors.orange[600], fontSize: 18.0),
          textAlign: TextAlign.center,
        ),
      );
    }

    return ListView.builder(
      itemCount: _listGestionMensuel.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 3.0, left: 8.0, right: 8.0),
          child: Dismissible(
            onDismissed: (direction) {
              if (direction == DismissDirection.endToStart) {
                variable.removeGestionMensuelle(
                  index: index,
                );
                ScaffoldMessenger.of(context).showSnackBar(_buildSnackBar(
                    content: "les transactions ont bien été supprimées",
                    lotties: 'assets/trash.json'));
              }

              if (direction == DismissDirection.startToEnd) {
                variable.removeGestionMensuelle(
                  index: index,
                );
                ScaffoldMessenger.of(context).showSnackBar(_buildSnackBar(
                    content: "les transactions ont bien été supprimées",
                    lotties: 'assets/trash.json'));
              }
            },
            confirmDismiss: (direction) async {
              if (direction == DismissDirection.startToEnd) {
                final bool? resultat = await showDialog<bool>(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text(
                          "Confirmation",
                          style: TextStyle(color: Colors.blue),
                        ),
                        content: Text("Voulez vous supprimer les transactions"),
                        actions: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context, true);
                            },
                            child: Text("Oui"),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context, false);
                            },
                            child: Text("Non"),
                          )
                        ],
                      );
                    });
                return resultat;
              }
              if (direction == DismissDirection.endToStart) {
                final bool? resultat = await showDialog<bool>(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text(
                          "Confirmation",
                          style: TextStyle(color: Colors.blue),
                        ),
                        content: Text("Voulez vous supprimer les transactions"),
                        actions: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context, true);
                            },
                            child: Text("Oui"),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context, false);
                            },
                            child: Text("Non"),
                          )
                        ],
                      );
                    });
                return resultat;
              }
              return true;
            },
            background: Container(
              color: Colors.red,
              padding: EdgeInsets.only(right: 10.0),
              alignment: Alignment.centerLeft,
              child: Icon(
                Icons.delete,
                size: 55.0,
                color: Colors.white,
              ),
            ),
            secondaryBackground: Container(
              padding: EdgeInsets.only(right: 10.0),
              alignment: Alignment.centerRight,
              color: Colors.red,
              child: Icon(
                Icons.delete,
                size: 55.0,
                color: Colors.white,
              ),
            ),
            key: Key(UniqueKey().toString()),
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 45.0, // soften the shadow
                    spreadRadius: 2.0, //extend the shadow
                    offset: Offset(
                      3.0, // Move to right 10  horizontally
                      3.0, // Move to bottom 10 Vertically
                    ),
                  )
                ],
                borderRadius: BorderRadius.circular(20),
                color: Colors.transparent,
              ),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                elevation: 20.0,
                child: ListTile(
                  onTap: () async {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ChangeNotifierProvider.value(
                            value: variable,
                            child: GestionMensuelLive(
                              idGestionMontantUniverselle:
                                  _listGestionMensuel[index].idGestion,
                              indexMontantUniverselle: index,
                            ))));
                    // Navigator.push(
                    //     context,
                    //     PageTransition(
                    //         duration: const Duration(milliseconds: 1300),
                    //         child: ChangeNotifierProvider.value(
                    //             value: variable,
                    //             child: GestionMensuelLive(
                    //               idGestionMontantUniverselle:
                    //                   _listGestionMensuel[index].idGestion,
                    //               indexMontantUniverselle: index,
                    //             )),
                    //         type: PageTransitionType.rightToLeftWithFade));
                  },
                  title: Container(
                    child: Row(
                      children: [
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          elevation: 15.0,
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Row(
                              children: [
                                Text(
                                  "Mois".toUpperCase(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.purple),
                                ),
                                SizedBox(
                                  width: 5.0,
                                ),
                                maxLetterTitre(_listGestionMensuel[index]
                                    .mois
                                    .toUpperCase()),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                      ],
                    ),
                  ),
                  subtitle: activeGlow(_listGestionMensuel[index]),
                  isThreeLine: true,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  SnackBar _buildSnackBar({@required String? content, String? lotties}) {
    return SnackBar(
      duration: Duration(seconds: 2),
      backgroundColor: Colors.white,
      content: Container(
        height: 80,
        child: Row(
          children: [
            Lottie.asset(lotties!, width: 60),
            Text(
              content!,
              style: TextStyle(color: Colors.purple),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class SizeTransition3 extends PageRouteBuilder {
  final Widget page;

  SizeTransition3(this.page)
      : super(
          pageBuilder: (context, animation, anotherAnimation) => page,
          transitionDuration: Duration(milliseconds: 1000),
          reverseTransitionDuration: Duration(milliseconds: 200),
          transitionsBuilder: (context, animation, anotherAnimation, child) {
            animation = CurvedAnimation(
                curve: Curves.fastLinearToSlowEaseIn,
                parent: animation,
                reverseCurve: Curves.fastOutSlowIn);
            return Align(
              alignment: Alignment.center,
              child: SizeTransition(
                axis: Axis.horizontal,
                sizeFactor: animation,
                child: page,
                axisAlignment: 0,
              ),
            );
          },
        );
}
