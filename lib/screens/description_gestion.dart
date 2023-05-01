import 'package:currency_textfield/currency_textfield.dart';
import 'package:easyeconomy/controllers/easy_Controller.dart';
import 'package:easyeconomy/models/easy_economy_models.dart';
import 'package:easyeconomy/screens/build_description_gestion.dart';
import 'package:easyeconomy/screens/screen_achat.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:nanoid/nanoid.dart';
import 'package:provider/provider.dart';

import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class DescriptionGestion extends StatefulWidget {
  final String idGestionMontantUniverselle;
  final int indexGestionMensuel;
  final int indexGestionMensuelMontantUniv;
  DescriptionGestion(
      {required this.idGestionMontantUniverselle,
      required this.indexGestionMensuel,
      required this.indexGestionMensuelMontantUniv});

  @override
  _DescriptionGestionState createState() => _DescriptionGestionState();
}

class _DescriptionGestionState extends State<DescriptionGestion> {
  var controller = CurrencyTextFieldController(
      currencySymbol: '\$', decimalSymbol: ".", thousandSymbol: ",");
  var controller1 = CurrencyTextFieldController(
      currencySymbol: '\$', decimalSymbol: ".", thousandSymbol: ",");
  bool isSwitched = false;
  String unityPattern = "unity_challenge1.";
  // late String idChallenge1;
  String nombreEchenace = '0';
  // late String nomAdresse;
  // late String villeAdresse;
  // late String adresse;
  // late String telephone;
  // late String paysAdresse;
  String prixProduit = '0';
  String coutPaiment = '0';
  late List<String> docPaths;
  late String _image;

  late String wait = "assets/wait.json";
  final picker = ImagePicker();
  late bool _visibility1 = true;

