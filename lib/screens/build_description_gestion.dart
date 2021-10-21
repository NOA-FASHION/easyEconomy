import 'dart:io';

import 'package:easyeconomy/controllers/easy_Controller.dart';
import 'package:easyeconomy/models/easy_economy_models.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:marquee_text/marquee_text.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class BuildDescriptionGestion extends StatefulWidget {
  final String idGestionMontantUniverselle;
  final int indexGestionMensuel;
  final int indexGestionMensuelMontantUniv;
  BuildDescriptionGestion(
      {required this.idGestionMontantUniverselle,
      required this.indexGestionMensuel,
      required this.indexGestionMensuelMontantUniv});

  @override
  _BuildDescriptionGestionState createState() =>
      _BuildDescriptionGestionState();
}

class _BuildDescriptionGestionState extends State<BuildDescriptionGestion> {
  FocusNode myFocusNode = FocusNode();
  TextEditingController textEditingControllerAnimated =
      new TextEditingController();
  final picker = ImagePicker();
  bool formation = false;
  late String chapitre;
  var modifDecription1;
  var colors;
  var documentJoint;

  String modifDescription(String description) {
    String modifDecription1 = "Tâche";

    if (description == "achat") {
      modifDecription1 = "Achat";
      return modifDecription1;
    } else if (description == "commentaire") {
      modifDecription1 = "Commentaire";
      return modifDecription1;
    } else if (description == "image") {
      modifDecription1 = "Image";
      return modifDecription1;
    } else if (description == "information") {
      modifDecription1 = "Information";
      return modifDecription1;
    } else if (description == "echeancier") {
      modifDecription1 = "Échéancier";
      return modifDecription1;
    } else if (description == "tache") {
      modifDecription1 = "Tâche";
      return modifDecription1;
    }

    return modifDecription1;
  }

  Color colorsDescription(String description) {
    Color colors = Colors.black;
    if (description == "achat") {
      colors = Colors.cyan;
      return colors;
    } else if (description == "commentaire") {
      colors = Colors.blueGrey;
      return colors;
    } else if (description == "image") {
      colors = Colors.pink;
      return colors;
    } else if (description == "paiement") {
      colors = Colors.yellow;
      return colors;
    } else if (description == "echeancier") {
      colors = Colors.grey;
      return colors;
    }
    return colors;
  }

