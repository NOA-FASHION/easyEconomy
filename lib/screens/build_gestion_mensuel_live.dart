import 'package:currency_textfield/currency_textfield.dart';
import 'package:easyeconomy/controllers/easy_Controller.dart';
import 'package:easyeconomy/models/easy_economy_models.dart';

import 'package:easyeconomy/screens/calcul_montant_mensuel_widget.dart';
import 'package:easyeconomy/screens/description_gestion.dart';
import 'package:easyeconomy/screens/transaction_edit.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:marquee_text/marquee_text.dart';

import 'package:provider/provider.dart';

class BuildGestionMensuelLive extends StatefulWidget {
  final String idGestionMontantUniverselle;
  final int indexGestionMensuel;

  BuildGestionMensuelLive(
      {required this.idGestionMontantUniverselle,
      required this.indexGestionMensuel});

  @override
  _BuildGestionMensuelLiveState createState() =>
      _BuildGestionMensuelLiveState();
}

class _BuildGestionMensuelLiveState extends State<BuildGestionMensuelLive> {
  late String valueText = "";
  late String valueText2 = "";
  var controller = CurrencyTextFieldController(
      currencySymbol: '\$', decimalSymbol: ".", thousandSymbol: ",");
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
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

  Widget formfieldDropDown() {
    return Column(
      children: [
        TextFormField(
          textCapitalization: TextCapitalization.sentences,
          onSaved: (value) {
            setState(() {
              valueText = value!;
            });
          },
          validator: (value) {
            if (value!.isEmpty) {
              return "Merci d'entrer un nouveau titre ";
            }
            return null;
          },
          decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 2.0, color: Colors.blueAccent),
                  borderRadius: BorderRadius.circular(15.0)),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1.0, color: Colors.blueAccent),
                  borderRadius: BorderRadius.circular(15.0)),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              labelText: "Modifier titre",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0))),
        ),
        SizedBox(
          height: 15.0,
        ),
        TextFormField(
          controller: controller,
          textCapitalization: TextCapitalization.sentences,
          onSaved: (value) {
            setState(() {
              valueText2 = controller.doubleValue.toString();
            });
          },
          validator: (value) {
            if (value!.isEmpty) {
              return "Merci d'entrer un nouveau prix ";
            }
            return null;
          },
          decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 2.0, color: Colors.blueAccent),
                  borderRadius: BorderRadius.circular(15.0)),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1.0, color: Colors.blueAccent),
                  borderRadius: BorderRadius.circular(15.0)),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              labelText: "Modifier prix",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0))),
        ),
      ],
    );
  }

  Future<void> _displayTextInputDialog(BuildContext context, int index,
      MontantUniverselle item, EasyController variable, int icon) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            scrollable: true,
            title: Text('Modification'),
            content: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
              ),
              height: 450,
              width: double.maxFinite,
              child: ListView(
                children: [
                  formfieldDropDown(),
                  ChangeNotifierProvider.value(
                    value: variable,
                    child: TransactionEdit(
                      icon: icon,
                      indexGestion: index,
                      item: item,
                      indexGestionMensuel: widget.indexGestionMensuel,
                      typeMontantUniv: '',
                    ),
                  )
                ],
              ),
            ),
            actions: <Widget>[
              IconButton(
                onPressed: () {
                  setState(() {
                    Navigator.pop(context);
                  });
                },
                icon: Icon(Icons.cancel),
                iconSize: 35,
              ),
              IconButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    if (valueText.isNotEmpty) {
                      variable.changeTitreGestionMensuel(
                          indexGestion: index,
                          nom: valueText,
                          indexGestionMensuel: widget.indexGestionMensuel);
                    }
                    if (valueText.isNotEmpty) {
                      variable.changePrixGestionMensuel(
                          indexGestion: index,
                          montant: valueText2,
                          indexGestionMensuel: widget.indexGestionMensuel);
                    }

                    Navigator.pop(context);
                  }
                },
                icon: Icon(Icons.check),
                iconSize: 35,
              ),
            ],
          );
        });
  }

  Widget iconDataJoin(String resultat) {
    Widget documentJoint = Icon(
      Icons.block,
      size: 20.0,
    );
    if (resultat == "unity_Montant_universelle.ChargeFixe") {
      documentJoint = Icon(
        Icons.all_out,
        size: 20.0,
        color: Colors.red.shade900,
      );
      return documentJoint;
    } else if (resultat == "unity_Montant_universelle.depensePonctuelle") {
      documentJoint = Icon(
        Icons.schedule,
        size: 20.0,
        color: Colors.red.shade900,
      );
      return documentJoint;
    } else if (resultat == "unity_Montant_universelle.RevenuFixe") {
      documentJoint = Icon(
        Icons.all_out,
        size: 20.0,
        color: Colors.green.shade900,
      );
      return documentJoint;
    } else if (resultat == "unity_Montant_universelle.RevenuPonctuel") {
      documentJoint = Icon(
        Icons.schedule,
        size: 20.0,
        color: Colors.green.shade900,
      );
      return documentJoint;
    }
    return documentJoint;
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

  String unityPattern = "unity_Montant_universelle.";
  @override
  Widget build(BuildContext context) {
    EasyController variable = Provider.of<EasyController>(context);
    // List<MontantUniverselle> _listMontantUniverselle = variable
    //     .getGestionMontantUniverselle(widget.idGestionMontantUniverselle);
    List<MontantUniverselle> _listMontantUniverselle =
        variable.getIndexGestionMontantUniverselle(widget.indexGestionMensuel);

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

    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.only(top: 20),
      shrinkWrap: true,
      itemCount: _listMontantUniverselle.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 3.0, left: 8.0, right: 8.0),
          child: Dismissible(
            onDismissed: (direction) {
              if (direction == DismissDirection.endToStart) {
                variable.echeancePasseMontanUnive(
                    widget.idGestionMontantUniverselle,
                    widget.indexGestionMensuel,
                    index);
                variable.removeGestionMensuelleMontantUniv(
                  indexGestionMensMontanUniv: index,
                  idGestionMensMontanUniv: widget.idGestionMontantUniverselle,
                  indexGestionMensuel: widget.indexGestionMensuel,
                  validation: true,
                );

                ScaffoldMessenger.of(context).showSnackBar(_buildSnackBar(
                    content: "La transaction à été  valider",
                    lotties: 'assets/challenge.json'));
              }

              if (direction == DismissDirection.startToEnd) {
                variable.removeGestionMensuelleMontantUniv(
                  indexGestionMensMontanUniv: index,
                  idGestionMensMontanUniv: widget.idGestionMontantUniverselle,
                  indexGestionMensuel: widget.indexGestionMensuel,
                  validation: false,
                );
                ScaffoldMessenger.of(context).showSnackBar(_buildSnackBar(
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
                        content: Text("Voulez vous supprimer la transaction"),
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
                color: _listMontantUniverselle[index].previsionsTotal == 1
                    ? Colors.grey
                    : Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                elevation: 20.0,
                child: Container(
                  child: ListTile(
                    onLongPress: () {
                      variable.activeListListGestionMensuel(
                          indexGestion: index,
                          indexGestionMensuel: widget.indexGestionMensuel);
                    },
                    onTap: () async {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ChangeNotifierProvider.value(
                              value: variable,
                              child: DescriptionGestion(
                                idGestionMontantUniverselle:
                                    _listMontantUniverselle[index].id,
                                indexGestionMensuel: widget.indexGestionMensuel,
                                indexGestionMensuelMontantUniv: index,
                              ))));
                      // Navigator.push(
                      //     context,
                      //     WaveTransition(
                      //         center: FractionalOffset(0.90, 0.90),
                      //         duration: Duration(milliseconds: 1000),
                      //         child: ChangeNotifierProvider.value(
                      //             value: variable,
                      //             child: DescriptionGestion(
                      //               idGestionMontantUniverselle:
                      //                   _listMontantUniverselle[index].id,
                      //               indexGestionMensuel:
                      //                   widget.indexGestionMensuel,
                      //               indexGestionMensuelMontantUniv: index,
                      //             ))));
                    },
                    // subtitle: CalculMontantMensuel().activeGlow(
                    //     _listMontantUniverselle[index].previsionsTotal,
                    //     widget.indexGestionMensuel,
                    //     _listMontantUniverselle[index],
                    //     context,
                    //     index,
                    //     _listMontantUniverselle[index],
                    //     variable,
                    //     _listMontantUniverselle[index].icones,
                    //     formKey,
                    //     controller),
                    subtitle: ChangeNotifierProvider.value(
                      value: variable,
                      child: ActiveGlowWidget2(
                        active: _listMontantUniverselle[index].previsionsTotal,
                        context: context,
                        controller: controller,
                        formKey: formKey,
                        gestion: _listMontantUniverselle[index],
                        icon: _listMontantUniverselle[index].icones,
                        index: index,
                        item: _listMontantUniverselle[index],
                        variable: variable,
                        indexGestionMensuel: widget.indexGestionMensuel,
                      ),
                    ),
                  ),
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