  Future getImageCamera() async {
    _bottomSheetController.setState!(() {
      _changeVisibility(false);
    });
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        coutPaiment = "0";
        prixProduit = "0";
        dataJoin = pickedFile.path;
        _image = pickedFile.path;
        _bottomSheetController.setState!(() {
          wait = "assets/picture.json";
        });
      } else {
        print('No image selected.');
      }
    });
  }

  void interditAchat(
      List<MontantUniverselle> _montantUniverselleAchat, dynamic context) {
    for (var i = _montantUniverselleAchat[widget.indexGestionMensuelMontantUniv]
                .descriptionUniverselle
                .length -
            1;
        i >= 0;
        i--) {
      if (_montantUniverselleAchat[widget.indexGestionMensuelMontantUniv]
              .descriptionUniverselle[i]
              .previsions >
          0) {
        showTopSnackBar(
          context,
          CustomSnackBar.success(
            backgroundColor: Colors.blue,
            icon: Icon(
              Icons.delete,
              size: 30,
              color: Colors.white,
            ),
            message:
                "vous ne pouvez pas mélanger un achat avec une information ordinaire.",
          ),
        );
        retour();
        return;
      }
    }
  }

  bool achatValid(List<DesciprtionUniverselle> listDesription) {
    for (var i = listDesription.length - 1; i >= 0; i--) {
      if (listDesription[i].previsions > 0) {
        return true;
      }
    }
    return false;
  }

  void interditecheance(
      List<MontantUniverselle> _montantUniverselleAchat, dynamic context) {
    for (var i = _montantUniverselleAchat[widget.indexGestionMensuelMontantUniv]
                .descriptionUniverselle
                .length -
            1;
        i >= 0;
        i--) {
      if (_montantUniverselleAchat[widget.indexGestionMensuelMontantUniv]
              .descriptionUniverselle[i]
              .echeance >
          0) {
        showTopSnackBar(
          context,
          CustomSnackBar.success(
            backgroundColor: Colors.blue,
            icon: Icon(
              Icons.delete,
              size: 30,
              color: Colors.white,
            ),
            message:
                "vous ne pouvez pas mélanger une échéance avec une information ordinaire.",
          ),
        );
        retour();
        return;
      }
      return;
    }
  }

  Future<Null> delay(int milliseconds) {
    return new Future.delayed(new Duration(milliseconds: milliseconds));
  }

  retour() async {
    await delay(500);
    Navigator.pop(context);
    unityChallenge = "information";
  }

  Future getImageGallery() async {
    _bottomSheetController.setState!(() {
      _changeVisibility(false);
    });
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        coutPaiment = "0";
        prixProduit = "0";
        dataJoin = pickedFile.path;
        _image = pickedFile.path;
        _bottomSheetController.setState!(() {
          wait = "assets/picture.json";
        });
      } else {
        print('No image selected.');
      }
    });
  }

  void _changeVisibility(bool visibility) {
    setState(() {
      _visibility1 = visibility;
    });
  }

  bool isNumericUsingRegularExpression(String string) {
    final numericRegex = RegExp(r'^-?(([0-9]*)|(([0-9]*)\.([0-9]*)))$');

    return numericRegex.hasMatch(string);
  }

  void initState() {
    super.initState();
    coutPaiment = "0";
    prixProduit = "0";
  }

  late bool idChallengeBool1;
  late bool idChallengePaimentBool1;
  late bool idChallengeEcheanceBool1;
  late bool idChalEcheanceAutoBool1;

  late final bool animatedpadding;
  // late final String something;
  late final int indexChallenge;
  late String dataJoin;

  // _HomeTachesState(this.indexChallenge, this.something, this.animatedpadding);
  final GlobalKey<ScaffoldState> scaffoldkeyTache = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> formKeyTache = GlobalKey<FormState>();
  late PersistentBottomSheetController _bottomSheetController;
  String unityChallenge = "information";
  late String targetChallenge;
  // late String totalChallengeEnCours;
  int totaChallengeEnCours1 = 0;
  double percentok = 0;
  String commentaire = '';
  // String percentokString = "0";
  double percentage(String percent) {
    var percent1;

    percent1 = (double.parse(percent) / 100);
    return percent1;
  }

  Widget selectdropdown(String resultat,
      List<MontantUniverselle> montantUniverselleAchat, dynamic context) {
    Widget documentJoint = SizedBox(
      width: 1.0,
    );
    if (resultat == "image") {
      documentJoint = Column(
        children: [
          Offstage(
            offstage: _visibility1,
            child: Container(
              height: 100,
              width: 100,
              child: Center(child: Lottie.asset(wait)),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                  onTap: () async {
                    getImageGallery();
                  },
                  child: Container(
                      width: 120.0,
                      height: 120.0,
                      child: Lottie.asset('assets/upload.json'))),
              SizedBox(
                width: 15.0,
              ),
              InkWell(
                  onTap: () async {
                    getImageCamera();
                  },
                  child: Container(
                      width: 120.0,
                      height: 120.0,
                      child: Lottie.asset('assets/photo.json'))),
            ],
          ),
        ],
      );
    } else if (resultat == "tache" || resultat == "information") {
      nombreEchenace = '0';
      coutPaiment = "0";
      prixProduit = "0";
      commentaire = "value!";
      _image = '';
    } else if (resultat == "commentaire") {
      documentJoint = SizedBox(
        width: 200.0,
        height: 300.0,
        child: TextFormField(
          textCapitalization: TextCapitalization.sentences,
          maxLines: 30,
          onSaved: (value) {
            nombreEchenace = '0';
            coutPaiment = "0";
            prixProduit = "0";
            commentaire = value!;
          },
          validator: (value) {
            if (value!.isEmpty) {
              return "Merci de laisser un commentaire";
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
              labelText: "Commentaire",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0))),
        ),
      );
    } else if (resultat == "achat") {
      interditecheance(montantUniverselleAchat, context);
      documentJoint = Row(
        children: [
          Container(
            width: 130,
            child: TextFormField(
              controller: controller,
              onSaved: (value) {
                commentaire = "";
                coutPaiment = "0";
                nombreEchenace = '0';
                prixProduit = controller.doubleValue.toString();
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return "Rentrer un prix";
                }
                return null;
              },
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 2.0, color: Colors.blueAccent),
                      borderRadius: BorderRadius.circular(15.0)),
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 1.0, color: Colors.blueAccent),
                      borderRadius: BorderRadius.circular(15.0)),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  labelText: "Prix",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0))),
            ),
          ),
          Text("\$")
        ],
      );
    } else if (resultat == "echeancier") {
      interditAchat(montantUniverselleAchat, context);
      documentJoint = Row(
        children: [
          Column(
            children: [
              Container(
                width: 120,
                child: TextFormField(
                  controller: controller1,
                  onSaved: (value) {
                    commentaire = "";
                    prixProduit = '0';
                    prixProduit = "0";
                    coutPaiment = controller1.doubleValue.toString();
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Rentrer un prix";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 2.0, color: Colors.blueAccent),
                          borderRadius: BorderRadius.circular(15.0)),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1.0, color: Colors.blueAccent),
                          borderRadius: BorderRadius.circular(15.0)),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      labelText: "Échéance",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0))),
                ),
              ),
              SizedBox(
                height: 7.0,
              ),
              Container(
                width: 200,
                child: TextFormField(
                  onSaved: (value) {
                    nombreEchenace = value!;
                  },
                  validator: (value) {
                    if (!isNumericUsingRegularExpression(value!)) {
                      return "Nombre d'échéance";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 2.0, color: Colors.blueAccent),
                          borderRadius: BorderRadius.circular(15.0)),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1.0, color: Colors.blueAccent),
                          borderRadius: BorderRadius.circular(15.0)),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      labelText: "Nombre d'échéance",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0))),
                ),
              ),
            ],
          ),
        ],
      );
    }
    return documentJoint;
  }

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  @override
  @override
  Widget build(BuildContext context) {
    EasyController providerType = Provider.of<EasyController>(context);
    List<DesciprtionUniverselle> listDesription =
        providerType.getGestionMensuelDescription(
            widget.indexGestionMensuel, widget.indexGestionMensuelMontantUniv);
    List<double> GestionMensListAchat = providerType.getGestionMensuelListAchat(
        widget.indexGestionMensuel, widget.indexGestionMensuelMontantUniv);
    return Scaffold(
      key: scaffoldkeyTache,
      appBar: PreferredSize(
        preferredSize:
            (achatValid(listDesription) || GestionMensListAchat.length > 0)
                ? Size.fromHeight(246.0)
                : Size.fromHeight(111.0),
        child: SafeArea(
          child: AppBar(
            title: Text("Documentation",
                style: TextStyle(color: Colors.black, fontSize: 17)),
            centerTitle: true,
            flexibleSpace: Column(
              children: [
                Container(
                  height: 110,
                  padding: EdgeInsets.only(top: 30.0),
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/logo1.png',
                    width: 80,
                    height: 80,
                  ),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: <Color>[Colors.orange, Colors.blueAccent])),
                ),
                (achatValid(listDesription) || GestionMensListAchat.length > 0)
                    ? Container(
                        padding: EdgeInsets.only(top: 10.0),
                        alignment: Alignment.center,
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ScreenAchat(
                              listDesription: listDesription,
                              achat: GestionMensListAchat,
                            )),
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: <Color>[
                              Colors.orange,
                              Colors.blueAccent
                            ])),
                      )
                    : SizedBox(height: 1),
              ],
            ),
          ),
        ),
      ),
      body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: <Color>[Colors.orange, Colors.blueAccent])),
          child: BuildDescriptionGestion(
            idGestionMontantUniverselle: widget.idGestionMontantUniverselle,
            indexGestionMensuel: widget.indexGestionMensuel,
            indexGestionMensuelMontantUniv:
                widget.indexGestionMensuelMontantUniv,
          )),
      backgroundColor: Color(0xff414a4c),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: buildBottomSheet(),
    );
  }

  updateController(dynamic value) {
    _bottomSheetController.setState!(() {
      unityChallenge = value;
    });
  }

  FloatingActionButton buildBottomSheet() {
    EasyController variable = Provider.of<EasyController>(context);
    List<MontantUniverselle> montantUniverselleAchat =
        variable.getGestionMensuelAchat(widget.indexGestionMensuel);
    return FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.orange[900],
        onPressed: () {
          _image = "";
          _bottomSheetController =
              scaffoldkeyTache.currentState!.showBottomSheet(
            (context) {
              return Container(
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: Form(
                    key: formKeyTache,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ListView(
                        children: [
                          DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    // borderSide: BorderSide(
                                    //     width: 2.0, color: Colors.blueAccent),
                                    borderRadius: BorderRadius.circular(15.0)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 1.0, color: Colors.blueAccent),
                                    borderRadius: BorderRadius.circular(15.0)),
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.0))),
                            value: unityChallenge,
                            onChanged: (value) {
                              updateController(value);
                              _visibility1 = true;
                              wait = "assets/wait.json";
                            },
                            onSaved: (value) {
                              updateController(value);
                            },
                            items: <DropdownMenuItem<String>>[
                              DropdownMenuItem(
                                value: "achat",
                                child: Row(
                                  children: [
                                    Icon(Icons.shopping_cart,
                                        size: 30.0, color: Colors.cyan),
                                    SizedBox(width: 10),
                                    Text(
                                      "Achat",
                                      style: TextStyle(
                                        color: Colors.cyan,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              DropdownMenuItem(
                                value: "tache",
                                child: Row(
                                  children: [
                                    Icon(Icons.event_available,
                                        size: 30.0, color: Colors.orange),
                                    SizedBox(width: 10),
                                    Text(
                                      "Tâche",
                                      style: TextStyle(
                                        color: Colors.orange,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              DropdownMenuItem(
                                value: "information",
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.perm_device_information,
                                      size: 30.0,
                                    ),
                                    SizedBox(width: 10),
                                    Text("Information"),
                                  ],
                                ),
                              ),
                              DropdownMenuItem(
                                value: "commentaire",
                                child: Row(
                                  children: [
                                    Icon(Icons.comment,
                                        size: 30.0, color: Colors.blueGrey),
                                    SizedBox(width: 10),
                                    Text(
                                      "Commentaire",
                                      style: TextStyle(
                                        color: Colors.blueGrey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              DropdownMenuItem(
                                value: "image",
                                child: Row(
                                  children: [
                                    Icon(Icons.text_fields,
                                        size: 30.0, color: Colors.pink),
                                    SizedBox(width: 10),
                                    Text(
                                      "Image",
                                      style: TextStyle(
                                        color: Colors.pink,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          TextFormField(
                            textCapitalization: TextCapitalization.sentences,
                            onSaved: (value) {
                              targetChallenge = value!;
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Merci d'entrer une description pour la mission";
                              } else if (value.length > 35) {
                                return "Pas plus de 50 caractères";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 2.0, color: Colors.blueAccent),
                                  borderRadius: BorderRadius.circular(15.0)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1.0, color: Colors.blueAccent),
                                  borderRadius: BorderRadius.circular(15.0)),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              labelText: "Description",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0)),
                            ),
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          selectdropdown(
                              unityChallenge, montantUniverselleAchat, context),
                          Center(
                            child: IconButton(
                              iconSize: 60,
                              alignment: Alignment.topRight,
                              icon: Icon(
                                Icons.check_circle,
                                color: Colors.orange[900],
                              ),
                              onPressed: () {
                                if (formKeyTache.currentState!.validate()) {
                                  formKeyTache.currentState!.save();
                                  setState(() {
                                    Provider.of<EasyController>(context,
                                            listen: false)
                                        .addDescriptionGestion(
                                            achat: [],
                                            adresseImage: _image,
                                            commentaire: commentaire,
                                            description: unityChallenge,
                                            echeance: double.parse(coutPaiment),
                                            nombreEcheance:
                                                double.parse(nombreEchenace),
                                            id: nanoid(10),
                                            indexGestionMensuel:
                                                widget.indexGestionMensuel,
                                            indexGestionMensuelMontantUniv: widget
                                                .indexGestionMensuelMontantUniv,
                                            name: targetChallenge,
                                            previsions:
                                                double.parse(prixProduit));
                                  });
                                  Navigator.pop(context);
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ));
            },
          );
        });
  }
}