  Widget echeancierWidget(String description,
      List<DesciprtionUniverselle> listdescript, int index) {
    Widget echeancierWidgets = SizedBox(
      width: 5.0,
    );
    if (description == "echeancier") {
      echeancierWidgets = Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Nombre d'échéances  " +
              listdescript[index].nombreEcheance.toString()),
          SizedBox(
            height: 4.0,
          ),
          Text("Montant échéance  " +
              listdescript[index].echeance.toString() +
              "€"),
        ],
      );
    }

    return echeancierWidgets;
  }

  Widget maxLetter(String word, String comment) {
    Widget longLetter;
    String word2;

    if (word.length > 29 && comment.length <= 5) {
      longLetter = Container(
        width: MediaQuery.of(context).size.width / 2.55,
        color: Colors.transparent,
        child: MarqueeText(
          text: word,
          style: TextStyle(
            color: Colors.black,
          ),
          speed: 30,
        ),
      );
      return longLetter;
    } else if (word.length > 20 && comment.length > 5) {
      longLetter = Container(
        width: MediaQuery.of(context).size.width / 2.55,
        color: Colors.transparent,
        child: MarqueeText(
          text: word,
          style: TextStyle(
            color: Colors.black,
          ),
          speed: 30,
        ),
      );
    } else {
      word2 = word;
      longLetter = Text(word2);
    }
    return longLetter;
  }

  Widget formationEdit(EasyController provider, String description) {
    Widget fomationEdit = SizedBox(
      width: 5.0,
    );
    if (description == "echeancier") {
      fomationEdit = IconButton(
        alignment: Alignment.topRight,
        icon: Icon(
          Icons.edit,
          color: Colors.black,
        ),
        onPressed: () {
          // Navigator.push(
          //     context,
          //     PageTransition(
          //         type: PageTransitionType.bottomToTop,
          //         child: ChangeNotifierProvider.value(
          //             value: provider,
          //             child: PaiementEdit(
          //                 item: item, indexChallenge: widget.indexChallenge))));
        },
      );
      return fomationEdit;
    } else if (description == "achat") {
      fomationEdit = IconButton(
        alignment: Alignment.topRight,
        icon: Icon(
          Icons.edit,
          color: Colors.black,
        ),
        onPressed: () {
          // Navigator.push(
          //     context,
          //     PageTransition(
          //         type: PageTransitionType.bottomToTop,
          //         child: ChangeNotifierProvider.value(
          //             value: provider,
          //             child: AchatEdit(
          //                 item: item, indexChallenge: widget.indexChallenge))));
        },
      );
      return fomationEdit;
    }
    return fomationEdit;
  }

  Widget prixCout(double prix, double cout) {
    Widget prixCout1 = SizedBox(
      width: 5.0,
    );
    if (prix > 0) {
      prixCout1 = Text("Prix : " + prix.toString() + "€");
      return prixCout1;
    } else if (cout > 0) {
      prixCout1 = Text("Montant : " + cout.toString() + "€");
    }
    return prixCout1;
  }

  Widget iconDataJoin(String resultat) {
    Widget documentJoint = Icon(
      Icons.block,
      size: 30.0,
    );
    if (resultat == "image") {
      documentJoint = Icon(
        Icons.photo_size_select_large,
        size: 30.0,
        color: Colors.pink,
      );
      return documentJoint;
    } else if (resultat == "commentaire") {
      documentJoint = Icon(
        Icons.comment,
        size: 30.0,
        color: Colors.blueGrey,
      );
      return documentJoint;
    } else if (resultat == "achat") {
      documentJoint = Icon(
        Icons.shopping_cart,
        size: 30.0,
        color: Colors.cyan,
      );
    } else if (resultat == "information") {
      documentJoint = Icon(
        Icons.info,
        size: 30.0,
        color: Colors.yellow,
      );
    } else if (resultat == "tache") {
      documentJoint = Icon(
        Icons.task,
        size: 30.0,
        color: Colors.blue,
      );
    } else if (resultat == "echeancier") {
      documentJoint = Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(60.0),
        ),
        elevation: 15.0,
        child: Container(
            child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Lottie.asset('assets/bankOut.json', height: 75))),
      );
    }

    return documentJoint;
  }

  void dispose() {
    textEditingControllerAnimated.dispose();
    myFocusNode.dispose();
    super.dispose();
  }

  String unityPattern = "unity_description.";

  @override
  Widget build(BuildContext context) {
    EasyController providerType = Provider.of<EasyController>(context);
    List<DesciprtionUniverselle> ListDesription =
        providerType.getGestionMensuelDescription(
            widget.indexGestionMensuel, widget.indexGestionMensuelMontantUniv);

    // final Challengecontroller provider =
    //     Provider.of<Challengecontroller>(context);
    if (ListDesription.isEmpty) {
      return Container(
        alignment: Alignment.center,
        child: Text(
          "Pas de descrion en cours.",
          style: TextStyle(color: Colors.orange[600], fontSize: 18.0),
          textAlign: TextAlign.center,
        ),
      );
    }
    return ListView.builder(
      itemCount: ListDesription.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 3.0, left: 8.0, right: 8.0),
          child: Dismissible(
            onDismissed: (direction) {
              if (direction == DismissDirection.endToStart) {
                Scaffold.of(context).showSnackBar(_buildSnackBar(
                    content: "La tâche a bien été validé",
                    lotties: 'assets/challenge.json'));
                providerType.removeGestionDescriptionGestion(
                    idGestionMensMontanUniv: widget.idGestionMontantUniverselle,
                    index: index,
                    indexGestionMensMontanUniv:
                        widget.indexGestionMensuelMontantUniv,
                    indexGestionMensuel: widget.indexGestionMensuel);
              }

              if (direction == DismissDirection.startToEnd) {
                Scaffold.of(context).showSnackBar(_buildSnackBar(
                    content: "La mission a bien ete supprime",
                    lotties: 'assets/trash.json'));
                providerType.removeGestionDescriptionGestion(
                    idGestionMensMontanUniv: widget.idGestionMontantUniverselle,
                    index: index,
                    indexGestionMensMontanUniv:
                        widget.indexGestionMensuelMontantUniv,
                    indexGestionMensuel: widget.indexGestionMensuel);
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
                        content: Text("Voulez vous suprimmez la mission"),
                        actions: [
                          RaisedButton(
                            onPressed: () {
                              Navigator.pop(context, true);
                            },
                            child: Text("Oui"),
                          ),
                          RaisedButton(
                            onPressed: () {
                              Navigator.pop(context, false);
                            },
                            child: Text("Nom"),
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
                size: 35.0,
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
                    if (ListDesription[index]
                            .description
                            .toString()
                            .replaceAll(unityPattern, "") ==
                        "commentaire") {
                      // Navigator.push(
                      //     context,
                      //     PageTransition(
                      //         type: PageTransitionType.bottomToTop,
                      //         child: ChangeNotifierProvider.value(
                      //             value: providerType,
                      //             child: PlayCommentaire(
                      //                 nameChallenge: item.name))));

                    } else if (ListDesription[index]
                            .description
                            .toString()
                            .replaceAll(unityPattern, "") ==
                        "image") {
                      // Navigator.push(
                      //     context,
                      //     PageTransition(
                      //         type: PageTransitionType.bottomToTop,
                      //         child: ChangeNotifierProvider.value(
                      //             value: providerType,
                      //             child: Home(
                      //               returnRaccourci: false,
                      //               id: widget.id,
                      //               idChallenge1: item.id,
                      //               namechallenge: item.tache,
                      //             ))));

                    }
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
                                  "Etape".toUpperCase(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.purple),
                                ),
                                SizedBox(
                                  width: 5.0,
                                ),
                                Text(ListDesription[index].name),
                              ],
                            ),
                          ),
                        ),

                        SizedBox(
                          width: 5.0,
                        ),
                        // prixCout(item.prix, item.cout)
                      ],
                    ),
                  ),
                  subtitle: FlipCard(
                    flipOnTouch: formation,
                    direction: FlipDirection.HORIZONTAL, // default
                    front: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        elevation: 20.0,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Container(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Container(
                                            height: 50,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                2.4,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: Colors.white,
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  modifDescription(
                                                      ListDesription[index]
                                                          .description
                                                          .toString()
                                                          .replaceAll(
                                                              unityPattern,
                                                              "")),
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: colorsDescription(
                                                          ListDesription[index]
                                                              .description
                                                              .toString()
                                                              .replaceAll(
                                                                  unityPattern,
                                                                  ""))),
                                                ),
                                                SizedBox(
                                                  width: 9.0,
                                                ),
                                                maxLetter(
                                                    ListDesription[index]
                                                        .name
                                                        .toString(),
                                                    ListDesription[index]
                                                        .description
                                                        .toString()
                                                        .replaceAll(
                                                            unityPattern, "")),
                                              ],
                                            ),
                                          ),
                                          echeancierWidget(
                                              ListDesription[index]
                                                  .description
                                                  .toString()
                                                  .replaceAll(unityPattern, ""),
                                              ListDesription,
                                              index),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 2.0,
                                      ),
                                      iconDataJoin(ListDesription[index]
                                          .description
                                          .toString()
                                          .replaceAll(unityPattern, "")),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    back: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        elevation: 20.0,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                // Container(
                                //   height: 30.0,
                                //   child: Row(
                                //     mainAxisAlignment:
                                //         MainAxisAlignment.spaceBetween,
                                //     children: [
                                //       maxLetter(
                                //           item.formation.chapitre,
                                //           item.description
                                //               .toString()
                                //               .replaceAll(unityPattern, "")),
                                //       SizedBox(
                                //         width: 5.0,
                                //       ),
                                //       maxLetter(
                                //           item.formation.duree,
                                //           item.description
                                //               .toString()
                                //               .replaceAll(unityPattern, "")),
                                //       SizedBox(
                                //         width: 5.0,
                                //       ),
                                //       maxLetter(
                                //           item.formation.theoriePratique,
                                //           item.description
                                //               .toString()
                                //               .replaceAll(unityPattern, "")),
                                //     ],
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  isThreeLine: true,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  SnackBar _buildSnackBar(
      {@required String? content, required String lotties}) {
    return SnackBar(
      backgroundColor: Colors.white,
      content: Container(
        height: 80,
        child: Row(
          children: [
            Lottie.asset(lotties, width: 60),
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
