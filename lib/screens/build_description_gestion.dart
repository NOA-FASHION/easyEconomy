import 'package:easyeconomy/controllers/easy_Controller.dart';
import 'package:easyeconomy/models/easy_economy_models.dart';
import 'package:easyeconomy/screens/play_commentaires.dart';
import 'package:easyeconomy/screens/play_images.dart';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:marquee_text/marquee_text.dart';

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
      echeancierWidgets = Container(
        width: MediaQuery.of(context).size.width / 1.8,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 1.8,
              child: Row(
                children: [
                  Text(
                    "Nombre d'échéances ",
                    style: TextStyle(color: Colors.blue),
                  ),
                  Text(listdescript[index].nombreEcheance.toStringAsFixed(0)),
                ],
              ),
            ),
            SizedBox(
              height: 4.0,
            ),
            Container(
              width: MediaQuery.of(context).size.width / 1.7,
              child: Row(
                children: [
                  Text("Montant échéance ",
                      style: TextStyle(color: Colors.blue)),
                  SizedBox(
                    width: 15.0,
                  ),
                  Text(listdescript[index].echeance.toStringAsFixed(2) + "\$"),
                ],
              ),
            ),
            SizedBox(
              height: 4.0,
            ),
            Container(
              width: MediaQuery.of(context).size.width / 1.7,
              child: Row(
                children: [
                  Text("Echéance en cours ",
                      style: TextStyle(color: Colors.blue)),
                  SizedBox(
                    width: 15.0,
                  ),
                  Text((listdescript[index].echeance *
                              listdescript[index].nombreEcheance)
                          .toStringAsFixed(2) +
                      "\$"),
                ],
              ),
            ),
          ],
        ),
      );
    } else if (description == "achat") {
      echeancierWidgets = Container(
        width: MediaQuery.of(context).size.width / 1.8,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 1.8,
              child: Text("Prix " +
                  listdescript[index].previsions.toStringAsFixed(2) +
                  "\$"),
            ),
          ],
        ),
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
          text: TextSpan(text: word),
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
          text: TextSpan(text: word),
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
      prixCout1 = Text("Prix : " + prix.toString() + "\$");
      return prixCout1;
    } else if (cout > 0) {
      prixCout1 = Text("Montant : " + cout.toString() + "\$");
    }
    return prixCout1;
  }

  Widget activeGlow(DesciprtionUniverselle description, int index,
      List<DesciprtionUniverselle> listDescription) {
    Widget glow = Padding(
      padding: const EdgeInsets.all(1.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white70),
          borderRadius: BorderRadius.circular(15),
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
                      width: MediaQuery.of(context).size.width / 1.65,
                      height: 25.0,
                      child: Row(
                        children: [
                          Text(
                            modifDescription(description.description
                                .toString()
                                .replaceAll(unityPattern, "")),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: colorsDescription(description.description
                                    .toString()
                                    .replaceAll(unityPattern, ""))),
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          maxLetter(
                              description.name.toString(),
                              description.description
                                  .toString()
                                  .replaceAll(unityPattern, "")),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    echeancierWidget(
                        description.description
                            .toString()
                            .replaceAll(unityPattern, ""),
                        listDescription,
                        index),
                  ],
                ),
                iconDataJoin(description.description
                    .toString()
                    .replaceAll(unityPattern, "")),
              ],
            ),
          ),
        ),
      ),
    );

    return glow;
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
                child: Lottie.asset('assets/bankOut.json', height: 50))),
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
          "Pas de description en cours.",
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
                ScaffoldMessenger.of(context).showSnackBar(_buildSnackBar(
                    content: "La tâche a bien été validé",
                    lotties: 'assets/challenge.json'));
                providerType.achatTotals(
                    widget.idGestionMontantUniverselle,
                    widget.indexGestionMensuel,
                    widget.indexGestionMensuelMontantUniv,
                    index);
                providerType.removeGestionDescriptionGestion(
                    idGestionMensMontanUniv: widget.idGestionMontantUniverselle,
                    index: index,
                    indexGestionMensMontanUniv:
                        widget.indexGestionMensuelMontantUniv,
                    indexGestionMensuel: widget.indexGestionMensuel);
              }

              if (direction == DismissDirection.startToEnd) {
                ScaffoldMessenger.of(context).showSnackBar(_buildSnackBar(
                    content: "La description a bien été supprimée",
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
                        content: Text("Voulez vous suprimmez la description"),
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
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ChangeNotifierProvider.value(
                              value: providerType,
                              child: PlayCommentaire(
                                commentaire: ListDesription[index].commentaire,
                              ))));
                      // Navigator.push(
                      //     context,
                      //       WaveTransition(
                      //       center: FractionalOffset(0.90, 0.90),
                      //       duration: Duration(milliseconds: 1000),
                      //         child: ChangeNotifierProvider.value(
                      //             value: providerType,
                      //             child: PlayCommentaire(
                      //               commentaire:
                      //                   ListDesription[index].commentaire,
                      //             ))));
                    } else if (ListDesription[index]
                            .description
                            .toString()
                            .replaceAll(unityPattern, "") ==
                        "image") {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ChangeNotifierProvider.value(
                              value: providerType,
                              child: PlayPicture(
                                patchPicture:
                                    ListDesription[index].adresseImage,
                              ))));
                      // Navigator.push(
                      //     context,
                      //     WaveTransition(
                      //         center: FractionalOffset(0.90, 0.90),
                      //         duration: Duration(milliseconds: 1000),
                      //         child: ChangeNotifierProvider.value(
                      //             value: providerType,
                      //             child: PlayPicture(
                      //               patchPicture:
                      //                   ListDesription[index].adresseImage,
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
                                  "Document".toUpperCase(),
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
                  subtitle:
                      activeGlow(ListDesription[index], index, ListDesription),
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
