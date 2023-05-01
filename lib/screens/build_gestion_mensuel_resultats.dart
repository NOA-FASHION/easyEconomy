import 'package:easyeconomy/controllers/easy_Controller.dart';
import 'package:easyeconomy/models/easy_economy_models.dart';
import 'package:easyeconomy/screens/cacul_montant_widget.dart';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:marquee_text/marquee_text.dart';

import 'package:provider/provider.dart';

class BuildGestionMensuelResultats extends StatefulWidget {
  final String idGestionMontantUniverselle;
  final int indexGestionMensuel;
  BuildGestionMensuelResultats(
      {required this.idGestionMontantUniverselle,
      required this.indexGestionMensuel});

  @override
  _BuildGestionMensuelResultatsState createState() =>
      _BuildGestionMensuelResultatsState();
}

class _BuildGestionMensuelResultatsState
    extends State<BuildGestionMensuelResultats> {
  Widget activeGlow(MontantUniverselle gestion) {
    Widget glow = Padding(
      padding: const EdgeInsets.all(1.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: colorsDescription(gestion.unity.toString()),
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
                      width: MediaQuery.of(context).size.width / 1.45,
                      height: 25.0,
                      child: Row(
                        children: [
                          Text(
                            "Type de montant",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blue),
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          maxLetter(
                            gestion.unity
                                .toString()
                                .replaceAll(unityPattern, "")
                                .toUpperCase(),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 1.45,
                      height: 30.0,
                      child: Row(
                        children: [
                          Text(
                            "Montant",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blue),
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            gestion.montant.toStringAsFixed(2) + " \$",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(60.0),
                  ),
                  elevation: 15.0,
                  child: Container(
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(40.0),
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Icon(
                            IconData(gestion.icones,
                                fontFamily: 'MaterialIcons'),
                            color: colorsDescription(gestion.unity.toString()),
                          ),
                        )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

    return glow;
  }

  Color colorsDescription(String description) {
    Color colors = Colors.black;
    if (description == "unity_Montant_universelle.ChargeFixe") {
      colors = Colors.red.shade900;
      return colors;
    } else if (description == "unity_Montant_universelle.depensePonctuelle") {
      colors = Colors.red.shade900;
      return colors;
    } else if (description == "unity_Montant_universelle.RevenuFixe") {
      colors = Colors.green.shade900;
      return colors;
    } else if (description == "unity_Montant_universelle.RevenuPonctuel") {
      colors = Colors.green.shade900;
      return colors;
    }
    return colors;
  }

  // Widget iconDataJoin(String resultat) {
  //   Widget documentJoint = Icon(
  //     Icons.block,
  //     size: 20.0,
  //   );
  //   if (resultat == "unity_Montant_universelle.ChargeFixe") {
  //     documentJoint = Icon(
  //       Icons.all_out,
  //       size: 20.0,
  //       color: Colors.red.shade900,
  //     );
  //     return documentJoint;
  //   } else if (resultat == "unity_Montant_universelle.depensePonctuelle") {
  //     documentJoint = Icon(
  //       Icons.schedule,
  //       size: 20.0,
  //       color: Colors.red.shade900,
  //     );
  //     return documentJoint;
  //   } else if (resultat == "unity_Montant_universelle.RevenuFixe") {
  //     documentJoint = Icon(
  //       Icons.all_out,
  //       size: 20.0,
  //       color: Colors.green.shade900,
  //     );
  //     return documentJoint;
  //   } else if (resultat == "unity_Montant_universelle.RevenuPonctuel") {
  //     documentJoint = Icon(
  //       Icons.schedule,
  //       size: 20.0,
  //       color: Colors.green.shade900,
  //     );
  //     return documentJoint;
  //   }
  //   return documentJoint;
  // }

  Widget maxLetter(String word) {
    Widget longLetter;

    String word2;

    if (word.length >= 21) {
      longLetter = Container(
        width: MediaQuery.of(context).size.width / 2.9,
        color: Colors.transparent,
        child: MarqueeText(
          text: TextSpan(text: word),
          style: TextStyle(
            color: Colors.black,
          ),
          speed: 30,
        ),
      );
      return longLetter;
    } else {
      word2 = word;
      longLetter = Text(word2);
    }
    return longLetter;
  }

  Widget maxLetterTitre(String word) {
    Widget longLetter;

    String word2;
    if (word.length > 25) {
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

  String unityPattern = "unity_Montant_universelle.";
  @override
  Widget build(BuildContext context) {
    EasyController variable = Provider.of<EasyController>(context);
    // List<MontantUniverselle> _listMontantUniverselle = variable
    //     .getGestionMontantUniverselleLive(widget.idGestionMontantUniverselle);
    List<MontantUniverselle> _listMontantUniverselle = variable
        .getIndexGestionMontantUniverselleLive(widget.indexGestionMensuel);

    if (_listMontantUniverselle.isEmpty) {
      return Container(
        alignment: Alignment.center,
        child: Text(
          "Pas de transaction.",
          style: TextStyle(color: Colors.orange[600], fontSize: 18.0),
          textAlign: TextAlign.center,
        ),
      );
    }

    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: ListView.builder(
              physics: ClampingScrollPhysics(),
              addAutomaticKeepAlives: true,
              itemExtent: 93,
              shrinkWrap: true,
              itemCount: _listMontantUniverselle.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.only(bottom: 3.0, left: 8.0, right: 8.0),
                  child: Dismissible(
                    onDismissed: (direction) {
                      if (direction == DismissDirection.endToStart) {
                        variable.echeanceNoPasseMontanUnive(
                            widget.idGestionMontantUniverselle,
                            widget.indexGestionMensuel,
                            index);
                        variable.removeGestionMensuelleMontantUnivLive(
                          indexGestionMensMontanUniv: index,
                          idGestionMensMontanUniv:
                              widget.idGestionMontantUniverselle,
                          indexGestionMensuel: widget.indexGestionMensuel,
                          validation: true,
                        );

                        ScaffoldMessenger.of(context).showSnackBar(
                            _buildSnackBar(
                                content: "La transaction à été validée",
                                lotties: 'assets/challenge.json'));
                      }

                      if (direction == DismissDirection.startToEnd) {
                        variable.removeGestionMensuelleMontantUnivLive(
                          indexGestionMensMontanUniv: index,
                          idGestionMensMontanUniv:
                              widget.idGestionMontantUniverselle,
                          indexGestionMensuel: widget.indexGestionMensuel,
                          validation: false,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                            _buildSnackBar(
                                content: "La transaction a bien été supprimée",
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
                                content: Text(
                                    "Voulez vous supprimer cette transaction"),
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
                      color: Colors.green,
                      child: Icon(
                        Icons.check,
                        size: 30.0,
                        color: Colors.white,
                      ),
                    ),
                    key: Key(UniqueKey().toString()),
                    // child: Container(
                    //   decoration: BoxDecoration(
                    //     boxShadow: [
                    //       BoxShadow(
                    //         color: Colors.black,
                    //         blurRadius: 45.0, // soften the shadow
                    //         spreadRadius: 2.0, //extend the shadow
                    //         offset: Offset(
                    //           3.0, // Move to right 10  horizontally
                    //           3.0, // Move to bottom 10 Vertically
                    //         ),
                    //       )
                    //     ],
                    //     borderRadius: BorderRadius.circular(20),
                    //     color: Colors.white,
                    //   ),
                    //   child: ListTile(
                    //     leading: Icon(
                    //       IconData(
                    //         _listMontantUniverselle[index].icones,
                    //         fontFamily: 'MaterialIcons',
                    //       ),
                    //       color: colorsDescription(
                    //           _listMontantUniverselle[index].unity.toString()),
                    //     ),
                    //     title: maxLetterTitre(
                    //       _listMontantUniverselle[index].nom,
                    //     ),
                    //     subtitle: Text(
                    //       _listMontantUniverselle[index]
                    //               .montant
                    //               .toStringAsFixed(2) +
                    //           " \$",
                    //       style: TextStyle(
                    //         color: colorsDescription(
                    //             _listMontantUniverselle[index]
                    //                 .unity
                    //                 .toString()),
                    //       ),
                    //     ),
                    //     trailing: Card(
                    //       shape: RoundedRectangleBorder(
                    //         borderRadius: BorderRadius.circular(5.0),
                    //       ),
                    //       elevation: 5.0,
                    //       color: colorsDescription(
                    //           _listMontantUniverselle[index].unity.toString()),
                    //       child: Padding(
                    //         padding: const EdgeInsets.all(3.0),
                    //         child: Text(
                    //           _listMontantUniverselle[index]
                    //               .unity
                    //               .toString()
                    //               .replaceAll(unityPattern, "")
                    //               .toUpperCase(),
                    //           style: TextStyle(
                    //             fontSize: 12,
                    //             fontWeight: FontWeight.bold,
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [Colors.orange, Colors.blueAccent]),
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
                        color:
                            _listMontantUniverselle[index].previsionsTotal == 1
                                ? Colors.grey
                                : Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        elevation: 20.0,
                        child: ListTile(
                          subtitle: ChangeNotifierProvider.value(
                            value: variable,
                            child: ActiveGlow1(
                              active: _listMontantUniverselle[index]
                                  .previsionsTotal,
                              context: context,
                              gestion: _listMontantUniverselle[index],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
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

// class SizeTransition3 extends PageRouteBuilder {
//   final Widget page;

//   SizeTransition3(this.page)
//       : super(
//           pageBuilder: (context, animation, anotherAnimation) => page,
//           transitionDuration: Duration(milliseconds: 1000),
//           reverseTransitionDuration: Duration(milliseconds: 200),
//           transitionsBuilder: (context, animation, anotherAnimation, child) {
//             animation = CurvedAnimation(
//                 curve: Curves.fastLinearToSlowEaseIn,
//                 parent: animation,
//                 reverseCurve: Curves.fastOutSlowIn);
//             return Align(
//               alignment: Alignment.center,
//               child: SizeTransition(
//                 axis: Axis.horizontal,
//                 sizeFactor: animation,
//                 child: page,
//                 axisAlignment: 0,
//               ),
//             );
//           },
//         );
// }
